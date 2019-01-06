# Configuration files for ArchLabs

This is a simple configuration that is currently running on
a MacBook Pro mid-2012. Currenly it is using i3 gaps in a
solarized colorscheme.

When I first installed ArchLabs I used the urxvt terminal but I found out about the problems
it had over color compatibility -- syntax on neovim was not
working. The workaround urxvt was to install st from
[LukeSmithxyz](https://github.com/LukeSmithxyz/st) which
pretty much worked out of the box. The font is set to 16 
and might be too big. Change the configuration file and
rerun `make && make install`.

## What is not working yet

The main problem right now is battery which I didn't have
the time to deal with and the light controls of the light in
the keyboard is not working.

## For brazilian users

If you made the installation using en_US.UTF-8, like me,
probably the cedilla will not be working when pushing "' + c".
The workaround for me was to use the command `inkb` listed on the 
[.bashrc](https://github.com/isetfiretotherain/ArchLabs_on_MacBook/blob/master/dotfiles/.bashrc) 
together with the creation of the [~/.XCompose](https://github.com/isetfiretotherain/ArchLabs_on_MacBook/blob/master/dotfiles/.XCompose) file.
