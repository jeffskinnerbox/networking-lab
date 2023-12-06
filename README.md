
<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.0.1
-->


<div align="center">
<img src="http://www.foxbyrd.com/wp-content/uploads/2018/02/file-4.jpg" title="These materials require additional work and are not ready for general use." align="center">
</div>


----


READ THIS
* [Networking Fundamentals](https://www.youtube.com/watch?v=bj-Yfakjllc&list=PLIFyRwBY_4bRLmKfP1KnZA6rZbRHtxmXi)
* [Subnetting Mastery](https://www.youtube.com/watch?v=BWZ-MHIhqjM&list=PLIFyRwBY_4bQUE4IB5c4VPRyDoLgOdExE)
    * [Practice Subnetting IPv4](https://subnetipv4.com/)
* [Address Resolution Protocol (ARP)](https://www.practicalnetworking.net/series/arp/address-resolution-protocol/)
* [Practical TLS](https://www.youtube.com/watch?v=HMoFvRK4HUo&list=PLIFyRwBY_4bTwRX__Zn4-letrtpSj1mzY)
* [Local Broadcast and Directed Broadcasts - Description and Demonstration](https://www.youtube.com/c/PracticalNetworking/search?query=broadcast)
* [Packet Tracer labs](https://www.youtube.com/watch?v=iHioYYvQIMU&list=PLIFyRwBY_4bRmOsO1EIPOIC3T5HLvz2_6)
* [Introduction to Linux interfaces for virtual networking](https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking#)
* [A sysadmin's guide to network interface configuration files](https://opensource.com/article/22/8/network-configuration-files)

* [TCP/IP networking basics: hubs, switches, gateways and routing](https://www.iusmentis.com/technology/tcpip/networks/)
* [An Introduction to Networking Terminology, Interfaces, and Protocols](https://www.digitalocean.com/community/tutorials/an-introduction-to-networking-terminology-interfaces-and-protocols)
* [Introduction to Linux interfaces for virtual networking](https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/)
* [Understanding Sockets](https://www.digitalocean.com/community/tutorials/understanding-sockets)

* [What are VLANs? -- the simplest explanation](https://www.youtube.com/watch?v=MmwF1oHOvmg)
* [VLAN vs Subnet: What Are Their Differences?](https://www.fiber-optic-transceiver-module.com/vlan-vs-subnet.html)

* [What is Virtualization?](https://www.sunnyvalley.io/docs/network-basics/what-is-virtualization)
* [VirtualNetworking](https://wiki.libvirt.org/page/VirtualNetworking)
* [libvirt Networking Handbook](https://jamielinux.com/docs/libvirt-networking-handbook/)
* [Introduction to networking](https://docs.openstack.org/liberty/networking-guide/intro-networking.html)
* [How Networks Work](https://dzone.com/articles/how-networks-work-what-is-a-switch-router-dns-dhcp#)
* [How Networks Work: Part II](https://dzone.com/articles/how-networks-work-part-ii)

* [Docker networking is CRAZY!! (you NEED to learn it)](https://www.youtube.com/watch?v=bKFMS5C4CG0)
* [Understanding Docker Networking](https://earthly.dev/blog/docker-networking/)
* [Docker Networking Tutorial // ALL Network Types explained!](https://www.youtube.com/watch?v=5grbXvV_DSk&t=210s)
* [Docker Networking Overview](https://docs.docker.com/network/)
* [Docker Networking Options](https://www.youtube.com/watch?v=Yr6-2ddhLVo)

# The 7 Types of Docker Networks
* [Docker networking is CRAZY!! (you NEED to learn it)](https://www.youtube.com/watch?v=bKFMS5C4CG0)
* [Docker Networking Tutorial // ALL Network Types explained!](https://www.youtube.com/watch?v=5grbXvV_DSk)

# EVE-NG
EVE-NG Is a network emulation tool that you can use to learn networking concepts
of various vendors by connecting virtual equipment and working on the equipment
as if it was real equipment.

* [EVE-NG - First Time Configuration](https://www.youtube.com/watch?v=uEH3IN1295k&t=294s)

# ZeroTier
ZeroTier combines the capabilities of VPN and SD-WAN, simplifying network management.
* [ZeroTier](https://www.zerotier.com/)


----


# Virtual Networking Lab
When you work with [virtualization][12] environments like [VirtualBox][17] and [Vagrant][16],
you will sooner or later realize that a large part of the complexity of such environments
originates in the non-trivial endeavor of [TCP/IP computer networking][11].
The virtualization process/technology requires you to stack different virtualization layers on top of each other.
One of those layers is networking, which also has to be virtualized,
and seems to get hidden and overlooked in the larger issues of virtualization.
To provide the basics to understand of virtual networking,
this series aims at introducing some of the more common virtual networking techniques via hands-on exercises.

Within this series of Labs I provide a validated [Vagrant Vagrantfile][13]
that you can be use to spin-up different types of virtualized environments.
With this, you can then go into these environments and explore what has been implemented.
You can demonstrate to yourself how the environment is constructed, its capabilities, and its limitations.
Potentially even more useful is that it provides a template that
you can reuse / extend when the day comes when you wish to build a like environment for a project.

A few of the labs you can study are:

* Work In Progress ...
    * Lab01 - Single Machine Networking With NAT Networking Adapter
    * Lab02 - Single Machine Networking With Host-Only Networking
    * LAB03 - Virtual Internal Networks and Bridges
    * LAB04 - Virtual Internal Networking
* Not Started Yet ...
    * Lab05 - Linux bridging basics
    * Lab06 - Setting up and monitoring bridges
    * Lab07 - Bridged networking with VirtualBox
    * Lab08 - VLAN networking with Linux
    * Lab09 - Setting up a point-to-point VXLAN connection
    * Lab10 - VXLAN and IP multicasting
    * Lab11 - Setting up an overlay network with Open vSwitch
    * Lab12 - VLAN separation with Open vSwitch
    * Lab13 - Building a virtual router with Linux namespaces and iptables

## Structure
Each Lab has its own directory with a `Vagrantfile` and a `README.md` file.
All the Labs use VirtualBox for server virtualization and some use Docker for containers.
[Vagrant provisioning][14] is typical done via Shell, but [Ansible][15] is also used in some Labs.
Assuming you have installed all these utilities,
the Vagrantfiles should be ready to go, just use `vagrant up` to get started.

To support the activities performed within the Labs,
some utilities need to be installed within the server environments.
This is done by a few [Bash shell][19] scripts that you will find in the Lab repositories directory `scripts`.

## Prerequisites
There is no way around it,
you will need to know [VirtualBox][17], [Vagrant][16], [Ansible][15], [Docker][18],
and particularly some basic understanding of computer networking.
The concepts and terminology used within these Labs will be a major barrier
to those who don't have a fairly solid understanding of at least computer networking.

If you need a refresher on computer networking, here are some good tutorials:

* [Computer Networking Tutorial: The Ultimate Guide](https://www.softwaretestinghelp.com/computer-networking-basics/)
* [Computer Networking Complete Course - Beginner to Advanced](https://www.youtube.com/watch?v=QKfk7YFILws)
* [Sunny Classroom](https://www.youtube.com/user/sunnylearning/featured)

### Pre-Built Box
I'm using the `ubuntu-headless` box for my labs.

```bash
# list of boxes you have on your host
$ vagrant box list
lamp-stack      (virtualbox, 0)
ubuntu-headless (virtualbox, 0)
ubuntu/bionic64 (virtualbox, 20201211.1.0)
ubuntu/focal64  (virtualbox, 20201210.0.0)
windows10base   (virtualbox, 0)
```

## Sources
Nearly all the Labs are a refinement of other peoples work, and so many thanks must go to all of them.
My major sources are the following:

* Original Sources
    * [Virtual networking labs – NAT and host-only networking with VirtualBox](https://leftasexercise.com/2019/12/13/virtual-networking-labs-nat-and-host-only-networking-with-virtualbox/)
    * [Virtual networking labs – VirtualBox internal networks and bridges](https://leftasexercise.com/2019/12/16/virtual-networking-labs-virtualbox-internal-networks-and-bridges/)
    * [Virtual networking labs – more on bridges](https://leftasexercise.com/2019/12/20/virtual-networking-labs-more-on-bridges/)
    * [Virtual networking labs – virtual Ethernet networks with VLAN tags](https://leftasexercise.com/2019/12/30/virtual-networking-labs-virtual-ethernet-networks-with-vlan-tags/)
    * [Virtual networking labs – overlay networks](https://leftasexercise.com/2020/01/03/virtual-networking-labs-overlay-networks/)
    * [Virtual networking labs – a short introduction to Open vSwitch](https://leftasexercise.com/2020/01/06/virtual-networking-labs-a-short-introduction-to-open-vswitch/)
    * [Virtual networking labs – Open vSwitch in practice](https://leftasexercise.com/2020/01/10/virtual-networking-labs-open-vswitch-in-practice/)
    * [Virtual networking labs – using OpenFlow](https://leftasexercise.com/2020/01/13/virtual-networking-labs-using-openflow/)
    * [Virtual networking labs – building a virtual router with iptables and Linux namespaces](https://leftasexercise.com/2020/01/17/virtual-networking-labs-building-a-virtual-firewall-and-router-with-linux-namespaces/)
* To Be Added Ansible Sources
    * https://leftasexercise.com/?s=ansible
    * [Set up an Ansible lab in 20 minutes](https://opensource.com/article/20/12/ansible-lab)
* To Be Added Additional Sources
    * [Creating a Bridge and Shared Network on Docker](https://qiita.com/kojiwell/items/f16757c1f0cc86ff225b)
    * [Linux Bridge - how it works](https://goyalankit.com/blog/linux-bridge)
    * [Is the network device in promiscuous mode?](https://goyalankit.com/blog/promiscuous-mode-detection)
    * [Vagrant :: SSH Inter-Connectivity of Multi Virtual Machines](https://vinaysit.com/2019/06/11/vagrant-ssh-inter-connectivity-of-multi-virtual-machines/)
    * [Virtual DIY Linux routers](https://github.com/basdusee/vagrant-linux-routers)
    * [How to emulate Internet in multi machine environment with Vagrant](https://stackoverflow.com/questions/28094827/how-to-emulate-internet-in-multi-machine-environment-with-vagrant)
    * [Open Source Routing: Practical Lab](https://oswalt.dev/2015/06/open-source-routing-practical-lab/)


-------


# Background
For the beginner, mastering computer networking, Vagrant,
and all the other prerequisites can be a challenge.
New users will likely be confused by all the network configuration of Vagrant and their relevancy.
I recommend reading some "ICP/IP Computer Networking" and "Getting Started With Vagrant"
type blogs and experimenting with Vagrant first.
Learn how to use Vagrant's CLI and navigate its basic features.
Next step would be learning the virtual networking capabilities of your chosen hypervisor
(I use within the Labs, and recommend, VirtualBox).
VirtualBox’s Network document is a good source to reference.
With that behind you, learning how to use the Vagrant virtual networking capabilities is
your third step, and that is where these labs come in to help.

The material below is offered as a review of computer networking, Vagrant, VirtualBox,
and giving you a  quick refresher of key concepts to prepare you for the lab work.

## What is a Hypervisor?
A [Hypervisor][20] (also called a virtual machine monitor or VMM)
is a software or firmware that manages and allocates different hardware resources
of a host machine for a guest machines (aka [virtualized server][21]).
There are two types of Hypervisors and their working principles differ by quite a lot degree.

* **Type 1 Hypervisor**,
also known as [bare-metal Hypervisor][22], is a firmware (can also be hardware)
that runs directly on system hardware.
This Hypervisor controls n number of operating systems or virtual machines
running as guest machines on the host hardware.
Here the job of Hypervisor is to allocate system resources to virtual machines.
Type 1 Hypervisors usually include hardware support that means it has a pre-installed kernel.
Examples of Type 1 Hypervisors: Xen, VMware ESXi, and Microsoft Hyper-V
* **Type 2 Hypervisor**
is a software that runs on a host operating system.
This Hypervisor creates a process and allocates system resources like
memory, persistent storages, and other vital things.
Then guest OS runs inside this process and uses available resources.
Here Hypervisor acts as a middle man between the guest OS
and host OS to translate guest OS instructions so that host OS can understand it.
Examples of Type 2 Hypervisors: VMware Workstation, VMware Player, Oracle VirtualBox

## What is VirtualBox?
VirtualBox is a powerful x86 and AMD64/Intel64 virtualization product
for enterprise as well as home use.
[VirtualBox is easy to install & us][23],
and is designed to run virtual machines on your physical machine
without reinstalling your OS that is running on a physical machine.
VirtualBox an extremely feature rich, high performance product for enterprise customers,
and it is also the only professional solution that is freely available as Open Source Software.
VirtualBox runs on Windows, Linux, Macintosh, and Solaris hosts
and supports a large number of guest operating systems including DOS, Windows, Linux, and others.

VirtualBox virtual machines are isolated from each other and from the host operating system.
Thus, you can perform your tests in isolated virtual machines without any concerns
of damaging your host operating system or other virtual machines.
For some guest operating systems,
a "Guest Additions" package of device drivers and system applications is available,
which typically improves performance, especially that of graphics.
Each guest can be started, paused and stopped independently within its own virtual machine (VM).
The user can independently configure each VM and run it under a choice
of software-based virtualization or hardware assisted virtualization
if the underlying host hardware supports this.
The host OS and guest OSs and applications can communicate with each other through a
number of mechanisms including a common clipboard and a virtualized network facility.
Guest VMs can also directly communicate with each other if configured to do so.

>**NOTE:** VirtualBox is great and most of time it is adequate.
>But it does not support [nested virtualzation][06] which is the ability to
>run virtual machines within another virtual machine.
>Most of hypervisors like VMware Fusion, Hyper-V and QEMU except VirtualBox support such a feature.

## What is Vagrant?
[Vagrant][27] is an open-source tool that allows you to create, configure,
and manage boxes of virtual machines through an easy to use command interface.
Essentially, it is a layer of software installed between a virtualization tool
(such as VirtualBox, Docker, Hyper-V) and a VM.

Because Vagrant completely specifies the VM's configuration within a file (called a Vagrantfile),
you can ensure all team members are building for the same configuration.
By providing a common text-based format to work with virtual machines,
your environment can be defined in code, making it easy to
back up, modify, share, and manage with revision control.
It also means that rather than sharing a whole virtual machine image, which could be many gigabytes,
every time a change is made to the configuration,
a simple text file weighing at just a few kilobytes can be shared instead.

One of the great features of Vagrant is that users are never tied to one virtualization platform
(Virtualbox, VMware, Hyper-V etc.),
rather they can create workflows that work with any or all of these simultaneously.
In addition, Vagrant is the ability to configure entire environments
in code within a single configuration file (Vagrantfile).
This means that with one command, `vagrant up`,
you can bring multiple virtual machines up at once, and even with their own private networking.

In order to access the Vagrant VMs you create,
Vagrant supports some high-level networking options for things such as
forwarded ports, connecting to a public network, or creating a private network.
These high-level networking options are meant to define an abstraction
that works across multiple hypervisor providers.
This means that you can take your `Vagrantfile` you used to spin up VMs using VirtualBox
and you can reasonably expect that `Vagrantfile` to behave the same with something like VMware.

For additional information about VirtualBox, checkout these sources:

* [A Beginner's Guide for Vagrant](https://blog.jeffli.me/blog/2016/12/06/a-beginners-guide-for-vagrant/)
* [Vagrant Networking Explained](https://blog.jeffli.me/blog/2017/04/22/vagrant-networking-explained/)
* [Vagrant: Up and Running by Mitchell Hashimoto: Networking in Vagrant](https://www.oreilly.com/library/view/vagrant-up-and/9781449336103/ch04.html)
* [VirtualBox Network Settings: Complete Guide](https://www.nakivo.com/blog/virtualbox-network-setting-guide/)
* [How To Configure Networking In Vagrant](https://ostechnix.com/how-to-configure-networking-in-vagrant/)
* [Vagrant beyond the basics](https://fedoramagazine.org/vagrant-beyond-basics/)

## Physical Networking
A physical [TCP/IP computer network][24] is the interconnection of multiple devices,
also known as hosts, that are connected using multiple paths for the purpose of
sending/receiving data or media.
Computer networks can also include multiple devices/mediums which help
in the communication between two different devices.
These are known as Network devices and include things such as routers, switches, hubs, and bridges.

* Network Devices
    * **Router -**
    * **Wireless Router -**
    * **Hub -**
    * **Bridge -**
    * **Wireless Bridge -**
    * **Switch -**
    * **NIC -** Network Interface Controller (NIC) (aka Network Adapters)
* Network Unique Identifiers
    * **Hostname -** Each device in the network is associated with a unique device name,
    established by a human administrator of the device, known as Hostname.
    * **IP Address -** Also known as the Logical Address,
    the IP Address is the network address of the system across the network.
    To identify each device in the world-wide-web,
    the Internet Assigned Numbers Authority (IANA) assigns an IPV4 address as a
    unique identifier to each device on the Internet.
    * **MAC Address -** The Media Access Control (MAC) address, also known as physical address,
    is the unique identifier of each host and is associated with its NIC (Network Interface Card).
    A MAC address is assigned to the NIC at the time of manufacturing.
    * **Port -** A port can be referred to as a logical channel through which data
    can be sent/received to an application.
    Any host may have multiple applications running, and each of these applications
    is identified using the port number on which they are running.
    * **Socket -** The unique combination of IP address and Port number together are termed as Socket.
* Protocols
    * **ARP -** The Address Resolution Protocol (ARP) is used to convert an IP address
    * to its corresponding physical address(i.e., MAC Address).
    ARP is used by the Data Link Layer to identify the MAC address of the Receiver’s machine.
* Other Network Resources
    * **DNS Server -** Domain Name Server (DNS) is basically a server which translates
    web addresses or URLs (ex: `www.google.com`) into their corresponding IP addresses.
    Therefore, people don’t have to remember all the IP addresses of each and every website.
* Network Types
    * **VPN -** A Virtual Private Network (VPN) allows for information to be securely
    sent across a public or unsecure network, such as the Internet.
    Common uses of a VPN are to connect branch offices or remote users to a main office.
    * **SDN -** A [Software Defined Network (SDN)][25] takes the control plane away from the switch
    and assign it to a centralized unit called the SDN controller.
    Hence, a network administrator can shape traffic via a centralized console without
    having to touch the individual switches.

## Virtual Networking
While physical networking connects computers through cabling and other hardware,
[virtual networking][26] extends these capabilities by using software management
to connect computers and servers over the Internet.
It uses virtualized versions of traditional physical network tools,
like switches and network adapters, allowing for more efficient routing and easier network configuration changes.
A physical network is still required as a host for the virtual network infrastructure.

Virtual networking enables communication between multiple computers,
virtual machines (VMs), virtual servers, or other devices across a physical or virtual network.

Virtual networking isn't a new concept.
One example of virtual networking is a virtual private network (VPN),
which creates a secure connection between one network and another over the Internet.
is an example of virtual networking is a virtual local area network (VLAN). A VLAN is a subgroup of a network, which combines multiple network devices into one grouping, or domain, and partitions it off from the rest.
A virtual extensible LAN (VXLAN) is another example of virtual networking. Beyond simply dividing a network into subgroups, VXLANs can virtualize an entire network, providing large-scale overly network and segmentation capabilities.

Virtual networking can include the following:

* **vSwitch -** A software application called Virtual Switch (vSwitch) on the host server
allows us to set up and configure a virtual network means it controls and directs communication
between the existing physical network and virtual parts of the network.
* **Virtual Network Adapter -** It creates a gateway between networks means
it allows computers and virtual machines to connect to a network.
It makes it possible for all the computers in a Local Area Network (LAN) to connect to a larger network.
* **Virtual Machines -** These are the virtualized devices that connect to the network
and allow various functionality.
* **Servers -** It is part of the network host infrastructure.
* **Firewalls -** It is designed for monitoring and preventing security threats in the virtual network.
* **VPN -** A Virtual Private Network (VPN) uses the internet to connect two or more existing networks. It is an internet-based virtual networking technology that allows to access any physical networks that are connected. It allows connecting any private network through the internet securely and privately. It is just like a private point to point connection between two devices or networks.
* **VLAN -** A Virtual Local Area Network (VLAN) subdivides the LAN logically into different broadcast domains means it uses partitions to group devices on a LAN network into domains with resources and configurations. It allows better security, monitoring, and management of the devices and servers within a specific domain. Each VLANs act as a separate LAN. Data transmission becomes much easier and with VLAN the increasing transmission demand is fulfilled.
* **(VXLAN) -** Virtual Extensible Local Area Network (VXLAN) is a network virtualization technology that stretches layer 2 connections over layer 3 network by encapsulating Ethernet frames in a VXLAN packet which includes IP addresses to address the scalability problem in a more extensible manner.

### Networking Modes
Within [VirtualBox virtual networking][07],
each VM can have up to 8 network adaptors, and each adaptor is one of 6 types.
Networking adapters can be further separately configured to operate in one of the following [networking modes][08]:
Not Attached, Network Attached Translation (NAT), NAT Network, Bridged Network,
Internal Networking, Host-Only Networking, Generic Networking.
Within the Labs, we will focus on the following:

* **Network Address Translation (NAT):**  This network mode is enabled for a virtual network adapter by default. A guest operating system on a VM can access hosts in a physical local area network (LAN) by using a virtual NAT (Network Address Translation) device. External networks, including the internet, are accessible from a guest OS. A guest machine is not accessible from a host machine, or from other machines in the network when the NAT mode is used for VirtualBox networking. This default network mode is sufficient for users who wish to use a VM just for internet access, for example.
* **NAT Network:** This mode is similar to the NAT mode that you use for configuring a router. If you use the NAT Network mode for multiple virtual machines, they can communicate with each other via the network. The VMs can access other hosts in the physical network and can access external networks including the internet. Any machine from external networks as well as those from a physical network to which the host machine is connected cannot access the VMs configured to use the NAT Network mode (similarly to when you configure a router for internet access from your home network).
* **Bridged Networking (Bridged Adapter):** This mode is used for connecting the virtual network adapter of a VM to a physical network to which a physical network adapter of the VirtualBox host machine is connected. A VM virtual network adapter uses the host network interface for a network connection. Put simply, network packets are sent and received directly from/to the virtual network adapter without additional routing. A special net filter driver is used by VirtualBox for a bridged network mode in order to filter data from the physical network adapter of the host.
This network mode can be used to run servers on VMs that must be fully accessible from a physical local area network. When using the bridged network mode in VirtualBox, you can access a host machine, hosts of the physical network and external networks, including internet from a VM. The VM can be accessed from the host machine and from other hosts (and VMs) connected to the physical network.
* **Internal Networking:** Virtual machines whose adapters are configured to work in the VirtualBox Internal Network mode are connected to an isolated virtual network. VMs connected to this network can communicate with each other, but they cannot communicate with a VirtualBox host machine, or with any other hosts in a physical network or in external networks. VMs connected to the internal network cannot be accessed from a host or any other devices. The VirtualBox internal network can be used for modelling real networks.
* **Host-only Networking:** This network mode is used for communicating between a host and guests. A VM can communicate with other VMs connected to the host-only network, and with the host machine. The VirtualBox host machine can access all VMs connected to the host-only network.

#### Promiscuous Mode
This mode allows a network adapter to pass all received traffic, no matter to which adapter the traffic is addressed. In normal mode, a network adapter receives only frames that include the MAC address of this particular network adapter as the destination address in the header. The frames that are addressed to a MAC address which differs from the MAC address of the selected adapter (when traffic is not broadcast) are dropped when in normal mode. The promiscuous mode makes it possible for a physical network adapter to have multiple MAC addresses, allowing all incoming traffic to pass the physical network adapter of the host machine and reach the virtual network adapter of the VM which has its own MAC address that is represented on the host adapter, even if that traffic is not addressed to the virtual network adapter of that particular VM.

There are three options of using the promiscuous mode:

* **Deny:** Any traffic that is not intended to the virtual network adapter of the VM is hidden from the VM. This option is set by default.
* **Allow VMs:** All traffic is hidden from the VM network adapter except the traffic transmitted to and from other VMs.
* **Allow All:** There are no restrictions in this mode. A VM network adapter can see all incoming and outgoing traffic.
The Promiscuous mode can be used not only for the Bridged Networking mode, but also for NAT Network, Internal Network and Host-Only Adapter modes.

### Port Forwarding
While not strictly a networking mode or capability,
port forwarding is a process of intercepting traffic addressed to the appropriate IP address and port in addition to redirecting that traffic to a different IP address and/or port. Special applications can be used on computers and other router devices to configure port forwarding. One of the most popular use cases for port forwarding is by providing access to particular network services that are hidden behind the NAT from external networks. After configuring port forwarding rules, clients can access the appropriate services from outside by connecting to the router’s (host’s) external IP address and specified port.

## Vagrant Terminology
Give that Vagrant is an abstraction for managing virtual machines for multiple hypervisor technologies,
Vagrant has its own terminology for this abstraction:

* **Provider** means the type of underlying virtualization technology. Though it is able to manage virtual machines, Vagrant is not a hypervisor itself. Instead, it is just abstraction of managing virtual machines in different hypervisors. That is why we said that hypervisor is a prerequisite for Vagrant.
Vagrant supports multiple types of hypervisor such as VirtualBox, VMware Fusion, VMware Workstation, Hyper-V and Docker.
* **Box** packages OS images required by the underlying hypervisor to run the virtual machine. Typically, each hypervisor has its own OS image format. Thus when building or downloading boxes, you have to choose the target hypervisor. Boxes are organized in local repo located in `$HOME/.vagrant.d/boxes`.
* **Provisioner** are DevOps tools available to automate configuration management such as Shell, Ansible, Puppet, SaltStack and Chef. Vagrant does not reinvent the wheel. Instead, it makes an abstract on different tools so the users could choose any technique they want.

## Vagrant Networking Options
So far, Vagrant has provide 3 networking options. The underlying implementation is provider-dependent hence it is possible that the option is unavailable with some specific provider.

Vagrant networking is not hard because it's limited to 3 options, but its not easy because Vagrant does an abstraction for the rich underlying providers.
Remember the following:

* Don't misunderstand the Vagrant public/private networking for the public/private IPv4 addresses. They don’t address the same issues.
* Public networking attaches virtual machines to the same subnet with the Vagrant host
* Private networking hides virtual machines from the outside of the Vagrant host
* Forwarded ports create tunnels from virtual machines to outside world


### Option 1: Public Networking
Public network gives the VM the same network visibility as the Vagrant host. Wherever the Vagrant host is accessible, the VM could be reached directly as another standalone machine because it has a dedicated IP address in the same network subnet with the Vagrant host.

In a public network, you are effectively bridging the network connection on your guest virtual machine
so that it appears physically connected to your hosts network.

A Vagrant "public network" is a bit ambiguous terminology.
The word public does not mean that the IP addresses have to be [public routable IP addresses][09].
Hence it is kind of confusing.  In fact, in earlier Vagrant documentation, "public networking" is called "bridged networking". Just keep one simple rule in mind: if the VM’s assigned IP is in the same subnet of the host, then Vagrant calls it a public networking configuration.

>**NOTE:** It is likely that public networks will be replaced by `:bridged` in a future release of Vagrant,
>since that is in general what s done with Vagrant public networks,
>and providers have no plans to support public routable IP addresses.

For configuration options,
see the [Vagrant documentation: Public Networks][05].

#### DHCP
The easiest way to use a public network is to allow the IP to be assigned via DHCP.
In this case, defining a public network is trivially easy:

```ruby
Vagrant.configure("2") do |config|
  config.vm.network "public_network"
end
```

When DHCP is used, the IP can be determined by using `vagrant ssh` to SSH into the machine
and using the appropriate command line tool to find the IP, such as `ifconfig`.

#### Static IP
You may wish to manually set the IP of your bridged interface.
To do so, add a `:ip` clause to the network definition.

```ruby
Vagrant.configure("2") do |config|
  config.vm.network "public_network", ip: "192.168.0.17"
end
```

#### Default Network Interface
If more than one network interface is available on the host machine,
Vagrant will choose which interface the virtual machine should bridge to.
A default interface can be specified by adding a `bridge:` clause to the network definition.

```ruby
Vagrant.configure("2") do |config|
  config.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)"
end
```

With some providers, it is possible to specify a list of adapters to bridge against:

```ruby
Vagrant.configure("2") do |config|
  config.vm.network "public_network", bridge: [
    "en1: Wi-Fi (AirPort)",
    "en6: Broadcom NetXtreme Gigabit Ethernet Controller",
  ]
end
```

In this example, the first network adapter that exists and can successfully be bridge will be used.

#### Default Router
Depending on your setup, you may wish to manually override the default router configuration.
This is required if you need to access the Vagrant box from other networks over the public network.
To do so, you can use a shell provisioner script:

```ruby
Vagrant.configure("2") do |config|
  config.vm.network "public_network", ip: "192.168.0.17"

  # default router
  config.vm.provision "shell",
    run: "always",
    inline: "route add default gw 192.168.0.1"

  # default router ipv6
  config.vm.provision "shell",
    run: "always",
    inline: "route -A inet6 add default gw fc00::1 eth1"

  # delete default gw on eth0
  config.vm.provision "shell",
    run: "always",
    inline: "eval `route -n | awk '{ if ($8 ==\"eth0\" && $2 != \"0.0.0.0\") print \"route del default gw \" $2; }'`"
end
```

### Option 2: Private Networking
Vagrant private networks allow you to access your guest machine by some address
that is not publicly accessible from the global internet.
In general, this means your machine gets an address in the [private address space][03]
(e.g. Private IPv4 addresses =
`10.0.0.0 – 10.255.255.255`, `172.16.0.0 – 172.31.255.255`, and `192.168.0.0 – 192.168.255.255`).

In private networking, a virtualized subnet that is invisible from outside of Vagrant host will be created by the underling provider. Virtual machines attached to the same virtualized subnet are ables to communicate with each other. Unlike public networking, there is no way for IPs on the host's network to connect to the virtual machines directly.

Since the addresses assigned to the virtual machines are private IPv4 ones, the IP address range chosen by Vagrant for the virtualized subnet must not be conflict with any existing network. (Note: The IP range `172.16.0.0 – 172.31.255.255` is rarely used in organizations, which is why it is often used in Vagrant private networking).

Usually, Vagrant knows how to involve the underlying providers to create the necessary subnets automatically. Thus there is no need for users to configure subnets manually. However, if the IP address range chosen by the Vagrant needs to be changed, manual networking configuration in the provider is required.

>**NOTE:** A Vagrant private network only specifies that the virtual machines
>within the same subnet are visible to each other.
>It does **NOT** tell whether the virtual machines are able to access the network outside the host.
>This behavior is provider-dependent.
>For example, Vagrant private networking implemented with VirtualBox is limited on the host,
>while in Libvirt, the virtual machines are able to reach the outside.
>The docs about providers’ networking should be turned to if you need to get the detail.

For configuration options,
see the [Vagrant documentation: Private Networks][04].

#### Static IP
Multiple machines within the same private network
can communicate with each other on the private networks
(usually with the restriction that they're built via the same provider).
For example, in this Vagrantfile we have a Puppet master and two nodes.
We'll set up static IP addresses in the same range,
and all of the virtual machines can communicate with each other.

```ruby
Vagrant.configure("2") do |config|
  config.vm.define "puppet" do |puppet|
    puppet.vm.box = "bento/centos-7.2"
    puppet.vm.network "private_network", ip: "192.168.10.21"
   end

  config.vm.define "puppetagent1" do |puppetagent1|
    puppetagent1.vm.box = "bento/centos-7.2"
    puppetagent1.vm.network "private_network", ip: "192.168.10.22"
    puppetagent1.vm.hostname = "puppetagent1"
  end

    config.vm.define "puppetagent2" do |puppetagent2|
      puppetagent2.vm.box = "bento/centos-7.2"
      puppetagent2.vm.network "private_network", ip: "192.168.10.23"
      puppetagent2.vm.hostname = "puppetagent2"
  end
end
```

>**NOTE:** Do not choose an IP that overlaps with any other IP space on your system.
>This can cause the network to not be reachable.

#### DHCP
The easiest way to use a private network is to allow the IP to be assigned via DHCP.
If we change the code in the above Vagrantfile to indicate DHCP and not static IP addressing,
it would look like this:

```ruby
Vagrant.configure("2") do |config|
  config.vm.define "puppet" do |puppet|
    puppet.vm.box = "bento/centos-7.2"
    puppet.vm.network "private_network", type: dhcp
   end
```

### Option 3: Port Forwarding
Forwarded ports expose the virtual machines services on a port to the world outside the Vagrant host.
For example, if a Nginx HTTP server runs in the virtual machine, which is using private networking,
it is impossible to access the service from outside of the host.
But through a forwarded port, the Nginx HTTP service is able to be exposed as a service of the Vagrant host,
which makes it public.


If public networking is used, forwarded ports would be useless because the VMs are already public. However, as mentioned, public networking is not always available due to the fact that it needs some prerequisites that are not always met. Under the circumstances, the combination of private networking and forwarded ports would be the only choice.

The default way to access a Vagrant box is via SSH with the command `vagrant ssh`.
For this to occur, Vagrant forwards `port 22` from the guest to an open port on your local machine,
such as `port 2222`.
Vagrant actually handles this automatically,
but users also have the ability to set port forwarding in the Vagrantfile.
In fact, not only SSH but any protocol or port.

For instance, what if I want to perform port forwarding for Remote Desktop to the guest?
You could set the host `port 33390` and the guest `port 3389` (the default RDP port in Windows).

```ruby
# configure ports for supporting rdp
Vagrant.configure("2") do |config|
   config.vm.network "forwarded_port", guest: 3389, host: 33390
end
```

Now if I run `vagrant rdp` on my local machine,
Vagrant will try to establish a connection on `port 33390` of your local host to `port 3389`
of your guest VM as illustrated below.

For configuration options,
see the [Vagrant documentation: Forward Ports][02].

#### Network Protocols
By default, Vagrant uses TCP protocol for port forwarding. You can, however, use UDP protocol if you want to forward UDP packets.
To use UDP port, add the following definition in your Vagrantfile:

```ruby
config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true protocol: "udp"
```

#### Port Collisions
In our previous example, we forwarded the port 80 from guest to port 8080 in host. In other words, the traffic sent to port 8080 is actually forwarded to port 80 on the guest machine. What if some other application is currently using the port 8080? Port collision happens when running multiple VMs. You may unknowingly forward an already used port. No worries! Vagrant has built-in support for detecting port collisions. If the port is already being used by another application, Vagrant will report it in the output, so you can either free up the port or use another port.

Vagrant is also smart-enough to find and correct port collision automatically. If it find a port is collided with another port, it will auto-correct it by using any other unused port for you.

To enable auto-correction, add an extra option auto_correct: true in the port forwarding definition in your Vagrantfile.

```ruby
config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
```

By default, Vagrant will choose auto-correction port between port 2200 and port 2250 range. You can also choose your own custom range by defining the following line in the Vagrantfile like below.

```ruby
config.vm.usable_port_range = (2200..2250)
```


------



# How to Interpret Commands

## Vagrant Virtual Hardware Provisioning
During the Vagrant provisioning process,
you can specify the number of CPU cores, the amount of RAM, etc.
You can validate the implementation of these provisioning steps with these commands:

```bash
# what are the number of cpu cores
grep 'cpu cores' /proc/cpuinfo | uniq

# what is the amount of ram memory

# what is the linux distribution installed

# what is the hostname
```

## Vagrant Virtual Network Provisioning
```bash
route -n
ping -4 -c3 -a goolge.com
ip addr show | grep "inet "
ip link show
arp -n
sudo arp-scan 192.168.1.0/25
```

`ip` utility is a part of the iproute2 package and comes pre-installed on all modern Linux distributions. `ip` utility can be considered as a replacement(also enhancement) for the ifconfig utility which is part of the net-tools package. With advancements in Linux kernel, the net-tools package is being deprecated and a more powerful alternative has evolved.
According to the man page, the syntax for `ip` utility is as below
ip [ OPTIONS ] OBJECT { COMMAND | help }
The object types that are supported by the IP utility are:
address — Display or modify IP addresses
route — Display or modify the routing table of the device
link — Display or modify network interfaces
neigh — Display or modify ARP table

`ip` commands are crucial in understanding the packet traversal in/through the Linux kernel. It gives information about the routes, the directly connected devices, the IP address on the network interface cards (NIC) present on the device, and of course the MAC address information and other hardware information about the NICs.

The `ip link` command handles the parameters related to the network interface. The most commonly used actions when working with IP link utility are show, set, add, del. The IP link command can make changes to both physical and virtual interfaces as well

```bash
# Displays IP information
ip addr
ip addr ls <device_name>

# view the default routing table
$ ip route show

# Get the list of ip rules on the device
$ ip rule show

# list all links on the device
$ ip link show
```

`ip neigh` command is useful to know about the physical interfaces of the devices that are directly connected to a specific device. `ip neigh` is useful to display the Address Resolution Protocol (ARP ) table. This table is a key component of routing and is the source of truth to map a specific IP address to a physical interface (MAC Address) for delivering the packets destined to the IP address.

```bash
# get contents of the ARP table
$ ip neigh show
```

One interesting topic that requires mentioning is the state of the neighbor in the ARP table of a device.nud in the command above stands for Neighbor Unreachability Detection. A neighbor can be in one of the 9 states — none, probe, reachable, stale, delay, failed, permanent, noarp, incomplete.

```bash
boxB.vm.network "private_network", ip: "192.168.50.5", :name => 'vboxnet0'
boxB.vm.network "private_network", ip: "192.168.50.5", virtualbox__intnet: "myNetwork"
```


-----



# Docker Networking
* [Docker Networking Overview](https://docs.docker.com/network/)



[01]:https://github.com/christianb93/networking-samples
[02]:https://www.vagrantup.com/docs/networking/forwarded_ports
[03]:https://en.wikipedia.org/wiki/Private_network
[04]:https://www.vagrantup.com/docs/networking/private_network
[05]:https://www.vagrantup.com/docs/networking/public_network
[06]:https://en.wikipedia.org/wiki/Virtualization#Nested_virtualization
[07]:https://www.virtualbox.org/manual/ch06.html
[08]:https://www.nakivo.com/blog/virtualbox-network-setting-guide/
[09]:https://en.wikipedia.org/wiki/IP_address#Public_address
[10]:https://en.wikipedia.org/wiki/Private_network#Private_IPv4_address_spaces
[11]:https://www.geeksforgeeks.org/basics-computer-networking/
[12]:https://www.redhat.com/en/topics/virtualization
[13]:https://www.vagrantup.com/docs/vagrantfile
[14]:https://www.vagrantup.com/docs/provisioning
[15]:https://opensource.com/resources/what-ansible
[16]:https://opensource.com/resources/vagrant
[17]:https://www.virtualbox.org/
[18]:https://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/
[19]:https://opensource.com/resources/what-bash
[20]:https://phoenixnap.com/kb/what-is-hypervisor-type-1-2
[21]:https://phoenixnap.com/kb/what-is-server-virtualization
[22]:https://phoenixnap.com/blog/what-is-bare-metal-hypervisor
[23]:https://www.nakivo.com/blog/use-virtualbox-quick-overview/
[24]:https://www.geeksforgeeks.org/tcp-ip-in-computer-networking/?ref=rp
[25]:https://www.geeksforgeeks.org/software-defined-networking/
[26]:https://www.geeksforgeeks.org/fundamentals-of-virtual-networking/?ref=rp
[27]:https://www.augmentedmind.de/2020/07/05/complete-introduction-to-vagrant/
[28]:
[29]:
[30]:
[31]:
[32]:
[33]:
[34]:
[35]:
[36]:
[37]:
[38]:
[39]:
[40]:
