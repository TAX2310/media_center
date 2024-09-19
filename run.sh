#!/bin/sh

while :
do
   echo "Running"
   TIME=$(date +%H%M)
   if [ $TIME > 2200 && $TIME < 0800 ]
   then
      echo "start1"
      if [ $( docker container inspect -f {{.State.Running}} qbitorrent ) = "false" ]
      then
         echo "start"
         #docker compose up -d
      fi
   else
      echo "stop1"
      if [ $( docker container inspect -f {{.State.Running}} qbitorrent ) = "true" ]
      then
         echo "stop"
         #docker stop qbitorrent
      fi
   fi
   sleep 5m
done