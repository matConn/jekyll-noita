---
title: Chromebook Web Development
layout: post
description: A breakdown of my current web development setup on my Samsung Chromebook 3.
robots: none
published: true
comments: true
---
## Quick Rundown
- **Machine:**
	- Samsung Chromebook 3
- **Environment:**
	- ChromeOS for a GUI and native drivers
    - Lubuntu for server-side programs and scripts (treated as headless)
- **Text Editor/IDE**
	- [Caret-T](https://chrome.google.com/webstore/detail/caret-t/agiednhnlghobdgpgfdnbdaflnngmoij?hl=en)

I recently purchased a Samsung Chromebook 3 so I could work on projects during my long commute or at my local coffee shop without worrying about losing or breaking my other more expensive portable machine. It's really nice and light, and with a little configuration, makes for a great portable web development environemnt. After all, ChromeOS is itself a linux distro, but things are a little hidden in this environment as ChromeOS is meant to be easily accessible and to leave the user as little room as possible to screw things up.

## First, Enable Developer Mode
[Enabling developer mode](http://www.howtogeek.com/210817/how-to-enable-developer-mode-on-your-chromebook/) is very easy and necessary to get things started. This will allow you to access ChromeOS's native shell, or "Crosh", which runs in Chrome as an extension which is really cool; ctrl+alt+t will bring you there. From Crosh, we can then access our typical unix shell by simply typing "shell."

But now lets say we want another distro to run along side ChromeOS?

## Creating A Chroot For Running Another Distro
A chroot, or change root, gives us the ability to run this second distro, without partitioning the disk or using a virtual machine, while still being able to access the same files across both environments. I installed LXDE because the Chromebook I purchased had only 2 gigs of RAM, and used [Crouton](https://github.com/dnschneid/crouton) to create the chroot.

This second distro is nice because if you are familiar with the Linux environment, you can proceed to work as you normally would, with Aptitude, Python, PHP and everyhing else already installed, and without all the limitations of ChromeOS.

## ChromeOS Is Still Very Nice, And An Integral Part Of This Setup
ChromeOS makes for a very friendly desktop environment despite the red tape, and handles keyboard and trackpad input with its native drivers; I access the chroot via terminal to run scripts and install programs, but work with the ChromeOS GUI. For a text editor, I use [Caret-T](https://chrome.google.com/webstore/detail/caret-t/agiednhnlghobdgpgfdnbdaflnngmoij?hl=en), which is installed as a Chrome extension, and comes with intellisense-like auto-completion for JavaScript.
