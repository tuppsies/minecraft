#!/bin/bash

cd /home/ec2-user/minecraft-survival-lockdown/

screen -d -m

screen -r -X stuff "sudo java -Xmx1G -Xms1G -jar server.jar nogui^M"
