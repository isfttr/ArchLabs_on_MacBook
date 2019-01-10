# Configuration files for ArchLabs

This is a simple configuration that is currently running on
a MacBook Pro mid-2012. Currenly it is using i3 gaps in a
solarized colorscheme.

When I first installed ArchLabs I used the urxvt
terminal but I found out about the problems it had over
color compatibility -- syntax on neovim was not working.
The workaround urxvt was to install st from
[LukeSmithxyz](https://github.com/LukeSmithxyz/st) which
pretty much worked out of the box. The font is set to 16
and might show too big on your system. To change that, go
to the configuration file and make the wanted changes and
rerun `make && make install`.

## Screenshots of the setup
![ArchLabs_on_MacBook](ArchLabs_on_MacBook.png)
![Vifm and Neovim](vifm_ArchLabs_on_MacBook.png)
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
    to any music player since I'm running `mpv`. There might be
    way to setup the function keys to play/pause music in mpv
    using the keys but I didn't try to setup that yet.
- **Email**: I'm trying to set up `mutt` to properly run but
    currently having problems with `offlineimap` so it is
    not syncing. If your are not going to use mutt, than you
    shoul try `mailspring` that has a nice gui and works
    fine with gmail in this computer.
    
## Quick fixes

### Keyboard light

It was a lot easier than I thought. Just search for `yay -s
kbdlight` and install it. The commands are really simple,
just read the [git page](https://github.com/WhyNotHugo/kbdlight).
Actually, I implement a shortcut to the i3 config file so
you can just use the buttons on the keyboard.

### Cedilla for portuguese/spanish

If you made the installation using en_US.UTF-8, like me,
probably the cedilla will not be working when pushing "' + c".
The workaround for me was to use the command `inkb` listed on the 
[.bashrc](https://github.com/isetfiretotherain/ArchLabs_on_MacBook/blob/master/dotfiles/.bashrc) 
together with the creation of the [~/.XCompose](https://github.com/isetfiretotherain/ArchLabs_on_MacBook/blob/master/dotfiles/.XCompose) file.

### Wireless

The network device is BCM4331 which means it needs the
`b43-firmware` that can be installed via `yay -s`. When
running `iwconfig` and getting the `no wireless extensions`
response, the quickest fix was found in this [question](https://askubuntu.com/questions/470153/no-wireless-when-install-14-04-on-macbook-pro).
After installing the firmware, run the following commands
`sudo modprobe -rv b43` and `sudo modprobe -v b43`. Test the
`iwconfig` again.

### Battery life

The battery has improved hugely over the week and after the
modifications listed by [Michael Chladek](https://mchladek.me/post/arch-mbp/).
Namely, installing `powertop`, `thermald` and `cpupower`
just like he described. When running `powertop` for the
first time, the screen will go black for a few minutes for a
couple of times - don't freak out. After installing
everything and enabling the `.service`'s, reboot. I also
installed `cpupower-gui` so I could easily set the max
clock for the CPU at 2.9 GHz, instead of 3.1. As far as I
researched, `thermald` doesn't need further configurations,
you just need to enable it.

### OneDrive

The best way to get OneDrive to work is using the fork by
[abraunegg](https://github.com/abraunegg/onedrive). The
[Skillion](https://github.com/skilion/onedrive) one worked
for the first time but stopped working for some weird reason
that I didn't fully comprehend. Known problem is a
incompatibility between `curl 7.63` and `onedrive`.
The workaround was to use the package `downgrade` to switch
`curl 7.61`. 

## Coming soon

- [x] list of features
- [ ] music setup with ncmpcpp
- [ ] mutt
- [x] newsboat setup
- [x] further information links

## Further information

I found a really useful article by [Michael Chladek](https://mchladek.me/post/arch-mbp/)
on his installation on a 2015 MacBook. 

## Contact information

- email: isetfire@protonmail.com
