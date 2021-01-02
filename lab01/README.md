
<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.0.1
-->



# LAB01 - Single Machine Networking With NAT Networking Adapter
The first networking mode that we will look at is called network address translation (NAT)
networking and is actually the VirtualBox/Vagrant default.

What is the difference between NAT / Bridged / Host-Only networking?

* **Host-Only:** The VM will be assigned one IP, but it's only accessible by the box VM is running on.
No other computers can access it.
*Host-only only permits VM network operations with the Host OS.*
* **NAT:** Just like your home network with a wireless router,
the VM will be assigned in a separate subnet, like `192.168.1.1`is your host computer,
and VM is `192.168.2.1`, then your VM can access outside network like your host,
but no outside access to your VM directly, it's protected.
*NAT mode will mask all VM network activity as if it came from your Host OS, although the VM can access external resources.*
* **Bridged:** Your VM will be in the same network as your host,
if your host IP is `172.16.120.45` then your VM will be like `172.16.120.50`.
It can be accessed by all computers in your host network.
*Bridged mode replicates another node on the physical network and your VM will receive it's own IP address if DHCP is enabled in the network.*

Sources:
* [Virtualization: Bridged, NAT, Host-only - Virtual machine connection types](https://www.youtube.com/watch?v=XCkKDWMYHME)
* [Virtual networking labs – NAT and host-only networking with VirtualBox](https://leftasexercise.com/2019/12/13/virtual-networking-labs-nat-and-host-only-networking-with-virtualbox/)
* [Virtual networking labs – networking-samples](https://github.com/christianb93/networking-samples)


------


# Execute the Lab Exercise
While logged into the boxA VM, run these commands:

```bash
# what network devices are operating
$ ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 02:e2:98:2d:e4:ba brd ff:ff:ff:ff:ff:ff

# what are the ethernet address (TCP/IP 4)
$ ip addr show | grep "inet "
    inet 127.0.0.1/8 scope host lo
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic enp0s3
```

You will find that there are two networking devices.

1. There is the standard loopback device `lo` which is present on every Linux system.
2. There is an interface `enp0s3` which looks like an ordinary Ethernet device.
This device has a MAC address and an Ethernet address assigned to it, default is usually `10.0.2.15`.

The default interface for outgoing traffic to the internet or the host network
is via gateway IP address `10.0.2.2`.
To validate this, perform the following within the VM:

```bash
# list the content of the kernel routing tables
$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         10.0.2.2        0.0.0.0         UG    100    0        0 enp0s3
10.0.2.0        0.0.0.0         255.255.255.0   U     0      0        0 enp0s3
10.0.2.2        0.0.0.0         255.255.255.255 UH    100    0        0 enp0s3

# check if you VM can communicate with the internet
$ ping -4 -c3 -a goolge.com
PING goolge.com (172.253.62.106) 56(84) bytes of data.
64 bytes from 172.253.62.106: icmp_seq=1 ttl=63 time=6.26 ms
64 bytes from 172.253.62.106: icmp_seq=2 ttl=63 time=6.20 ms
64 bytes from 172.253.62.106: icmp_seq=3 ttl=63 time=4.95 ms

--- goolge.com ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2008ms
rtt min/avg/max/mdev = 4.954/5.804/6.256/0.601 ms

# check if you VM can communicate with the host
$ ping -4 -c3 -a desktop
PING desktop.fios-router.home (192.168.1.13) 56(84) bytes of data.
64 bytes from desktop.fios-router.home (192.168.1.13): icmp_seq=1 ttl=63 time=0.342 ms
64 bytes from desktop.fios-router.home (192.168.1.13): icmp_seq=2 ttl=63 time=0.429 ms
64 bytes from desktop.fios-router.home (192.168.1.13): icmp_seq=3 ttl=63 time=0.509 ms

--- desktop.fios-router.home ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2019ms
rtt min/avg/max/mdev = 0.342/0.426/0.509/0.068 ms
```

Now try the ping from the host to the VM (you can't):

```bash
# check if your host can communicate with the internet
$ ping -4 -c3 -a 10.0.2.2
PING 10.0.2.2 (10.0.2.2) 56(84) bytes of data.
^C
--- 10.0.2.2 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2047ms
```

Now on the VM, lets start an Nginx Docker container:

```bash
# install the nginx docker container
sudo docker run -d --rm --name=nginx  nginx:latest

# get the ip address of the container
$ sudo docker inspect nginx | jq -r ".[0].NetworkSettings.IPAddress"
172.17.0.2
```

So the docker container has ip address `172.17.0.2`.
Now switch back into the host machine, run `curl 172.17.0.2`,
and you **will not** see the Nginx welcome page.
Run the same command on the VM you **will** see the Nginx welcome page.

So what is going on here?
When an application within the VM sends a TCP/IP packet to the virtual [network interface device (NID)][01],
VirtualBox picks up the packet and performs a [network address translation (NAT)][02] on it.
It then forwards the resulting packet to the network on the host system.
When the answer comes back, the reverse process is applied and to the application,
it looks like the reply came from a real network device.
In this way, we can reach any host which is also reachable from the host,
including the host itself and any other virtual networks reachable from the host.

But there is something odd here.
When on the VM is behind the NID,
this implies that the VM cannot be reached from the host network.
But how can we then SSH into it?
The answer is that Vagrant has created a port mapping for us,
similar like you would configure an incoming port forwarding rule in a classical gateway.

Let us test this by printing out this route using the VirtualBox machine manager.

```bash
# get vm identifier
$ vm=$(vboxmanage list vms | grep "boxA" | awk '{print $1}' | sed s/\"//g)

# get port forwarding information from virtualbox manager
$ vboxmanage showvminfo --machinereadable $vm  | grep "Forwarding"
"Forwarding"
Forwarding(0)="ssh,tcp,127.0.0.1,2222,,22
```

we see that there is a port forwarding rule that directs
incoming traffic on port `2222` from the host to port `22` (SSH)
in the virtual machine where the SSH daemon is listening.
This makes it possible to reach the machine via SSH.




[01]:https://en.wikipedia.org/wiki/Network_interface_device
[02]:https://en.wikipedia.org/wiki/Network_address_translation
