#!/bin/bash

COMPONENT=$1


export LOG=/tmp/${COMPONENT}.log
rm -f $LOG

source components/common.sh

if [ ! -f components/${COMPONENT}.sh ]; then
  ERROR "Invalid Component Name is Provided"
  exit 1
fi

USER_NAME=$(whoami)

if [ "${USER_NAME}" != "root" ]; then
  ERROR "You should be a root user to perform this script, Try with sudo"
  exit 1
fi

export COMPONENT
bash components/${COMPONENT}.sh