
<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.0.1
-->


<div align="center">
<img src="http://www.foxbyrd.com/wp-content/uploads/2018/02/file-4.jpg" title="These materials require additional work and are not ready for general use." align="center">
</div>


----


This network mode can be used to run servers on VMs that must be fully accessible from a physical local area network.

This is an example of **Bridged Networking**.
This type of virtual networking is used for connecting the virtual network adapter of a VM,
to a physical network adapter on which the VirtualBox host machine is connected.
This network mode can be used to run servers on VMs that must be fully accessible from a physical local area network.
The VM can be accessed from the host machine and from other hosts (and VMs) connected to the physical network.

```bash
# check to see if you host can connect with a box
$ ping -4 -c3 box1
PING box1.fios-router.home (192.168.1.92) 56(84) bytes of data.
64 bytes from box1.fios-router.home (192.168.1.92): icmp_seq=1 ttl=64 time=0.428 ms
64 bytes from box1.fios-router.home (192.168.1.92): icmp_seq=2 ttl=64 time=0.402 ms
64 bytes from box1.fios-router.home (192.168.1.92): icmp_seq=3 ttl=64 time=0.402 ms

--- box1.fios-router.home ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2034ms
rtt min/avg/max/mdev = 0.402/0.410/0.428/0.012 ms
```

```bash
# list status of the vagrant machine
$ vagrant status
Current machine states:

Lab01A-box1             running (virtualbox)
Lab01A-box2             running (virtualbox)
Lab01A-box3             running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.

# log into a box
vagrant ssh 'Lab01A-box1'

# check to see if you box can connect with the host
$ ping -4 -c3 desktop
PING desktop.fios-router.home (192.168.1.13) 56(84) bytes of data.
64 bytes from desktop.fios-router.home (192.168.1.13): icmp_seq=1 ttl=64 time=0.393 ms
64 bytes from desktop.fios-router.home (192.168.1.13): icmp_seq=2 ttl=64 time=0.383 ms
64 bytes from desktop.fios-router.home (192.168.1.13): icmp_seq=3 ttl=64 time=0.364 ms

--- desktop.fios-router.home ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2011ms
rtt min/avg/max/mdev = 0.364/0.380/0.393/0.012 ms

# check to see if you box can connect with another box
$ ping -4 -c3 box3
PING box3.fios-router.home (192.168.1.18) 56(84) bytes of data.
64 bytes from box3.fios-router.home (192.168.1.18): icmp_seq=1 ttl=64 time=0.965 ms
64 bytes from box3.fios-router.home (192.168.1.18): icmp_seq=2 ttl=64 time=0.728 ms
64 bytes from box3.fios-router.home (192.168.1.18): icmp_seq=3 ttl=64 time=0.719 ms

--- box3.fios-router.home ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2030ms
rtt min/avg/max/mdev = 0.719/0.804/0.965/0.113 ms
```

```bash
# scan the hosts physical network for alive hosts
sudo arp-scan 192.168.1.0/24

# scan the hosts physical network for VMs
sudo arp-scan 192.168.1.0/24 | grep 08:00:27

# ping sweep without nmap
# waits for all pings to complete and returns ip with mac address
(echo -e "IP Address\tMAC Address" ; prefix="192.168.1" && for i in `seq 254`; do (sleep 0.5 && ping -c1 -w1 $prefix.$i &> /dev/null && arp -n | awk ' /'$prefix'.'$i' / { print $1 "\t" $3 } ') & done; wait)

# what devices are connect to your network
sudo nmap -v -sL 192.168.1.0/24

# ping scan on the specified network
sudo nmap -sP 192.168.1.0/24
```
