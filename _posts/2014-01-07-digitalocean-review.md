---
layout: post
title: "DigitalOcean - a review and comparison"
category: posts
permalink: "digitalocean-review-comparison"
featured_image: /images/cloud-hosting.jpg
cover_image: /images/cloud.jpg
description: "DigitalOcean or Amazon EC2? It's not so hard to choose"
keywords:
 - digitalocean
 - vps
 - amazon
 - ec2
 - review
 - benchmark
 - cpu
 - ssd
 - disk
 - speed
comments: true
share: true
image:
  social: UHEDRVOEQN.jpg
  social_thumb: 
---

## The setting

[DigitalOcean](https://www.digitalocean.com/) is a fairly new kid on the block of cloud vps and they have a very bold tagline: "Simple Cloud Hosting built for developers".
Let's see if they live up to it :)

The services they provide are quite basic - you get VPS's in the cloud and DNS management, that's all. No fancy load balancing, hosted databases, hadoop clusters, etc.. Compared to AWS, for example this could be seen as a disadvantage, but don't judge just yet.  


Let's see some features of this simple cloud vps provider:

- Performant SSD drives (!!!)
- KVM virtualization technology with guaranteed system resources
- Server network speed at 1Gbps
- Dedicated IP addresses
- Easy resizing of nodes
- Application 'images' - pre-built images for a few apps (Wordpress, LAMP, RoR)
- Data centers in Europe and the US (Currently Amsterdam and New York)
- Free and fast private network in the datacenters
- 99.99% uptime SLA
- 24/7 support
- Really good pricing level
- 55s spin-up time for servers
- An API

## The pricing

You simply can't beat the pricing of DigitalOcean servers. 

Here's a chart taken from [their pricing comparison page](https://www.digitalocean.com/price-comparison-chart)

<img alt="DigitalOcean prices" title="DigitalOcean prices" src="/images/digitalocean-pricing-comparison.jpg" width="800" height="417" />

What's really great about these low prices is that you can get on and build a small but scalable cloud architecture for yourself and try your startup ideas in a way it won't vacuum your wallet empty and you won't be scratching your head when your startup starts booming and you need to scale. 

One other thing I just LOVE about their pricing page is that they list the prices monthly, not just per hour. There are no hidden costs (compare that to AWS's traffic pricing, EBS volume prices, fixed IP prices...),

## The benchmarks

Let's see how EC2 instances perform compared to DigitalOcean droplets (DO droplet == EC2 instance). 

The servers I tested:  
Smallest DigitalOcean droplet: 512 Mb RAM, 1 CPU - $5 / month  
More potent DigitalOcean droplet: 2GB RAM, 2 CPU - $20 / month  
EC2 m1.medium: 3.75 GB RAM, 1 VCPU - $87.84 / month  
EC2 m1.large: 7.5 GB RAM, 2 VCPU - $175.68 / month  

I left out the t1.micro EC2 instance on purporse as it's a very low performant, yet it costs $14.64 / month

### Disk speed

#### Reading 128K with random access

<img alt="Cloud Disk Benchmark" title="Cloud Disk Benchmark" src="/images/cloud_disk_random_reads.png" width="884" height="650" />

Ouch. A serious burn for AWS. 

#### Now for something more real-world: four threads, two readers, two writers with async I/O (aio)

<img alt="Cloud Disk Benchmark" title="Cloud Disk Benchmark" src="/images/cloud_disk_real_world.png" width="884" height="650" />

Yikes. Would anyone want to host anything disk-intensive on EC2 anymore?

### CPU speed

<img alt="Cloud CPU Benchmark" title="Cloud CPU Benchmark" src="/images/cloud_cpu_speed_comparison.png" width="884" height="650" />

You can clearly see that we're getting very powerful computing power for much less money at DigitalOcean.


## The missing features

I'm really missing [ELB](http://aws.amazon.com/elasticloadbalancing/). Elastic Load Balancing is a great way to do fire-and-forget load balancing without having to worry about scaling. Its pricing is also really great and you can easily add and remove nodes using their API. 

You don't have anything like this at DigitalOcean (A great opportunity, DigitalOcean guys! Please create such a service, I'd gladly pay for it).

You don't have DynamoDb or ElastiCache either. No RDS. No nothing. You're back to your oldschool ops mojo and you have to build your infrastructure yourself. This can be a good thing actually, though building a repicated HA DB cluster is one of the challenges few are willing to take on. 

It's not so hard to create a HA cloud though using Chef or anything similar (I'm using SaltStack btw). Here's what I did:

- I left my domains at Route53. It's a great and cheap service with wonderful edge location coverage and features.
- I launched two $5 DigitalOcean droplets, both running HAProxy with managed identical configuration
- I set up a weighted round-robin scenario for these two load balancer instances in Route53 with health checks. This way if all LBs operate the load is distributed nicely and if any of them goes down, all peers are redirected to the remaining LBs in 60s (this latency could be lowered if neccessary)

## My conclusion

DigitalOcean is clearly a great and cheap way to start experimenting with the cloud, it's infrastructures and create a low-cost, scalable solution for your Next Great Idea&trade; but it has many ways to improve, e.g. removing the burden of the oh-so-typical infrastructural parts - load balancing or replicated databases with in-house solutions.

## UPDATE

Due to a request by [dzsol](https://twitter.com/dzsol) I benchmarked a c3.large instance too.
This instance's characteristics: $40/mo over 3yrs if you pay the total amount upfront, 3.75GB RAM, 7CU, 32GB SSD.

The results are (without a fancy graph):

- CPU 64 threads: 16s
- CPU 1 thread: 27s
- random read: 7980KB/s
- server IO workflow:  READ: 7255KB/s , WRITE: 9570KB/s

We can see the CPU is powerful (no wonder the c-line is called compute-intensive) but the I/O still sucks big time. I had a hard time believing it really had an SSD but I double-checked and it's not a rotational disk according to sysfs.

The benchmarks I used can be found [here](https://gist.github.com/ochronus/8367815)

