
<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.0.1
-->


# Virtual Internal Networking
The network configuration in lab03 is very useful for many purposes, but sometimes,
you want a virtual network that is completely separated from the host network.
This networking situation is very similar to what we have seen in lab03,
when we connected two machines with a host-only network.
There is, however, a difference on the host.
There is no additional virtual networking device being created,
and there is no additional routing table entry on the host (nor any local routing table entry).
Thus, the new network to which the machines are attached is actually completely isolated from the host network.

Sources:
* [Virtual networking labs – VirtualBox internal networks and bridges](https://leftasexercise.com/2019/12/16/virtual-networking-labs-virtualbox-internal-networks-and-bridges/)
* [Virtual networking labs – networking-samples](https://github.com/christianb93/networking-samples)


------


# Setup and Install Required Tools
```bash
# instantiate and login to boxA
vagrant up
vagrant ssh
```

Install networking tool:

```bash
# install networking tools
sudo apt-get -y install net-tools traceroute arp-scan
```

Install some general tools:

```bash
# json formatting tool
sudo apt-get -y install jq
```

Install Docker prerequisites:

```bash
# packages which let apt use packages over HTTPS
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common

# add the GPG key for the official docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add the docker repository to apt sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# update the package database
sudo apt update
```

Install Docker:

```bash
# make sure you are about to install from the Docker repo instead of the default Ubuntu repo
apt-cache policy docker-ce

# install the docker package
sudo apt -y install docker-ce

# enabled docker daemon start on boot
sudo systemctl enable docker
```


------


# Execute the Lab Exercise
In this lab, we will create a virtual networking connecting the two virtual machines,
but unlike lab03, using the internal networking.
Will bring up two virtual machines, boxA and boxB.
When both of them are running, use `vagrant ssh boxA` and `vagrant ssh boxB` to connect to them.

## Inspect the Host
When we inspect the network on the host,
we see the same thing as we saw in lab03:

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



