#!/bin/bash

project=$1
pat=$2
host=$3
poolname=vagrant-buildagents
cd /home/vagrant/vsts-client

./config.sh --unattended --replace --url https://dev.azure.com/$project/ --auth pat --pool $poolname --token $pat --agent $host --work /home/vagrant/agent_work/
nohup ./run.sh &
