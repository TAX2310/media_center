#!/bin/sh

while [  ]
do
   echo "Running"
   TIME = date +%H%M
   STATE = docker ps -f status
   if [ $TIME > 2200 && $TIME < 0800 ]
   then
      if [ "$( docker container inspect -f '{{.State.Running}}' $container_name )" != "true" ]
      then
         echo "start"
         #docker compose up-d
      fi
   elif
   if [ "$( docker container inspect -f '{{.State.Running}}' $container_name )" == "true" ]
      then
         echo "stop"
         #docker stop qbitorrent
      fi
   fi
   sleep 5m
done