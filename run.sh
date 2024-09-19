#!/bin/sh

export $(cat .env | xargs) && env

while :
do
   echo "Running"
   TIME=$(date +%H%M)
   if [ $TIME -gt $START_DOWNLOAD -o $TIME -lt $END_DOWNLOAD ]
   then
      if [ $( docker container inspect -f {{.State.Running}} qbittorrent ) = "false" ]
      then
         echo "start"
         docker compose up -d
      fi
   else
      if [ $( docker container inspect -f {{.State.Running}} qbittorrent ) = "true" ]
      then
         echo "stop"
         docker stop qbittorrent
      fi
   fi
   sleep 5m
done