# dockerized-openncp
This is a dockerized deployment of OpenNCP to make life of developers easier. It is composed of the following containers:
    

## Requirements

You need a Unix-based OS with Docker and Docker-Compose installed.


## Before Containers Building

Before building the containers it is necessary to download all the OpenNCP war files from the repository. In order do that you need to run from the `dockerize-openncp` root directory the `scripts/pre-build.sh` script. There you can also set the desired version of OpenNCP war files.

## Build

Now you can build the cotainers by simply running: `docker-compose build`


## Run
To launch the docker containers you just need to execute from the terminal: `docker-compose up`



## Access to the Portal
The portal is exposed on `http://localhost:8081`. 


## Credentials
The password used for every component/tool is `konfido`. The portal admin username is `test@liferayportal.com`. In order to get access to ehealth document you need to create an account from the portal as explained here

## Known Issues
