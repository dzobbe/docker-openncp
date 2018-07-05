#!/bin/bash

OPENNCP_WARS_VERSION=2.5.2


if [ ! -d wars ]; then
  mkdir -p wars;
fi

pushd scripts

wget https://ec.europa.eu/cefdigital/artifact/content/repositories/eHealth/eu/europa/ec/sante/ehdsi/openncp-protocol-terminators/openncp-ncp-server/openncp-ws-server/${OPENNCP_WARS_VERSION}/openncp-ws-server-${OPENNCP_WARS_VERSION}.war -O ../wars/openncp-ws-server.war
wget https://ec.europa.eu/cefdigital/artifact/content/repositories/eHealth/eu/europa/ec/sante/ehdsi/openncp-protocol-terminators/openncp-ncp-client/openncp-client-connector/${OPENNCP_WARS_VERSION}/openncp-client-connector-${OPENNCP_WARS_VERSION}.war -O ../wars/openncp-client-connector.war
wget https://ec.europa.eu/cefdigital/artifact/content/repositories/eHealth/eu/europa/ec/sante/ehdsi/openncp-openatna/openatna-web/${OPENNCP_WARS_VERSION}/openatna-web-${OPENNCP_WARS_VERSION}.war -O ../wars/openatna-web.war
wget https://ec.europa.eu/cefdigital/artifact/content/repositories/eHealth/eu/europa/ec/sante/ehdsi/openncp-trc-sts/${OPENNCP_WARS_VERSION}/openncp-trc-sts-${OPENNCP_WARS_VERSION}.war -O ../wars/TRC-STS.war
wget https://ec.europa.eu/cefdigital/artifact/content/repositories/eHealth/eu/europa/ec/sante/ehdsi/openncp-gateway/${OPENNCP_WARS_VERSION}/openncp-gateway-${OPENNCP_WARS_VERSION}.war -O ../wars/openncp-gateway.war
wget https://ec.europa.eu/cefdigital/artifact/content/repositories/eHealth/eu/europa/ec/sante/ehdsi/openncp-portal/${OPENNCP_WARS_VERSION}/openncp-portal-${OPENNCP_WARS_VERSION}.war -O ../wars/epsosportal.war

popd
 
