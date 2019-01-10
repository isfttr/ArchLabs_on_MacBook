#!/bin/bash

# catch non-bash and non-interactive shells
[[ $- == *i* && $BASH_VERSION ]] && SHELL=/bin/bash || return 0

# set some defaults
export MANWIDTH=100
export HISTSIZE=10000
export HISTIGNORE="q:f:v"

# colors in less (manpager)
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# ensure ~/bin is on the path
[[ $PATH =~ ~/bin ]] || PATH=~/bin:$PATH

set -o vi
set -o notify

shopt -s direxpand
shopt -s checkhash
shopt -s sourcepath
shopt -s expand_aliases
shopt -s autocd cdspell
shopt -s extglob dotglob
shopt -s no_empty_cmd_completion
shopt -s autocd cdable_vars cdspell
shopt -s cmdhist histappend histreedit histverify
[[ $DISPLAY ]] && shopt -s checkwinsize

# prompt if file sourcing below fails
PS1='[\u@\h \W]\$ '

# uncomment these lines to disable the multi-line prompt
# add user@host, and remove the unicode line-wrap characters

# export PROMPT_LNBR1=''
# export PROMPT_MULTILINE=''
# export PROMPT_USERFMT='\u\[\e[0m\]@\[\e[31m\]\h '

# source shell configs
for f in "$HOME/.bash/"*?.bash; do
    . "$f"
done

al-info

# changing the $EDITOR to nvim
export VISUAL=nvim
export EDITOR="$VISUAL"

# NNN

# export NNN_BMS="d:~/Downloads;o:~/OneDrive"
# export NNN_USE_EDITOR=1
# export NNN_CONTEXT_COLORS="4"
# export NNN_COPIER="~/scripts/copier.sh"
# export NNN_FALLBACK_OPENER=xdg-open

# expand aliases to non-interactive shells
shopt -s expand_aliases

# setting term
export TERM=st-256color

# aliases below
#alias vim='nvim'
alias sbash='cd && source .bashrc'
alias vbash='cd && nvim .bashrc'
alias i3l='rofi_run -l'

## for applications
alias r='ranger'
alias n='nnn'
alias ydl='youtube-dl -i'
alias vifm='uskb && vifm'

# copying in NNN
# alias ncp='cat ~/.nnncp > .last_copied_file'

# changin keyboard layout - usekeybinding later
alias uskb='setxkbmap -layout us -variant mac'
alias inkb='setxkbmap -layout us -variant intl'

## to directories
alias music='cd && cd ~/OneDrive/Music/ && vifm'
alias down='cd && cd ~/Downloads/ && vifm'
alias oned='cd && cd ~/OneDrive/Workspace/ && vifm'
alias mestrado='cd && ~/OneDrive/Workspace/II.Quimica/2.Mestrado/2.Pesquisa/Patentes_vs_Periódicos/'
alias cgit='cd && cd ~/GitHub'

## access config files
alias i3conf='cd && cd ~/.config/i3 && nvim config'
alias qtconf='cd && cd ~/.config/qutebrowser && nvim config.py'
alias xresconf='cd && nvim .Xresources'
alias vimconf='cd && cd ~/.config/nvim && nvim init.vim'
alias newsconf='cd && cd ~/.newsboat && nvim urls'

## recurrent use
alias fehbg='feh --bg-scale'
