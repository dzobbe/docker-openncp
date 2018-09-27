# docker-openncp
This is a dockerized deployment of OpenNCP developed in the context of KONFIDO project (www.konfido-project.eu) to make life of developers easier. The testing infrastructure is composed by three countries, i.e., Spain, Italy, and Denmark. As reported by the `docker-compose.yml` file, a number of containers have been configured to support such an environment:

* National Containers - `country-a-es` `country-b-it` `country-c-dk` - run the NCPs and the national connectors for each specific country
* Portal Container - hosts the Liferay Web portal, configured to connect to the Italian container from which requests of clinical data are started 
* Database Containers - used for the deployment of storage systems of configured countries 
* Database Filler Container - needed for filling all the national databases during the startup phase

Notice that in this testing docker infrastructure, we are assuming a situation where a doctor/nurse in Italy wants to obtain clinical data from either Spain or Denmark. Give a look to the scheme below.

                                                    -------------
                                             ______ DENMARK       ------> National Connector nc-mock-it
                                            |       -------------        ('it' stands for integration test)	
                                            |       ncp-c
                                            |       db-dk
            -------------                   |       dk-truststore(it-pk,es-pk)
            ITALY         ------------------
            -------------                   |
            ncp-b                           |
            db-it                           |
            lportal                         |
            it-truststore(dk-pk,es-pk)      |       -------------
                                            |______ SPAIN        ------> National Connector nc-mock-it
                                                    -------------       ('it' stands for integration test)	
                                                    ncp-a
                                                    db-es
                                                    es-truststore(dk-pk,it-pk)
## Requirements      

A Unix-based OS with Docker and Docker-Compose is needed.


## Before Containers Building (CURRENTLY THIS STEP MUST NOT BE PERFORMED)

Before building the containers it is necessary to download all the OpenNCP war files from the repository. In order do that you need to run from the `dockerize-openncp` root directory the `scripts/pre-build.sh` script. There you can also set the `OPENNCP_WARS_VERSION` variable to configure the OpenNCP war files version (by default is 2.5.2).

## Build

Now containers can be built by simply running from the root directory: `docker-compose build`


## Run

To launch the docker containers you just need to execute from the terminal: `docker-compose up`


## Access to the Portal

The portal is exposed on `http://localhost:8081`. The portal default admin username is `test@liferayportal.com`, with password `konfido`. Once you are logged in you need to carry out the "Post Install Configurations" explained [here](https://ec.europa.eu/cefdigital/wiki/display/EHNCP/Installing+OpenNCP+Portal) for enabling the OpenNCP portal. Then, you need to create a user with a "doctor" role in order to have rights for performing requests of CDA data. In the top right, go to: Admin -> Control Panel -> Users and Organizations -> Add User. Fill the necessary information (e.g. username, password) and select the doctor role. 


## Usage Example

Run all docker containers with `docker-compose up`. Open the portal and access with a user having, e.g., a doctor role. Ask for a clinical document of a Spanish patient. Click the proper Spanish flag from the OpenNCP portal, and insert the patient credentials. Use for both fields the code `28638911K`. You should receive back data of thapatient. 


## Credentials

The password used for every component/tool (e.g. databases) is `konfido`


## National Connectors

The retrievement of clinical data in the national infrastructure is realized by a national connector. This should be implemented by each country. The OpenNCP installation manual explains [here](https://ec.europa.eu/cefdigital/wiki/display/EHNCP/Integration+of+Protocol+Terminators+with+National+Connector) how to implement and deploy a national connector. In this testing docker infrastructure, the `openncp-nc-mock-it-2.5.3.RC1.jar` is used (notice that "it" stands for Integration Testing, not Italy). This is a NC implementation example provided by OpenNCP. I used this NC for both Spain and Denmark. 
This mock connector, provided as a JAR file within the `scripts` folder, looks for patients in a local directory on the container file system, i.e., `/opt/openncp-configuration/integration`. This folder contains another folder named with the OID provided by an HL7 affiliate (e.g., OID associated to the Spanish Patient Identifier Code). Within this subfolder, there is a file with .properties extension and whose name is a patient's document id. Documents are then obtained from files embedded into the JAR located in `resources/psstore/`. 
You can develop/modify and recompile your own NC using the open source code available [here](https://ec.europa.eu/cefdigital/code/projects/EHNCP/repos/ehealth/browse/protocol-terminators/epsos-ncp-server). 



## Possible Errors

If the NCP returns the following error during the CDA document retrievement `Failed to load implementation of PatientSearchService: null`, it means that the national connector was not loaded. 
Don't care if you get at the end of the docker-compose outputs the exception `ERROR [liferay/hot_deploy-1][SerialDestination:70] Unable to process message`


## Information needed for Extensions

I report here some information that could be useful for those who want to extend the current deployment:

* If you need to get access and eventually modify your database just run from your host `mysql -h 0.0.0.0 -P {port exposed by one of the DB containers (3306, 3307, 3308)} -u root -pkonfido`
* If you want to modify properties of OpenNCP, go to `mysql-props-filler/openncp-props-{country}/openncp-configuration.properties` and then rerun `docker-compose up`. In this case there is no need of running again `docker-compose build`
* If you need to modify the one of the .war to be used by countries, then you have to first run `docker-compose build` and after that `docker-compose up`
* If you want to change the deployment. Let's assume you want to query document from DK to IT and ES. Then, you need to change the lportal configuration and also load the proper pub keys in the dk-truststore
* If you want to create a new country:
    * Copy-paste in the docker-compose file a new country and a new database, also remember to assign new addresses
    * Copy-paste the `mysql-props-filler/openncp-props-{country}` folder and change the configurations in database.config.xml and openncp-configuration.properties. Furthermore, add new dedicated lines to the startup.sh script. 
    * Copy-paste one of the `country-` folder. Then, you need to create new certificates for the new country. To do that, follow the guidelines provided by OpenNCP [here](https://ec.europa.eu/cefdigital/wiki/display/EHNCP/Create+epSOS+Certificates)
    * Change the Tomcat configurations in tomcat-conf/server.xml
    * Modify the script `import_countries_cert.sh` and run it in order to load all the public certificates in countries truststores 
