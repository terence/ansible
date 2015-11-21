#!/bin/bash
#================================================================
# Variables - vars.sh
# - needs to be packaged with cx.sh and bk.sh
# Bugs
# - None for now
# Version 1.0
#================================================================

USER=$(whoami)
HOSTNAME=$(hostname)


# ++++++++++++++++++++++++++++++
# Set Variables
# ++++++++++++++++++++++++++++++
REMOTE_HOSTNAME=
REMOTE_HOST=glitchdata.com
REMOTE_USER=glitchdata
REMOTE=$REMOTE_USER@$REMOTE_HOST
DOMAIN=glitchdata.com
PROJECT=glitchdata.com
REMOTE_DIR=/home/$REMOTE_USER/$DOMAIN/

CLUSTER=digitalocean


# ++++++++++++++++++++++++++++++
# Set System Commands
# ++++++++++++++++++++++++++++++
APP_NOW=$(date +"%Y%m%d")
APP_GZIP=/bin/gzip
APP_LOCAL_TAR=/usr/bin/tar
APP_REMOTE_TAR=/bin/tar
APP_LN=/bin/ln
APP_SSH=/usr/bin/ssh
APP_SCP=/usr/bin/scp
APP_MYSQL=/usr/bin/mysql
APP_LOCAL_MYSQLDUMP=/Applications/MAMP/Library/bin/mysqldump
APP_REMOTE_MYSQLDUMP=/usr/bin/mysqldump
APP_FIND=/usr/bin/find
APP_READ=/usr/bin/read
APP_ANSIBLE=/usr/local/bin/ansible
APP_ANSIBLE_PLAYBOOK=/usr/local/bin/ansible-playbook


# ++++++++++++++++++++++++++++++
# Set Local Variables
# ++++++++++++++++++++++++++++++
LOCAL_SCRIPTS_DEFAULT=~/.ssh/remote/default/


# ++++++++++++++++++++++++++++++
# Log Settings
# ++++++++++++++++++++++++++++++
LOG_HISTORY=./backup/history.log



