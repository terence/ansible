#!/bin/bash
#================================================================
# Ansible Command-line Assistant
# Bugs
# - cater for ESC key input - tough & don't bother
#================================================================
clear
source ./vars.sh
env ANSIBLE_CONFIG=~/.ssh/ansible/ansible.cfg
set

echo =============================================================
echo Hi $USER@$HOSTNAME. You are in .ssh/ansible directory.
echo Which key do you want to use?
echo -------------------------------------------------------------
echo 01 : Run Ansible - Basic
echo 02 : Run Ansible - With -i referenced inventory
echo 03 : Run Ansible - Basic Add User Playbook
echo 04 : Run Ansible - Install Nginx Playbook
echo 05 : Run Ansible - Install Nginx Playbook - Dry Run
echo ----------------------------------------------
echo 88 : Deploy .bash_profile, .vimrc and other bash settings
echo 90 : Zip up the keys
echo 91 : UnZip the keys
echo 98 : Concatenate all public keys
echo 99 : SECURITY SCRUB - checks ssh keys permissions
echo Enter [Selection] to continue
echo =============================================================

# Command line selection
if [ -n "$1" ]; then
  SELECTION=$1
else 
  read  -n 2 SELECTION
fi

if [ -n "$2" ]; then
  CLUSTER=$2
else
  read  -n  CLUSTER
fi
echo Your selection is : $SELECTION.
echo Your cluster is : $CLUSTER. 



case "$SELECTION" in
# Note variable is quoted.

  "01" )
  # Accept upper or lowercase input.
  echo Run Ansible-Base
  $APP_ANSIBLE -u root -k
  ;;

  # Note double semicolon to terminate each option.
  "02" )
  echo Run ansible with referenced inventory
  $APP_ANSIBLE -u root -i ~/.ssh/ansible/hosts $CLUSTER -m setup
  ;;


  "03" )
  echo Run ansible with basic adduser playbook
  $APP_ANSIBLE_PLAYBOOK -i ~/.ssh/ansible/hosts -l $CLUSTER playbooks/adduser.yml --user root  
  ;;


  "04" )
  echo Run ansible with install Nginx playbook
  $APP_ANSIBLE_PLAYBOOK -i ~/.ssh/ansible/hosts -l $CLUSTER playbooks/install_ansible_glitchdata_com.yml --user root  
  ;;

  "05" )
  echo Run ansible with install Nginx playbook
  $APP_ANSIBLE_PLAYBOOK -i ~/.ssh/ansible/hosts -l $CLUSTER playbooks/install_nginx.yml --user root --check --diff
  ;;
  

  "88" )
  echo Deploy .bash_profile, .vimrc, cx.sh to user directory
  cp ./local/.bash_profile ..
  cp ./local/.vimrc ..
  ;;


  "90" )
  echo Zip up the keys
  cd ..
  tar -cvzf ${NOW}_ssh.tgz .ssh
  ;;


  "91" )
  echo UnZip the keys
  ;;

  
  "99" )
  echo SECURITY SCRUB
  # chmod 700 ~/.ssh directory
  # chmod 600 authorized_keys (if it exists on client machines)
  # chmod 600 id_*
  # chmod 644 *.pub
  cd ~/.ssh/
  chmod 700 ~/.ssh
  chmod 600 id*
  chmod 644 id*.pub
  if [ -e ~/.ssh/authorized_keys ];then
    chmod 600 ~/.ssh/authorized_keys
  fi

  ;;


  # Attempt to cater for ESC
  "\x1B" )
  echo ESC1
  exit 0
  ;;


  # Attempt to cater for ESC
  "^[" )
  echo ESC2
  exit 0
  ;;

# ------------------------------------------------
#  GIT
# ------------------------------------------------

   * )
   # Default option.	  
   # Empty input (hitting RETURN) fits here, too.
   echo
   echo "Not a recognized option."
  ;;

esac





