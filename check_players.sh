#!/bin/bash

screen -r -X stuff "list^M"

sleep 2

NUM_PLAYERS=sudo tail minecraft-survival-lockdown/logs/latest.log | tac | grep -oP "There are \K([0-9]*)" | head -1 | tr -d '\n'
echo $NUM_PLAYERS

if [[ $NUM_PLAYERS -eq 0 ]]
then
    echo "There are 0 players logged in, stopping minecraft"
    screen -r -X stuff "stop^M"
    echo "Sent stop command to the server"
    sleep 10
    shutdown -h now
fi


