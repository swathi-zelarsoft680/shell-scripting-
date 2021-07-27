#!/bin/bash

source components/common.sh
OS_PREREQ

Head "Install Redis"
apt install redis-server -y &>>$LOG
Stat $?

Head "Update Redis Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf
Stat $?

Head "Start Redis Service"
systemctl restart redis
Stat $?