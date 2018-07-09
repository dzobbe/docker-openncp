# dockerized-openncp
This is a dockerized deployment of OpenNCP to make life of developers easier. The testing infrastructure is composed by three countries, i.e., Spain, Italy, and Denmark. As reported by the `docker-compose.yml` filem, a number of containers have been configured to support such an environment:
	
	* National Containers - `country-a-es` `country-b-it` `country-c-dk` - run the NCPs and the national connectors for each specific country
	* Portal Container - hosts the Liferay Web portal, configured to connect to the Italian container from which requests of clinical data are started 
	* Database Containers - used for the deployment of storage systems of configured countries 
	* Database Filler Container - needed for filling all the national databases during the startup phase
    

## Requirements

A Unix-based OS with Docker and Docker-Compose is needed.


## Before Containers Building

Before building the containers it is necessary to download all the OpenNCP war files from the repository. In order do that you need to run from the `dockerize-openncp` root directory the `scripts/pre-build.sh` script. There you can also set the `OPENNCP_WARS_VERSION` variable to configure the OpenNCP war files version (by default is 2.5.2).

## Build

Now containers can be built by simply running from the root directory: `docker-compose build`


## Run

To launch the docker containers you just need to execute from the terminal: `docker-compose up`


## Access to the Portal

The portal is exposed on `http://localhost:8081`. 


## Usage Example



## Credentials

The password used for every component/tool is `konfido`. The portal admin username is `test@liferayportal.com`, even in this case the password is `konfido`. In order to get access to eHealth document you need to create an account from the portal as explained here


## National Connectors

The retrievement of clinical data is realized by the national connectors 