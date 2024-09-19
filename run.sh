#!/bin/sh

docker compose up -d
sleep 5m

while :
do
   echo "Running"
   TIME=$(date +%H%M)
   if [ $TIME -gt 2200 -o $TIME -lt 8030 ]
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