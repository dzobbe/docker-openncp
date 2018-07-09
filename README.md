# dockerized-openncp
This is a dockerized deployment of OpenNCP to make life of developers easier. The testing infrastructure is composed by three countries, i.e., Spain, Italy, and Denmark. As reported by the `docker-compose.yml` file, a number of containers have been configured to support such an environment:

* National Containers - `country-a-es` `country-b-it` `country-c-dk` - run the NCPs and the national connectors for each specific country
* Portal Container - hosts the Liferay Web portal, configured to connect to the Italian container from which requests of clinical data are started 
* Database Containers - used for the deployment of storage systems of configured countries 
* Database Filler Container - needed for filling all the national databases during the startup phase

Notice that in this testing docker infrastructure, we are assuming a situation where a doctor/nurse in Italy wants to obtain clinical data from either Spain or Denmark.

## Requirements

A Unix-based OS with Docker and Docker-Compose is needed.


## Before Containers Building

Before building the containers it is necessary to download all the OpenNCP war files from the repository. In order do that you need to run from the `dockerize-openncp` root directory the `scripts/pre-build.sh` script. There you can also set the `OPENNCP_WARS_VERSION` variable to configure the OpenNCP war files version (by default is 2.5.2).

## Build

Now containers can be built by simply running from the root directory: `docker-compose build`


## Run

To launch the docker containers you just need to execute from the terminal: `docker-compose up`


## Access to the Portal

The portal is exposed on `http://localhost:8081`. The portal default admin username is `test@liferayportal.com`, with password `konfido`. Once you are logged in you need to carry out the "Post Install Configurations" explained [here](https://ec.europa.eu/cefdigital/wiki/display/EHNCP/Installing+OpenNCP+Portal) for enabling the OpenNCP portal. Then, you need to create a user with a "doctor" role in order to have rights for performing requests of CDA data. In the top right, go to: Admin -> Control Panel -> Users and Organizations -> Add User. Fill the necessary information (e.g. username, password) and select the doctor role. 


## Usage Example

Run all docker containers with `docker-compose up`. Open the portal and access with a user having, e.g., a doctor role. Ask for a clinical document of a Spanish patient. Click the proper Spanish flag from the OpenNCP portal, and insert the patient credentials. 


## Credentials

The password used for every component/tool (e.g. databases) is `konfido`


## National Connectors

The retrievement of clinical data in the national infrastructure is realized by a national connector. This should be implemented by each country. The OpenNCP installation manual explains [here](https://ec.europa.eu/cefdigital/wiki/display/EHNCP/Integration+of+Protocol+Terminators+with+National+Connector) how to implement and deploy a national connector. In this testing docker infrastructure, the `openncp-nc-mock-it-2.5.3.RC1.jar` is used (notice that "it" stands for Integration Testing, not Italy). This is a NC implementation example provided by OpenNCP. We used this NC for both Spain and Denmark. 


## Possible Errors

If the NCP returns the following error during the CDA document retrievement `Failed to load implementation of PatientSearchService: null`, it means that the national connector was not loaded. 