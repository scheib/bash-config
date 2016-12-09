# Place the following in ~/.bashrc
# and verify that ~/.bash_profile calls . ~/.bashrc
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

# Mac git installation requires sourcing these:
# After homebrew: "brew install git" as of 2016-01-15:
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  . /usr/local/etc/bash_completion.d/git-prompt.sh
fi
# Pre El Capitan Mac:
if [ -f /usr/local/git/contrib/completion/git-prompt.sh ]; then
  . /usr/local/git/contrib/completion/git-prompt.sh
fi
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi

# Prompt
PS1='${debian_chroot:+($debian_chroot)}\T:\[\033[01;34m\]\W\[\033[00m\]:\[\033[01;32m\]$(__git_ps1)\[\033[00m\]\$ '

export EDITOR='vim'

export LESS=RSJwij.3

if [[ $PROMPT_COMMAND != *"history -a"* ]]; then
  export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
fi
HISTSIZE=10000

# Remove call to update_terminal_cwd if it doesn't exist.
#   (it is defined by Mac OSX etc/bashrc, but not if terminal is screen)
if [ "$(type -t update_terminal_cwd)" != function ]; then
  export PROMPT_COMMAND="${PROMPT_COMMAND/ update_terminal_cwd;/}"
fi

# Supress "An instance of Visual SlickEdit is already being displayed..."
export VSLICKXNOPLUSNEWMSG=1

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

  if [ -d /opt/slickedit/bin ]; then
    PATH="$PATH":/opt/slickedit/bin
  fi
fi
export BASH_CONFIG_SET=true
