#!/bin/bash

docker-compose -f docker/docker-compose.yml stop

docker-compose -f docker/docker-compose.yml rm -f  -v

docker build docker/containers/postgresql  -t wesovilabs/elixir-maru-training

docker-compose -f docker/docker-compose.yml up -d



RETRY=15

echo "-----"

while [ $RETRY > 0 ]
do
	if lsof -Pi :3001 -sTCP:LISTEN -t >/dev/null ; then
	    echo "running"
	    break
	else
	    echo "not running"
	    let RETRY-=1
        sleep 10
	fi
done

echo "Postgresql is UP"

