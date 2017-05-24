---
title: Chromebook Linux - From Crouton to GalliumOS
layout: post
description: How I finally got to use my Chromebook as a full-featured Linux machine.
robots: none
comments: true
published: true
---

I love my Chromebook (as evidenced in [this](http://{{ site.noita.domain }}/blog/2016/chromebook-web-development/) post); I bring it everywhere as it comes in handy for long commutes and, weighing in at around 3 pounds, isn't the least bit cumbersome.  

However, the restrictions ChromeOS placed on me had been noticeable since the beginning; and I knew I would be restricted to Chrome Apps, extensions, and Play store applications, but didn't count on how annoying this restriction would wind up being. Fortunately, there were workarounds.  

## Crouton: An Early Solution
[Crouton](https://github.com/dnschneid/crouton) proved to be very easy to install and useful from the start. By creating a chroot and installing my distro of choice in it, I could run Ubuntu either by switching over to the chroot or accessing it from the Crosh command line.  

There was a problem, however; Ubuntu didn't have the greatest driver support for my Chromebook's trackpad and keyboard. So I found myself running Linux programs from the command line that ChromeOS typically wouldn't allow (such as PHP, Python, and naturally, apt-get), but actually working in the ChromeOS environment, as it was just that much more supportive of the machine (Samsung Chromebook 3).  

But now if I wanted to play a game in an emulator such as Mupen64plus or WINE, I could not run that from the command line while in ChromeOS; it would throw an error in regards to X-server, forcing me to switch over to the chroot just for one program.  

## GalliumOS: My Current (And Best, So Far) Solution
Finally I thought I would consider [GalliumOS](https://galliumos.org/); a distro made specifically for Chromebooks. I made a ChromeOS recovery image and made a GalliumOS bootable USB and gave it a try.  

It worked nicely; it was a complete Linux environment that supported my machine's brightness and volume keys, and with better "palm detection" (think Macbook trackpads and your resting thumb) out of the box without messing about with Synaptics.  

Initially, there was no sound support for my model. This stopped from installing it for a bit, but after trying a few other options, one including running a chroot off an SD card (for extra space for packages; it gets ejected when the machine sleeps unfortunately), I figured I'd deal with the sound issue. (At the time, the bug was that no internal sound was supported, but Bluetooth sound was.)  

After a full install, made easy thanks to GalliumOS's excellent documentation, and then finally a GalliumOS update, to my surprise, internal audio worked, and so I'm now using my Chromebook as I please, with the ability to install my favorite programs such as Visual Studio Code (a program I wanted on my Chromebook from the very start), WINE, and all the rest; with that update came the patch that fixed my model's sound issue.  

As I find myself installing and re-installing Linux pretty often, as with the example of setting up chroots mentioned earlier, I began tracking my environment's packages, as well as Visual Studio Code extensions, which you can check out in a repository [here](https://github.com/mattConn/ubuntu-environment-setup).
