# Place the following in ~/.bashrc
#
#BASH_CONFIG_DIR=~/bash-config
#if [ -f $BASH_CONFIG_DIR/bashrc ]; then
#    . $BASH_CONFIG_DIR/bashrc
#fi

if [ -f $BASH_CONFIG_DIR/aliases   ]; then . $BASH_CONFIG_DIR/aliases;   fi
if [ -f $BASH_CONFIG_DIR/functions ]; then . $BASH_CONFIG_DIR/functions; fi
if [ -f $BASH_CONFIG_DIR/screen    ]; then . $BASH_CONFIG_DIR/screen;    fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# MacPorts location:
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
# Git prompt for MacPorts -scheib 2012-10-22
if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
    . /opt/local/share/git-core/git-prompt.sh
fi

export EDITOR='vim'

export LESS=RSJwij.3

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
HISTSIZE=10000

export GYP_GENERATORS='ninja'

export P4CONFIG=.p4config
export P4DIFF=/home/build/public/google/tools/p4diff
export P4MERGE=/home/build/public/eng/perforce/mergep4.tcl 
export P4EDITOR=$EDITOR

if [ -d `pwd`/depot_tools ] ; then
    PATH="$PATH":`pwd`/depot_tools
fi

export VSLICKXNOPLUSNEWMSG=1
if [ -d /opt/slickedit/bin ] ; then
    PATH="$PATH":/opt/slickedit/bin
fi
