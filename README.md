# dockerized-openncp
This is a dockerized deployment of OpenNCP to make life of developers easier. 

## Requirements

You need to install Docker and Docker-Compose on your machine


## Before Containers Building

Before building the containers it is necessary to download all the OpenNCP war files from the repository. In order do that you need to run the `scripts/pre-build.sh` script. There you can also set the desired version of OpenNCP war files.

## Build

Now you can build the cotainers by running: `docker-compose build`


## Run

To launch the docker containers you just need to execute from the termina: `docker-compose up`


## Access to the Portal

The portal is exposed on `http://localhost:8081`


## Known Issues

There are timing issues during the containers startup that could make the `mysql-filler` container fail. I need to fix this.
The portal fails in launching the OpenNCP portal applet. A contribution is very much appriciated
