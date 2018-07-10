#!/bin/bash

sleep 20


cd  /home/openncp-props-es
java -jar *.jar &


cd  /home/openncp-props-it
java -jar *.jar &

cd  /home/openncp-props-dk
java -jar *.jar &

cd ..

sleep 15
 
echo "Initializing IT Database"
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido < init.sql
echo "Initializing ES Database"
mysql -h 10.5.0.9 -P 3306 -u root -pkonfido < init.sql
echo "Initializing DK Database"
mysql -h 10.5.0.11 -P 3306 -u root -pkonfido < init.sql



cd tsam
echo "Initializing TSAM Database"
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido tsam < schema.sql
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido tsam < data.sql
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido tsam < importXml4.sql



cd ../lportal
echo "Initializing Portal Database"
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido lportal < portal-mysql.sql

echo "Initializing OpenNCP Portal Properties"
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido openncp_properties < openncp-portlet.sql
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido hcer < hcer.sql


echo "Initializing EADC Database"
cd ../eadc
mysql -h 10.5.0.9 -P 3306 -u root -pkonfido eadc < CREATE_EADC.sql
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido eadc < CREATE_EADC.sql
mysql -h 10.5.0.11 -P 3306 -u root -pkonfido eadc < CREATE_EADC.sql

