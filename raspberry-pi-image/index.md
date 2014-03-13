---
layout: page
---

# Meshnet Raspberry Pi image

In an effort to make joining the mesh as simple as possible, a Raspberry Pi image with
the necessary software has been created. The steps on this [wiki page](http://wiki.projectmeshnet.org/Install_on_Raspberry_Pi)
were followed to create the image.

Download it [here](https://www.dropbox.com/s/dld2fzkqm0o3g05/meshnetpi-2014-03-09.img) from Dropbox.


## What's included
- Based on most recent __Raspbian__ image as of now (2014-01-07)
- __NaCl__ optimized for the Raspberry Pi
- __cjdns__ installed (with init script)

After following the installation steps below, cjdns will be running and ready to auto-peer
on it's Ethernet port.


## Installation

1. Flash the image to your SD card
  - _Windows:_ [Win32 Disk Imager](http://sourceforge.net/projects/win32diskimager/)
  - _BSD/UNIX/Linux:_ with XXX as the SD card device name
`dd if=meshnetpi-2014-03-09.img of=/dev/XXX`
2. Boot the Raspberry Pi with the freshly flashed SD card
3. Connect the Pi to your wireless router via an Ethernet cable
  connected to the Ethernet port
4. SSH into the Pi and run a script to finish the installation<br>
  (user: _pi_ password: _raspberry_)<br>
`ssh pi@meshnetpi.local`<br>
`./meshnet/finish_install.sh`
5. Run raspi-config and expand your disk space<br>
`raspi-config`
6. Update the software<br>
`sudo apt-get dist-upgrade && sudo apt-get upgrade`

And done! Your Raspberry Pi is now ready to peer with other cjdns nodes.


### Misc. notes

- Though the Raspbian image is distributed on the stable "Wheezy" Debian release, this image
  has been set to the testing "Jessie" release. This is because a newer version of ip6tables
  is required to set the Raspberry Pi to NAT your home network (allowing any non-cjdns-enabled
  devices to access to the network, including Hyperboria).
