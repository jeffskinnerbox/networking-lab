
<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.0.1
-->


<div align="center">
<img src="http://www.foxbyrd.com/wp-content/uploads/2018/02/file-4.jpg" title="These materials require additional work and are not ready for general use." align="center">
</div>


----


# Computer Networking Training
* [Sunny Classroom](https://www.youtube.com/user/sunnylearning/featured)
* [Computer Networking Complete Course - Beginner to Advanced](https://www.youtube.com/watch?v=QKfk7YFILws)

# Prerequsites
You will need to know VirtualBox, Vagrant, Docker, and Ansible.

# Step X:
The inital versions of the labs are stored in a [Github reposítory populated by christianb93][01].
You could clone this repository but ...

```bash
# clone repository
cd /home/jeff/src/vagrant-machines/networking-lab
git clone https://github.com/christianb93/networking-samples.git networking-lab

# clone my repository
```


# Virtual Networking Lab
When you work with virtualized environments,
you will sooner or later realize that a large part of the complexity of such environments
originates in the non-trivial endeavor of networking.
The virtualization technology stacks different virtualization layers on top of each other.
To provide the basics to understand all this,
this series aims at introducing some of the more commonly used techniques using hands-on exercises.

Orginal Source:
* [Virtual networking labs – NAT and host-only networking with VirtualBox](https://leftasexercise.com/2019/12/13/virtual-networking-labs-nat-and-host-only-networking-with-virtualbox/)
* [Virtual networking labs – VirtualBox internal networks and bridges](https://leftasexercise.com/2019/12/16/virtual-networking-labs-virtualbox-internal-networks-and-bridges/)
* [Virtual networking labs – more on bridges](https://leftasexercise.com/2019/12/20/virtual-networking-labs-more-on-bridges/)
* [Virtual networking labs – virtual Ethernet networks with VLAN tags](https://leftasexercise.com/2019/12/30/virtual-networking-labs-virtual-ethernet-networks-with-vlan-tags/)
* [Virtual networking labs – overlay networks](https://leftasexercise.com/2020/01/03/virtual-networking-labs-overlay-networks/)
* [Virtual networking labs – a short introduction to Open vSwitch](https://leftasexercise.com/2020/01/06/virtual-networking-labs-a-short-introduction-to-open-vswitch/)
* [Virtual networking labs – Open vSwitch in practice](https://leftasexercise.com/2020/01/10/virtual-networking-labs-open-vswitch-in-practice/)
* [Virtual networking labs – using OpenFlow](https://leftasexercise.com/2020/01/13/virtual-networking-labs-using-openflow/)
* [Virtual networking labs – building a virtual router with iptables and Linux namespaces](https://leftasexercise.com/2020/01/17/virtual-networking-labs-building-a-virtual-firewall-and-router-with-linux-namespaces/)

Ansible Sources:
* https://leftasexercise.com/?s=ansible
* [Set up an Ansible lab in 20 minutes](https://opensource.com/article/20/12/ansible-lab)

Additional Sources:
* [Creating a Bridge and Shared Network on Docker](https://qiita.com/kojiwell/items/f16757c1f0cc86ff225b)
* [Linux Bridge - how it works](https://goyalankit.com/blog/linux-bridge)
* [Is the network device in promiscuous mode?](https://goyalankit.com/blog/promiscuous-mode-detection)
* [Vagrant :: SSH Inter-Connectivity of Multi Virtual Machines](https://vinaysit.com/2019/06/11/vagrant-ssh-inter-connectivity-of-multi-virtual-machines/)

# networking-samples
A few labs to study virtual networking with Linux

* Lab01 - Single machine networking with NAT networking adapter
* Lab02 - Single machine networking with host-only network
* Lab03 - Virtualbox host-only networking with more than one machine
* Lab04 - VirtualBox internal networking
* Lab05 - Linux bridging basics
* Lab06 - Setting up and monitoring bridges
* Lab07 - Bridged networking with VirtualBox
* Lab08 - VLAN networking with Linux
* Lab09 - Setting up a point-to-point VXLAN connection
* Lab10 - VXLAN and IP multicasting
* Lab11 - Setting up an overlay network with Open vSwitch
* Lab12 - VLAN separation with Open vSwitch
* Lab13 - Building a virtual router with Linux namespaces and iptables


-------


# Background
For the beginner, mastering Vagrant can be a challenge,
and new users will be confused on the network configuration of Vagrant.
I recommend reading some "Getting Started With Vagrant" type blogs and experimenting with Vagrant first.
Learn how to use Vagrant's CLI and navigate its basic features.
Next step would be learning the virtual networking capabilities of your chosen hypervisor (I recommend VirtualBox).
VirtualBox’s Network document is a good source to refer.
With that behind you, learning how to use the Vagrant virtual networking capabilities is
your third step, and that is where these labs come in to help.

The material below is offered up as a quick review of Vagrant, VirtualBox to prepare you for the lab work.

## What is a Hypervisor?
A Hypervisor (also called a virtual machine monitor or VMM)
is a software or firmware that manages and allocates different hardware resources
of a host machine for a guest machines.
There are two types of Hypervisors and their working principles differ by quite a lot degree.

* **Type 1 Hypervisor**,
also knowns as bare-metal Hypervisor, is a firmware (can also be hardware)
that runs directly on system hardware.
This Hypervisor controls n number of operating systems or virtual machines
running as guest machines on the host hardware.
Here the job of Hypervisor is to allocate system resources to virtual machines.
Type 1 Hypervisors usually include hardware support that means it has a pre-installed kernel.
Type 1 Hypervisors: Xen, VMware ESXi, and Microsoft Hyper-V
* **Type 2 Hypervisor**
is a software that runs on a host operating system.
This Hypervisor creates a process and allocates system resources like
memory, persistent storages, and other vital things.
Then guest OS runs inside this process and uses available resources.
Here Hypervisor acts as a middle man between the guest OS
and host OS to translate guest OS instructions so that host OS can understand it.
Type 2 Hypervisors: VMware Workstation, VMware Player, Oracle VirtualBox

## What is VirtualBox?
>**NOTE:** VirtualBox is great and most of time it is adequate.
>But it does not support [nested virtualzation][06] which is the ability to
>run virtual machines within another virtual machine.
>Most of hypervisors like VMware Fusion, Hyper-V and QEMU except VirtualBox support such a feature.

## Physical Networking
* network adapters / network interface controller (NIC)

## Virtual Networking
While physical networking connects computers through cabling and other hardware,
virtual networking extends these capabilities by using software management
to connect computers and servers over the Internet.
It uses virtualized versions of traditional physical network tools,
like switches and network adapters, allowing for more efficient routing and easier network configuration changes.

Virtual networking enables communication between multiple computers,
virtual machines (VMs), virtual servers, or other devices across a physical or virtual network.

Virtual networking isn't a new concept.
One example of virtual networking is a virtual private network (VPN),
which creates a secure connection between one network and another over the Internet.
is an example of virtual networking is a virtual local area network (VLAN). A VLAN is a subgroup of a network, which combines multiple network devices into one grouping, or domain, and partitions it off from the rest.
A virtual extensible LAN (VXLAN) is another example of virtual networking. Beyond simply dividing a network into subgroups, VXLANs can virtualize an entire network, providing large-scale overly network and segmentation capabilities.

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

### PortForwarding
While not strictly a networking mode or capability,
port forwarding is a process of intercepting traffic addressed to the appropriate IP address and port in addition to redirecting that traffic to a different IP address and/or port. Special applications can be used on computers and other router devices to configure port forwarding. One of the most popular use cases for port forwarding is by providing access to particular network services that are hidden behind the NAT from external networks. After configuring port forwarding rules, clients can access the appropriate services from outside by connecting to the router’s (host’s) external IP address and specified port.

## What is Vagrant?
One of the great features of Vagrant is that users are never tied to one virtualization platform
(Virtualbox, VMware, Hyper-V etc.),
rather they can create workflows that work with any or all of these simultaneously.

You can think of Vagrant as a pretty sophisticated wrapper around virtualization.
It allows users to configure test environments regardless of their virtualization solution
and know that the end result will be the same configured virtual machine.

One of the great features of Vagrant is the ability to configure entire environments
in code within a single configuration file (Vagrantfile).
This means that with one command, `vagrant up`,
you can bring multiple virtual machines up at once, and even with their own private networking.

In order to access the Vagrant VMs you create,
Vagrant supports some high-level networking options for things such as
forwarded ports, connecting to a public network, or creating a private network.
These high-level networking options are meant to define an abstraction that works across multiple providers.
This means that you can take your `Vagrantfile` you used to spin up VMs using VirtualBox
and you can reasonably expect that `Vagrantfile` to behave the same with something like VMware.

By default, we can access Vagrant VMs via SSH using the `vagrant ssh` command.
When we access a VM via SSH, Vagrant forwards `port 22` from the guest machine to an open port in the host machine.
Vagrant automatically handles this port forwarding process without any user intervention.


* [A Beginner's Guide for Vagrant](https://blog.jeffli.me/blog/2016/12/06/a-beginners-guide-for-vagrant/)
* [Vagrant Networking Explained](https://blog.jeffli.me/blog/2017/04/22/vagrant-networking-explained/)
* [Vagrant: Up and Running by Mitchell Hashimoto: Networking in Vagrant](https://www.oreilly.com/library/view/vagrant-up-and/9781449336103/ch04.html)
* [VirtualBox Network Settings: Complete Guide](https://www.nakivo.com/blog/virtualbox-network-setting-guide/)
* [How To Configure Networking In Vagrant](https://ostechnix.com/how-to-configure-networking-in-vagrant/)
* [Vagrant beyond the basics](https://fedoramagazine.org/vagrant-beyond-basics/)

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

In private networking, a virtualized subnet that is invisible from outside of Vagrant host will be created by the underling provider. Virtual machines attached to the same virtualized subnet are ables to communicate with each other. Unlike public networking, there is no way for IPs on the host's networkto connect to the virtual machines directly.

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
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:


