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

## What is not working yet

- **Battery**: it is not optimized so it is consuming more than
    it should, even though the computer is operating in a
    lower capacity than while in MacOS. Currently, I'm using the
    Xfce Power Manager which is easy to setup and gives me
    an estimate for the battery consumption when the
    computer is not plugged. If you're looking for a quick
    fix, I have found in the past solutions that involved
    `tlp`. Before the current installation, I used it but not
    enough to say if it made a difference. Another possible
    solution might be to switch of graphical components that
    consume power and are not needed in the day-to-day activies.
- **Keyboard**: it is backlit but currently that function is
    not available. Didn't try to solve this one yet because
    it is not a huge problem. The other problem is that the
    function keys for music are not assigned to any music
    player since I'm running `mpv`. There might be way to
    setup the function keys to play/pause music in mpv using
    the keys but I didn't try to setup that yet.
- **Email**: I'm trying to set up `mutt` to properly run but
    currently having problems with `offlineimap` so it is
    not syncing. If your are not going to use mutt, than you
    shoul try `mailspring` that has a nice gui and works
    fine with gmail in this computer.

## Quick fixes

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

## Coming soon

- list of features
- music setup
- newsboat setup
- further information links

## Further information

I found a really useful article by [Michael Chladek](https://mchladek.me/post/arch-mbp/)
on his installation on a 2015 MacBook. 

## Contact information

- email: isetfire@protonmail.com
