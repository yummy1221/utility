echo "run airbnb.zsh"

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# set up PATH
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
export CDPATH=$HOME/airlab/repos:$CDPATH
export CDPATH=.:$HOME/Documents/airbnb:$CDPATH
export CDPATH=$HOME/Documents/treehouse:$CDPATH
export CDPATH=$HOME/Documents/airbnb/lib/fraud/roc:$CDPATH
export CDPATH=$HOME/Documents/airbnb_repos/:$CDPATH

# for oneTouch
export ENV=development

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# set up PATH
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
alias gradlew="~/airlab/repos/treehouse/gradlew"
alias genThrift="~/airlab/repos/treehouse/scripts/generate_all_sources.sh"

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# source
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
source ~/.datadogrc

# afdev
# export DATA_DIR=$HOME/airbnb-repos/data #PATH WHERE YOU CLONED THE DATA REPO
# export AFDEV_HOST="i-01119e05455ef4519.inst.aws.airbnb.com"
# export AFDEV_PORT=61234 # CHOOSE A DIFFERENT PORT
# export AFDEV_USER="$USER" # ENTER YOUR LDAP USERNAME IF DIFFERENT THAN LOCAL ONE
# export JUPYTER_NOTEBOOK_PORT=64321

# For Model Playground
# export USER="xiaoyi_li"
export REDSPOT_HOST="i-088706973bb50abad.inst.aws.us-east-1.prod.musta.ch"
export PLAYGROUND_DIRECTORY=$HOME/Documents/airbnb_repos/ml_models/model_playground/


# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Airlab setup DO NO MODIFY
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# AIRLAB-DO-NOT-MODIFY section:ShellWrapper {{{
# Airlab will only make edits inside these delimiters.

# Source Airlab's shell integration, if it exists.
if [ -e ~/.airlab/shellhelper.sh ]; then
  source ~/.airlab/shellhelper.sh
fi
# AIRLAB-DO-NOT-MODIFY section:ShellWrapper }}}

