
<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.0.1
-->


<div align="center">
<img src="http://www.foxbyrd.com/wp-content/uploads/2018/02/file-4.jpg" title="These materials require additional work and are not ready for general use." align="center">
</div>


----


# LAB03 - Virtual Internal Networks and Bridges
So far, we have been playing with virtual networking for one VM, connected to the host.
Now let us see how we can establish virtual networks connecting more than one VM.

## Sources & Additional Background
For a more complete description of the concepts being used here,
you should also check out the master `README.md` file in the root directory
(i.e. `cd ..`) of this repository.
In addition, check out these sources:

* [Virtual networking labs – VirtualBox internal networks and bridges](https://leftasexercise.com/2019/12/16/virtual-networking-labs-virtualbox-internal-networks-and-bridges/)
* [Virtual networking labs – networking-samples](https://github.com/christianb93/networking-samples)


------


# Execute the Lab Exercise
In this lab, we will create a Virtualbox host-only networking connecting two virtual machines,
both using the host-only networking.
Will bring up two virtual machines, boxA and boxB.
When both of them are running, use `vagrant ssh boxA` and `vagrant ssh boxB` to connect to them.

## Inspect the Host
When we inspect the network on the host,
we see nothing unexpected:

```bash
# what are the ethernet address (TCP/IP 4) of the host
$ ip addr show | grep "inet "
    inet 127.0.0.1/8 scope host lo
    inet 192.168.1.200/24 brd 192.168.1.255 scope global eth0
    inet 192.168.1.13/24 brd 192.168.1.255 scope global dynamic wlan0
    inet 172.28.128.1/24 brd 172.28.128.255 scope global vboxnet0

# list the content of the host's kernel routing tables
$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.1.1     0.0.0.0         UG    0      0        0 eth0
169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 eth0
172.28.128.0    0.0.0.0         255.255.255.0   U     0      0        0 vboxnet0
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 wlan0
```

You see the NIC for Ethernet, WiFi,
and the `vboxnet0` virtual NIC for the private network we asked Vagrant to create
and which will connect the VMs boxA and boxB
The routing table shows that host used `192.168.1.1` (IP address of my home router) for a gateway
and all the other networks use the host for their gateway.

## Inspect boxA
Now lets check out boxA (and you will see something similar for boxB):

```bash
# what are the ethernet address (TCP/IP 4) of boxA
$ ip addr show | grep "inet "
    inet 127.0.0.1/8 scope host lo
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic enp0s3
    inet 192.168.50.4/24 brd 192.168.50.255 scope global enp0s8

# list the content of the boxA kernel routing tables
$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         10.0.2.2        0.0.0.0         UG    100    0        0 enp0s3
10.0.2.0        0.0.0.0         255.255.255.0   U     0      0        0 enp0s3
10.0.2.2        0.0.0.0         255.255.255.255 UH    100    0        0 enp0s3
192.168.50.0    0.0.0.0         255.255.255.0   U     0      0        0 enp0s8
```
You see the `enp0s3` and `enp0s8` virtual NICs for the private network we asked Vagrant to create.

There is the virtual network `vboxnet0` which has an IP address assigned to it,
and there is a new entry in the routing table which sends all traffic for the network `192.168.50.0` to this device.
There is a virtual network interface `enp0s3` which is connected to the NAT device,
and there is a virtual interface `enp0s8` which is connected to `vboxnet0`
via the mechanisms discussed in the lab02.

So we should expect that the VMs can talk to each other via their private network.

```bash
# check your on boxA
$ uname -n
boxA

# can't ping boxB with name since you don't have a DNS
$ ping -4 -c3 -a boxB
ping: boxB: Temporary failure in name resolution

# you can ping boxB using its ip address
$ ping -4 -c3 -a 192.168.50.5
PING 192.168.50.5 (192.168.50.5) 56(84) bytes of data.
64 bytes from 192.168.50.5: icmp_seq=1 ttl=64 time=0.649 ms
64 bytes from 192.168.50.5: icmp_seq=2 ttl=64 time=0.627 ms
64 bytes from 192.168.50.5: icmp_seq=3 ttl=64 time=0.624 ms

--- 192.168.50.5 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2042ms
rtt min/avg/max/mdev = 0.624/0.633/0.649/0.011 ms
```

What is new here is both VM machines are actually connected to the same virtual network `vboxnet0`.
You should be able to ping boxB as `192.168.50.5` from boxA and similary boxA as `192.168.50.4` from boxB.



