#!/bin/bash
echo "Cleaning Up Docker Environment"
docker rm $(docker ps -a -q)
docker rmi $(docker images -f "dangling=true" -q)  
docker volume rm $(docker volume ls -qf dangling=true)

