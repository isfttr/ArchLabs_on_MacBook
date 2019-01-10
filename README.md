# Configuration files for ArchLabs

This is a simple ArchLabs configuration that is currently
running on a MacBook Pro 13" 9.2 (mid 2012). 

### Why ArchLabs

I did use ArchLabs for the first time a while ago but didn't
really like it because my installation was a little bit
bloated and it was too many things too soon for me to fully
comprehend the masterpiece that it is. I tossed it and came
back to it recently and I'm loving it. ArchLabs is very
simple to install and a killer feature, personally, is that
you can choose the programs you want to install, and the
list is very minimal, making your system minimalistic and
easier to navigate.

For a laptop that is approaching 6 years of almost daily
use, ArchLabs was the answer to a ever more bloated MacOS. I
was beginning to get stressed about the loading times for
the applications, for booting the system, for the high
memory use, for having to run crappy programs and so on. On
top of all that, I don't want to buy a new Apple computer in
the foreseable future - if ever. MacBooks have been trashed
in the latest updates and are more expensive than any other
option in the market. I can say that my current laptop is
reminiscent of the golden days of Apple and I plan to use
this machine until it stops working. 

It is refreshing to use the same notebook but with a better
perfomance and easier-to-use interface - aka terminal. I'm
adapting quickly to this new setup and might do the same to
my iMac - well, I don't plan to comeback. I will continue to
update this setup until everything is working.

### Screenshots of the current setup

![ArchLabs_on_MacBook](ArchLabs_on_MacBook.png) ![Vifm and
Neovim](vifm_ArchLabs_on_MacBook.png)

## List of features

- **Hardware that is fully working**: keyboard (and light),
    monitor brightness levels, sound controls, fan.
- **Hardware that is working but not ideally**: the battery
    is having a higher consumption.
- **Software installed**: st, vifm, rofi, dunst, neovim
    (using vim-plug with no issues), mpv, flameshot,
    calcurse, newsboat.
- **User interface**: i3 gaps w/ gruvbox theme.

## What is not working yet

- **Keyboard**: the function keys for music are not assigned
    to any music player since I'm running `mpv`. There might
    be way to setup the function keys to play/pause music in
    mpv using the keys but I didn't try to setup that yet.
- **Email**: I'm trying to set up `mutt` to properly run but
    currently having problems with `offlineimap` so it is
    not syncing. If your are not going to use mutt, than you
    shoul try `mailspring` that has a nice gui and works
    fine with gmail in this computer.
- **Wireless**: I know for a fact that this machine supports
    5GHz wifi but I ran `iwlist freq` and it only shows
    2.4GHz. As of the time of this writing, I don't have a
    clue on how to make it recognize 5GHz wifi.

## Quick fixes

This a list of quick fixes to the problems I found during
the installation and configuration of ArchLabs on my
machine.

### Use `st` instead of `urxvt`

When I first installed ArchLabs I used the urxvt terminal
but I found out about the problems it had over color
compatibility -- syntax on neovim was not working.  The
workaround urxvt was to install st from
[LukeSmithxyz](https://github.com/LukeSmithxyz/st) which
pretty much worked out of the box. The font is set to 16 and
might show too big on your system. To change that, go to the
configuration file and make the wanted changes and rerun
`make && make install`.

### Keyboard light

It was a lot easier than I thought. Just search for `yay -s
kbdlight` and install it. The commands are really simple,
just read the [git
page](https://github.com/WhyNotHugo/kbdlight).  Actually, I
implement a shortcut to the i3 config file so you can just
use the buttons on the keyboard.

### Cedilla for portuguese/spanish

If you made the installation using en_US.UTF-8, like me,
probably the cedilla will not be working when pushing "' +
c".  The workaround for me was to use the command `inkb`
listed on the
[.bashrc](https://github.com/isetfiretotherain/ArchLabs_on_MacBook/blob/master/dotfiles/.bashrc)
together with the creation of the
[~/.XCompose](https://github.com/isetfiretotherain/ArchLabs_on_MacBook/blob/master/dotfiles/.XCompose)
file.

### Wireless

The network device is BCM4331 which means it needs the
`b43-firmware` that can be installed via `yay -s`. When
running `iwconfig` and getting the `no wireless extensions`
response, the quickest fix was found in this
[question](https://askubuntu.com/questions/470153/no-wireless-when-install-14-04-on-macbook-pro).
After installing the firmware, run the following commands
`sudo modprobe -rv b43` and `sudo modprobe -v b43`. Test the
`iwconfig` again.

### Battery life

The battery has improved hugely over the week and after the
modifications listed by [Michael
Chladek](https://mchladek.me/post/arch-mbp/).  Namely,
installing `powertop`, `thermald` and `cpupower` just like
he described. When running `powertop` for the first time,
the screen will go black for a few minutes for a couple of
times - don't freak out. After installing everything and
enabling the `.service`'s, reboot. I also installed
`cpupower-gui` so I could easily set the max clock for the
CPU at 2.9 GHz, instead of 3.1. As far as I researched,
`thermald` doesn't need further configurations, you just
need to enable it.

### OneDrive

The best way to get OneDrive to work is using the fork by
[abraunegg](https://github.com/abraunegg/onedrive). The
[Skillion](https://github.com/skilion/onedrive) one worked
for the first time but stopped working for some weird reason
that I didn't fully comprehend. Known problem is a
incompatibility between `curl 7.63` and `onedrive`.  The
workaround was to use the package `downgrade` to switch
`curl 7.61`. 

## Coming soon

- [ ] music setup with ncmpcpp 
- [ ] mutt 
- [x] list of features
- [x] newsboat setup 
- [x] further information links

## Further information

I found a really useful article by [Michael
Chladek](https://mchladek.me/post/arch-mbp/) on his
installation on a 2015 MacBook.

## Contact information

- email: isetfire@protonmail.com
