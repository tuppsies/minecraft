# Written by Joshua Cahill

# if any command fails stop the script
set -e

# stop the minecraft server
screen -S minecraft -p 0 -X stuff "/stop
"

# wait some time to allow the server to shutdown
sleep 10

# create the backup ZIP file
currentdatetime=$(TZ=Australia/Sydney date +'%F-%H-%M-%S')
filename='/home/ec2-user/backups/'$currentdatetime'-minecraft-server.zip'
zip -r $filename /home/ec2-user/minecraftserver

# upload the backup to S3
aws s3 mv $filename s3://target-minecraft/backups/

# restart the minecraft server
screen -S minecraft -p 0 -X stuff "./start-minecraft.sh
"

