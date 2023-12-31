#!/bin/bash
rm apt.log msg.txt
apt update
apt list --upgradable > apt.log
TO_UPGRADE="$(cat apt.log | wc -l)"
if [ $TO_UPGRADE != '1' ]
then
  m4 -DUSERID=$1 -DHOSTNAME=$2 msg.m4 > msg.txt
  curl --json "$(jo content=@msg.txt)" "$3"
fi
