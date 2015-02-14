---
layout: post
title: "A Docker primer – from zero to a running Django app"
category: posts
permalink: "docker-primer-django"
featured_image: /images/docker.png 
cover_image: /images/docker.jpg 
description: "Let's create a docker container and run a basic Django app - step by step."
keywords:
- docker
- django
- development
- virtualization
- development environment
- devops
- dev env
comments: true
share: true
image:
  social: docker.jpg
  social_thumb: 
---
Let's create a docker container and run a basic Django app - step by step.  


[Docker](http://www.docker.io/) is a great tool for creating and managing lightweight isolated application environments, a.k.a. containers. Docker is a wonderful layer on top of Linux containers (LXC). If you’re not familiar with Linux containers, the easiest way to think of them is like extremely lightweight VMs – they allow Linux operating systems to host other copies of Linux, safely sharing access to resources without the overheard of something like Xen or VirtualBox.

## Let's get started!

If you're already using linux, you can skip the next part, but on OS X, you need to run docker using a Virtualbox linux image at this point.

## Installing Vagrant (only neccessary for non-Linux hosts)

Vagrantfile:

{% highlight ruby %}
Vagrant.configure("2") do |config|
  config.vm.box = "raring"
  config.vm.box_url = "http://cloud-images.ubuntu.com/raring/current/raring-server-cloudimg-vagrant-amd64-disk1.box"
  # we'll forward the port 8000 from the VM to the port 8000 on the host (OS X)
  config.vm.network :forwarded_port, host: 8000, guest: 8000
  config.vm.synced_folder("vagrant-docker", "/vagrant")

  # add a bit more memory, it never hurts. It's VM specific and we're using Virtualbox here.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end
end
{% endhighlight %}

Create the shared folder

{% highlight bash %}
mkdir vagrant-docker
{% endhighlight %}

Boot up the VM with Vagrant

{% highlight bash %}
☯ ~/Devel/Own/docker-deploy-blogpost $ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
[default] Importing base box 'raring'...
[default] Matching MAC address for NAT networking...
[default] Setting the name of the VM...
[default] Clearing any previously set forwarded ports...
[default] Creating shared folders metadata...
[default] Clearing any previously set network interfaces...
[default] Preparing network interfaces based on configuration...
[default] Forwarding ports...
[default] -- 22 => 2222 (adapter 1)
[default] -- 8000 => 8000 (adapter 1)
[default] Running 'pre-boot' VM customizations...
[default] Booting VM...
[default] Waiting for VM to boot. This can take a few minutes.
[default] VM booted and ready for use!
[default] Mounting shared folders...
[default] -- /vagrant
☯ ~/Devel/Own/docker-deploy-blogpost $
{% endhighlight %}

Now ssh into the VM:

{% highlight bash %}
☯ ~/Devel/Own/docker-deploy-blogpost $ vagrant ssh
Welcome to Ubuntu 13.04 (GNU/Linux 3.8.0-29-generic x86_64)

 * Documentation:  https://help.ubuntu.com/

  System information as of Fri Aug 30 10:43:37 UTC 2013

  System load:  0.25              Processes:           80
  Usage of /:   2.4% of 39.33GB   Users logged in:     0
  Memory usage: 8%                IP address for eth0: 10.0.2.15
  Swap usage:   0%

  Graph this data and manage this system at https://landscape.canonical.com/

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

  Use Juju to deploy your cloud instances and workloads:
    https://juju.ubuntu.com/#cloud-raring

0 packages can be updated.
0 updates are security updates.

vagrant@vagrant-ubuntu-raring-64:~$
{% endhighlight %}

## Installing Docker (0.6)

First, install some requirements (Docker needs linux-image-extra, and add-apt-repository is provided by software-properties-common)
{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ sudo apt-get install linux-image-extra-$(uname -r) software-properties-common
{% endhighlight %}
Then install docker
{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
vagrant@vagrant-ubuntu-raring-64:~$ sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
vagrant@vagrant-ubuntu-raring-64:~$ sudo apt-get update
vagrant@vagrant-ubuntu-raring-64:~$ sudo apt-get install lxc-docker
{% endhighlight %}

## Getting to know Docker a bit

Now that we have Docker installed and ready to roll, let's look at some basic commands. The official Docker 'getting started' guide is the real deal, go ahead and read it.

Let's pull a base image

{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ sudo docker pull ubuntu
Pulling repository ubuntu
Pulling image 8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c (precise) from ubuntu
Pulling 8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c metadata
Pulling 8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c fs layer
Downloading 58.34 MB/58.34 MB (100%)
Pulling image b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc (quantal) from ubuntu
Pulling b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc metadata
Pulling b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc fs layer
Downloading 10.24 kB/10.24 kB (100%)
Pulling 27cf784147099545 metadata
Pulling 27cf784147099545 fs layer
Downloading 94.86 MB/94.86 MB (100%)
vagrant@vagrant-ubuntu-raring-64:~$
{% endhighlight %}

Now let's check if it's working

{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ sudo docker run ubuntu /bin/echo hello there, docker user
hello there, docker user

# curious about the platform this container has?
vagrant@vagrant-ubuntu-raring-64:~$ sudo docker run ubuntu uname -a
Linux cf95ac04d25d 3.8.0-29-generic #42-Ubuntu SMP Tue Aug 13 19:40:39 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux
{
# now see the host's uname
vagrant@vagrant-ubuntu-raring-64:~$ uname -a
Linux vagrant-ubuntu-raring-64 3.8.0-29-generic #42-Ubuntu SMP Tue Aug 13 19:40:39 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux
{% endhighlight %}

The first echo was run in the docker container, as the second example shows, see it has a different uname string than the host, though very similar (kernel and architecture).

To see what images are available locally, use:

{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ sudo docker images
REPOSITORY          TAG                 ID                  CREATED             SIZE
ubuntu              12.04               8dbd9e392a96        4 months ago        131.5 MB (virtual 131.5 MB)
ubuntu              12.10               b750fe79269d        5 months ago        24.65 kB (virtual 180.1 MB)
ubuntu              latest              8dbd9e392a96        4 months ago        131.5 MB (virtual 131.5 MB)
ubuntu              precise             8dbd9e392a96        4 months ago        131.5 MB (virtual 131.5 MB)
ubuntu              quantal             b750fe79269d        5 months ago        24.65 kB (virtual 180.1 MB)
{% endhighlight %}

As you can see, the base ubuntu image includes multiple versions.

Now, you might ask why do I always have to sudo? Well, in the previous versions of docker dockerd used to listen on an HTTP port (4243), but now it uses a socket file:

{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ ls -lah /var/run/docker.sock 
srw-rw---- 1 root root 0 Aug 30 10:48 /var/run/docker.sock
{% endhighlight %}

If you look at the access rights, it's only usable from the root group. This is actually not a bad thing, but you can add a docker group (docker will automatically use this if available):

{% highlight bash %}
# create the 'docker' group
vagrant@vagrant-ubuntu-raring-64:~$ sudo groupadd docker
# add your user to the 'docker' group
vagrant@vagrant-ubuntu-raring-64:~$ sudo gpasswd -a vagrant docker
Adding user vagrant to group docker
# restart docker so it uses the 'docker' group
vagrant@vagrant-ubuntu-raring-64:~$ sudo service docker restart
docker stop/waiting
docker start/running, process 12032
vagrant@vagrant-ubuntu-raring-64:~$ ls -lah /var/run/docker.sock 
srw-rw---- 1 root docker 0 Aug 30 11:19 /var/run/docker.sock
# now you have to relogin for the group setting on your user to be active. After that you can go without sudo:
vagrant@vagrant-ubuntu-raring-64:~$ docker images
REPOSITORY          TAG                 ID                  CREATED             SIZE
ubuntu              12.04               8dbd9e392a96        4 months ago        131.5 MB (virtual 131.5 MB)
ubuntu              12.10               b750fe79269d        5 months ago        24.65 kB (virtual 180.1 MB)
ubuntu              latest              8dbd9e392a96        4 months ago        131.5 MB (virtual 131.5 MB)
ubuntu              precise             8dbd9e392a96        4 months ago        131.5 MB (virtual 131.5 MB)
ubuntu              quantal             b750fe79269d        5 months ago        24.65 kB (virtual 180.1 MB)
{% endhighlight %}

Let's run something more useful, a very basic daemon

{% highlight bash %}
# run a process which echoes 'hello world' in every second
CONTAINER_ID=$(sudo docker run -d ubuntu /bin/sh -c "while true; do echo hello world; sleep 1; done")
{% endhighlight %}

Whoa. Let's see all the details:

CONTAINER_ID :  store the container's id in this shell variable so that it'll be easier to reference later
docker run -d : tell docker to run as a daemon
Let's look at the logs of the container

{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ docker logs $CONTAINER_ID | head
hello world
hello world
hello world
{% endhighlight %}

Let's list the running containers

{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ docker ps
ID                  IMAGE               COMMAND                CREATED             STATUS              PORTS
8a5de93a93a8        ubuntu:12.04        /bin/sh -c while tru   4 minutes ago       Up 4 minutes                            
vagrant@vagrant-ubuntu-raring-64:~$ echo $CONTAINER_ID
8a5de93a93a8
{% endhighlight %}

Aha, there we are with our id. We can attach the console to the container:

{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ docker attach $CONTAINER_ID
hello world
hello world
hello world
hello world
hello world
hello world
^Cvagrant@vagrant-ubuntu-raring-64:~$
{% endhighlight %}

And of course we can stop the container.

{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ docker stop $CONTAINER_ID
8a5de93a93a8
vagrant@vagrant-ubuntu-raring-64:~$ docker ps
ID                  IMAGE               COMMAND             CREATED             STATUS              PORTS
vagrant@vagrant-ubuntu-raring-64:~$
{% endhighlight %}

## A basic django app on Docker

Let's run a new container with an interactive console

{% highlight bash %}
vagrant@vagrant-ubuntu-raring-64:~$ DJANGO_APP=$(sudo docker run -d -i -t -p 8000:8000 ubuntu /bin/bash)
vagrant@vagrant-ubuntu-raring-64:~$ docker ps
ID                  IMAGE               COMMAND             CREATED             STATUS              PORTS
3623418e0f85        ubuntu:12.04        /bin/bash           5 seconds ago       Up 4 seconds        8000->8000          

# now let's attach to it
vagrant@vagrant-ubuntu-raring-64:~$ docker attach $DJANGO_APP
root@807f3eb43b5c:/#
{% endhighlight %}

What's -i, -t and? See the official docs. (hint: these help running the container in the background)

-p 8000:8000 tells docker to forward port 8000 of the container to port 8000 of the host (Yes, this is a double-forward if you're using Virtualbox).

Add some extra repos to sources.list and install pip

{% highlight bash %}
root@2f6a9bcda315:/# cat > /etc/apt/sources.list
deb http://archive.ubuntu.com/ubuntu precise main universe multiverse
root@2f6a9bcda315:/# apt-get update
.
.
.
root@2f6a9bcda315:/# apt-get install python-pip
Use pip to install Virtualenv

root@2f6a9bcda315:/# pip install virtualenv
Downloading/unpacking virtualenv
  Downloading virtualenv-1.10.1.tar.gz (1.3Mb): 1.3Mb downloaded
  Running setup.py egg_info for package virtualenv

    warning: no files found matching '*.egg' under directory 'virtualenv_support'
    warning: no previously-included files matching '*' found under directory 'docs/_templates'
    warning: no previously-included files matching '*' found under directory 'docs/_build'
Installing collected packages: virtualenv
  Running setup.py install for virtualenv

    warning: no files found matching '*.egg' under directory 'virtualenv_support'
    warning: no previously-included files matching '*' found under directory 'docs/_templates'
    warning: no previously-included files matching '*' found under directory 'docs/_build'
    Installing virtualenv script to /usr/local/bin
    Installing virtualenv-2.7 script to /usr/local/bin
Successfully installed virtualenv
Cleaning up...
root@2f6a9bcda315:/#
{% endhighlight %}

Create a basic Django app (I assume you know your way around Django and Python in general)

{% highlight bash %}
# django-toolbelt deps
apt-get install libpq-dev python-dev

mkdir docker_django && cd docker_django
virtualenv --no-site-packages venv
source venv/bin/activate
pip install django-toolbelt
django-admin.py startproject docker_django .
{% endhighlight %}

Run the Django server

{% highlight bash %}
(venv)root@3623418e0f85:/docker_django# python manage.py runserver 0.0.0.0:8000
Validating models...

0 errors found
August 30, 2013 - 07:02:46
Django version 1.5.2, using settings 'docker_django.settings'
Development server is running at http://0.0.0.0:8000/
Quit the server with CONTROL-C.
{% endhighlight %}

Now if you load 'http://localhost:8000/' in your browser on the host OS, you should see the Django welcome page.


I hope this primer was useful to you. Please share your thoughts as comments and don't forget to share & like the post! Thank you for your attention.

