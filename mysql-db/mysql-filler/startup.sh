#!/bin/bash

sleep 10

echo "default-character-set=utf8mb4" >> /etc/mysql/conf.d/mysql.cnf

cd  home/openncp-props-es
java -jar *.jar &

sleep 5

cd  ../openncp-props-it
java -jar *.jar &

sleep 5

cd ..

echo "Initializing IT Database"
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido < init.sql
echo "Initializing ES Database"
mysql -h 10.5.0.9 -P 3306 -u root -pkonfido < init.sql

cd tsam
echo "Initializing TSAM DB"
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido tsam < schema.sql
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido tsam < data.sql
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido tsam < importXml4.sql



cd ../lportal
echo "Initializing Portal DB"
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido lportal < portal-mysql.sql

echo "Initializing OpenNCP Portal Properties"
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido openncp_properties < openncp-portlet.sql
mysql -h 10.5.0.7 -P 3306 -u root -pkonfido hcer < hcer.sql

