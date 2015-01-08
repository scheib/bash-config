# Place the following in ~/.bashrc
#
#BASH_CONFIG_DIR=~/bash-config
#if [ -f $BASH_CONFIG_DIR/bashrc ]; then
#    . $BASH_CONFIG_DIR/bashrc
#fi

if [ -f $BASH_CONFIG_DIR/aliases   ]; then . $BASH_CONFIG_DIR/aliases;   fi
if [ -f $BASH_CONFIG_DIR/functions ]; then . $BASH_CONFIG_DIR/functions; fi
if [ -f $BASH_CONFIG_DIR/screen    ]; then . $BASH_CONFIG_DIR/screen;    fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# Mac's Brew location: (after brew install bash_completion)
if [ -f /usr/local/bin/brew ]; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
fi

# Prompt
PS1='${debian_chroot:+($debian_chroot)}\T:\[\033[01;34m\]\W\[\033[00m\]:\[\033[01;32m\]$(__git_ps1)\[\033[00m\]\$ '

export EDITOR='vim'

export LESS=RSJwij.3

if [[ $PROMPT_COMMAND != *"history -a"* ]]; then
  export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
fi
HISTSIZE=10000

export GYP_GENERATORS='ninja'

export P4CONFIG=.p4config
export P4DIFF=/home/build/public/google/tools/p4diff
export P4MERGE=/home/build/public/eng/perforce/mergep4.tcl 
export P4EDITOR=$EDITOR

if [ ! $BASH_CONFIG_SET ]; then
  if [ -d ~/bin ]; then
    PATH="$PATH":~/bin
  fi

  if [ -d ~/depot_tools ]; then
    PATH="$PATH":~/depot_tools
  fi

  if [ -d ~/gsutil ]; then
    PATH="$PATH":~/gsutil
  fi

  export VSLICKXNOPLUSNEWMSG=1
  if [ -d /opt/slickedit/bin ]; then
    PATH="$PATH":/opt/slickedit/bin
  fi
fi
export BASH_CONFIG_SET=true
