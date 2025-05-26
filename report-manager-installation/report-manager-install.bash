#!/bin/bash

function printRes {
    if [ $# -ne 2 ]; then
        echo printRes: error. Please refer to developer.
    exit
    fi
    if [ "$2" -eq 0 ]; then
        echo -n $1 && tput hpa $(tput cols) && tput cub 6 && echo "[ OK ]"
    else
        echo -n $1 && tput hpa $(tput cols) && tput cub 6 && echo "[FAIL]"
    exit
    fi
}

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_PATH="$SCRIPT_DIR/$(basename "${BASH_SOURCE[0]}")"

echo Report Manager Installer
echo ${BASH_SOURCE[0]}
echo $SCRIPT_DIR
pwd


stageName="TEST (MUST BE OK)"
echo "$stageName"
ls > /dev/null
printRes "$stageName" $?


stageName="Updating"
echo $stageName
sudo apt-get update > /dev/null
printRes "$stageName" $?


stageName="Installing Docker"
echo "$stageName"
sudo apt-get install -y docker.io > /dev/null
printRes "$stageName" $?


stageName="Pulling Samba server"
echo "$stageName"
sudo docker pull dockurr/samba
printRes "$stageName" $?


stageName="Pulling onlyoffice-document server"
echo "$stageName"
sudo docker pull onlyoffice/documentserver
printRes "$stageName" $?


stageName="Pulling mongodb/mongodb-community-server"
echo "$stageName"
sudo docker pull mongodb/mongodb-community-server
printRes "$stageName" $?


stageName="Creating docker environment"
echo "$stageName"
mkdir ~/report-manager-docker && cd ~/report-manager-docker && cp "$SCRIPT_DIR/docker-compose.yml" ~/report-manager-docker/
printRes "$stageName" $?


stageName="Docker starting"
echo "$stageName"
docker-compose up -d
printRes "$stageName" $?
