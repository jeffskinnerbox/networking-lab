
<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.0.1
-->



# LAB02 - Single Machine Networking With Host-Only Networking
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


Check out for ideas - [What’s a Host-Only Network?](https://objectpartners.com/2018/01/18/exploring-a-host-only-network/)


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
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 08:00:27:20:38:99 brd ff:ff:ff:ff:ff:ff

# what are the ethernet address (TCP/IP 4)
$ ip addr show | grep "inet "
    inet 127.0.0.1/8 scope host lo
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic enp0s3
    inet 192.168.50.4/24 brd 192.168.50.255 scope global enp0s8
```

You will find that there are three networking devices.

1. There is the standard loopback device `lo` which is present on every Linux system.
2. There is an interface `enp0s3` which looks like an ordinary Ethernet device.
This device has a MAC address and an Ethernet address assigned to it, default is usually `10.0.2.15`.
3. There is an interface `enp0s8` which looks like an ordinary Ethernet device.
This device has a MAC address and an Ethernet address assigned to it, default is usually `192.168.50.4`.
This orginated from the Vagrantfile's entry
`boxA.vm.network "private_network", ip: "192.168.50.4", :name => 'vboxnet0'`
creating a new virtual networking device called `vboxnet0` with IP address `192.168.50.4` on the host.
On the host, vagrant has also added a new route,
sending all traffic for the network destination `192.168.50.0` to the `vboxnet0` device.

To test the routing through `vboxnet0`,
let's first get rid of the NAT interface supporting `10.0.2.0` to have a clearer picture.
To do this, we again use the VirtualBox machine manager on the host:

```bash
# get vm identifier
$ vm=$(vboxmanage list vms | grep "boxA" | awk '{print $1}' | sed s/\"//g)

# get rid of the NAT interface
vboxmanage controlvm $vm setlinkstate1 off
```

If you have used `vagrant ssh` to SSH into the machine,
this will of course kill your connection, as the connection uses the port forward rule associated to the NAT device.
But we can get it back in, by using the IP address `192.168.50.4` to SSH into the machine from our host.
This should work, as, on the host, we have a route to this destination via `vboxnet0`.
However, we first need the location of the private SSH key file that Vagrant has created
as part of the provisioning process using vagrant `ssh-config`,
which will show you that the private key file is stored at `.vagrant/machines/boxA/virtualbox/private_key`.
So we can run


