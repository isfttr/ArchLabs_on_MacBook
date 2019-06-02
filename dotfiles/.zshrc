# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda-mod"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/repositories/zsh-customizations

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras fzf globalias)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# pywal
## Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

#aliases below
alias vim='nvim'
alias v='nvim'
alias sz='source ~/.zshrc && clear && ufetch'
alias vz='nvim ~/.zshrc'
alias i3l='rofi_run -l'
alias rm='rm -rf'
alias lsl='ls -ll'
alias lsa='ls -al'

# git
alias gg='git status'
alias gc='git commit -a -m'
alias gcc='git commit -S -a -m'
alias gs='git stage'
alias gsa='git stage .'
alias ga='git add'
alias gaa='git add .'
alias gf='git fetch'
alias gF='git pull'
alias gm='git merge'
alias gp='git push'
alias gpu='git push -u origin master'
alias gpd='git push -u origin develop'
alias gt='git tag -a'
alias tags='git tag'
alias gco='git checkout'
alias gcob='git checkout -b'
alias branches='git branch'

alias gcl='git clone'

alias gcn='git config user.name'
alias gce='git config user.email'
alias gcs='git config commit.gpgsign true'
alias gsk='git config user.signingkey'
alias gitalias='cat ~/repositories/ArchLabs_on_MacBook/dotfiles/.zshrc | grep git'

# gpg
alias gnk='gpg --full-generate-key'
alias glg='gpg --list-secret-keys --keyid-format LONG'
alias gae='gpg --armor --export' #prints gpg key id
alias gpgalias='cat ~/repositories/ArchLabs_on_MacBook/dotfiles/.zshrc | grep gpg'

# Pacman
alias mirror='sudo pacman -Syuw && clear && ufetch'

## for applications
alias ydl='youtube-dl -i'
alias ydlaudio='youtube-dl -i -f bestaudio'
alias f='uskb && vifm'
alias l='clear && ufetch'
alias q='exit'
alias mpdd='mpd ~/.config/mpd/mpd.conf'
#alias dmenu_run="dmenu_run -nb '#2e3440' -sf '#2e3440' -nf '#bf616a' -sb '#bf616a'"
#alias dmenu="dmenu -nb '#2e3440' -sf '#2e3440' -nf '#bf616a' -sb '#bf616a'"

# changing keyboard layout - usekeybinding later
alias uskb='setxkbmap -layout us -variant mac'
alias inkb='setxkbmap -layout us -variant intl'

## access config files
alias i3conf='nvim ~/.config/i3/config'
alias qtconf='nvim ~/.config/qutebrowser/config.py'
alias xresconf='nvim ~/.Xresources'
alias vimconf='nvim ~/.config/nvim/init.vim'
alias vifmconf='nvim ~/.config/vifm/vifmrc'
alias newsconf='nvim ~/.newsboat/urls'

## access other repositories

## recurrent use
alias fehbg='feh --bg-scale'
alias weather='curl wttr.in' # requires curl
alias fire='aafire -driver curses -dim' # requires aalib
alias sx='sxiv -f *.jpg *.png *.gif'
alias mutt='neomutt'

## faster encryption
alias encrypt='openssl aes-256-cbc -a -pbkdf2' #-a show as text
alias decrypt='openssl aes-256-cbc -d -a -pbkdf2' 

## xrandr
alias dell='xrandr --output HDMI1 --mode 1920x1080 --output LVDS1 --primary --scale 1.5x1.35 && ~/.fehbg && l'
alias mac='xrandr --output LVDS1 --primary --scale 1x1 && ~/.fehbg && l'

## wifi kernel module
alias wifi='sudo modprobe -v b43'

## scripts
alias pacui='bash ~/pacui'

##ufetch
alias ufetch='clear && ufetch'
