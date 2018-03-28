#~/.profile skeleton
# ~/.profile runs on interactive login shells if it exists
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "~/.profile has run"

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# commandline editing
set -o emacs    # emacs style command line mode (default)
#set -o vi      # vi style command line mode
alias eclipse_wizard.py=/home/pshepher/bin/eclipse_wizard.py
alias ls="ls --color=auto"
alias vi=vim

alias bbpy=/bb/bin/bbpy

alias ll="ls -alF"

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# this variable needs to be set for pnewtask/pnewscript to function
# if you don't know what to put here leave it alone or ask your team.
#GROUP=put_your_group_here

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# below block is executed if:
# chimera is not present/didn't run
# set some basic stuff up, hope /etc/passwd is good enough
if [ ! "$BBENV" ] 
then
     PS1="${HOSTNAME}:\${PWD} \$ " 
     PATH=$PATH:/usr/sbin
     ##LPDEST=put_your_printer_here
     ##GROUP=put_your_group_here
     stty erase \^\h kill \^u intr \^c
     stty echoe echok ixon ixoff -ixany

     if [ $(uname) = "SunOS" ] && [ ! "$BASH" ]
     then
          set -o emacs
          alias __A=$(print '\0020') # ^P = up = previous command
          alias __B=$(print '\0016') # ^N = down = next command
          alias __C=$(print '\0006') # ^F = right = forward a character
          alias __D=$(print '\0002') # ^B = left = back a character
          alias __H=$(print '\0001') # ^A = home = beginning of line
          #stty erase ^?
          #echo "SunOS keys set"
     fi
fi

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# old green prompt riskldev21 xli548:folder
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[ "$GROUP" ] && export GROUP 
stty sane # should normalize backspace issues?
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"
#DEFAULTPROMPT='$PWD$ '
DEFAULTPROMPT='$HOSTNAME $USER:\W\$ '
export PS1="$GREEN $DEFAULTPROMPT $RESET> "



# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Things related to mbig
alias mbig="cd ~/mbig"
for dir in ~/mbig/*; do
    [ -d "$dir" ] && alias $(basename "$dir")="cd $dir"
done

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# COLORED PROMPT
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#\[\e]0;\u@\h:\w\a\][\u@\h \W$(__git_ps1 " (%s)")]\$
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[01;31m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W$(__git_ps1 " (%s)")\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# COLORED PROMPT END
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# related to format
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
alias format="clang-format -i -style=file"

