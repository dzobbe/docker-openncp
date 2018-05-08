# *******************
# Variable Definition
# *******************

# Country
country="es"
# Organization
organization="cini"
# Password of generated keystores
passwordKS="konfido"
# Password of root CA key (defined during the execution of root CA certificate creation script - cacert.sh)
passwordCA="konfido"
# Password of truststore
passwordTS="konfido"
# Initial truststore to extend (if empty, a new one will be created under /keystore with the CA certificate)
#initialTrustStore=/usr/java/jdk1.6.0_45/jre/lib/security/cacerts
initialTrustStore=

# Certificates alias
CAcertAlias=ppt.ca.epsos.$organization.$country
NcpSignatureAlias=ppt.ncp-signature.epsos.$organization.$country
VPNServerSignatureAlias=ppt.ncp-vpns.epsos.$organization.$country
VPNClientSignatureAlias=ppt.ncp-vpnc.epsos.$organization.$country
ServiceConsumerSignatureAlias=ppt.ncp-sc.epsos.$organization.$country
ServiceProviderSignatureAlias=ppt.ncp-sp.epsos.$organization.$country
OCSPSignatureAlias=ppt.ncp-ocsp.epsos.$organization.$country

# ******************* END OF CONFIGUATION SECTION ********************

echo "Creating Certificate Requests for: "$country
# WARNING: existing keystores will be deleted
rm -rf pem private test_requests keystore ROOT/$country-ca.srl
mkdir -p pem private test_requests keystore

# For each epSOS compliant certificate:
# 1) Generate a new certificate request (.csr) in text form and a new private key
# 2) Generate a new certificate (.pem) from the previous certificate request, valid for 365 days, signed with the generated CA certificate
# 3) Export the certificate and its private key to a PKCS#12 file
# 4) Import the entries from the PKCS#12 keystore into a JKS keystore
# 5) Change the default entry alias ('1') in the keystore to a more clear one
# Note: The last 3 steps are not performed for VPN certificates.

# NCP Signature
openssl req -new -sha512 -nodes -newkey rsa:2048 -keyout private/$country-ncp-sign.key -out test_requests/$country-ncp-sign.csr -config conf/config-NCPsignature-csr -text -utf8
openssl x509 -req -days 365 -in test_requests/$country-ncp-sign.csr -CAcreateserial -CAserial ROOT/$country-ca.srl -CA ROOT/$country-ca.pem -CAkey ROOT/$country-ca.key -out pem/$country-ncp-sig-self-sign.pem -extfile conf/config-NCPsignature-crt -passin pass:$passwordCA -sha512

openssl pkcs12 -export -in pem/$country-ncp-sig-self-sign.pem -inkey private/$country-ncp-sign.key -password pass:$passwordKS > keystore/ncp-$country-sign.p12
keytool -importkeystore -srckeystore keystore/ncp-$country-sign.p12 -destkeystore keystore/$country-signature-keystore.jks -srcstoretype pkcs12 -deststorepass $passwordKS -srcstorepass $passwordKS
keytool -changealias -v -alias 1 -destalias $NcpSignatureAlias -keystore keystore/$country-signature-keystore.jks -storepass $passwordKS

# Service Consumer (NCP Client)
openssl req -new -sha512 -nodes -newkey rsa:2048 -keyout private/$country-ncp-sc.key -out test_requests/$country-ncp-sc.csr -config conf/config-ServiceConsumer-csr -text -utf8
openssl x509 -req -days 365 -in test_requests/$country-ncp-sc.csr -CAcreateserial -CAserial ROOT/$country-ca.srl -CA ROOT/$country-ca.pem -CAkey ROOT/$country-ca.key -out pem/$country-ncp-sc-self-sign.pem -extfile conf/config-ServiceConsumer-crt -passin pass:$passwordCA -sha512

openssl pkcs12 -export -in pem/$country-ncp-sc-self-sign.pem -inkey private/$country-ncp-sc.key -password pass:$passwordKS > keystore/ncp-$country-sc.p12
keytool -importkeystore -srckeystore keystore/ncp-$country-sc.p12 -destkeystore keystore/$country-service-consumer-keystore.jks -srcstoretype pkcs12 -deststorepass $passwordKS -srcstorepass $passwordKS
keytool -changealias -v -alias 1 -destalias $ServiceConsumerSignatureAlias -keystore keystore/$country-service-consumer-keystore.jks -storepass $passwordKS

# Service Provider (NCP Server)
openssl req -new -sha512 -nodes -newkey rsa:2048 -keyout private/$country-ncp-sp.key -out test_requests/$country-ncp-sp.csr -config conf/config-ServiceProvider-csr -text -utf8
openssl x509 -req -days 365 -in test_requests/$country-ncp-sp.csr -CAcreateserial -CAserial ROOT/$country-ca.srl -CA ROOT/$country-ca.pem -CAkey ROOT/$country-ca.key -out pem/$country-ncp-sp-self-sign.pem -extfile conf/config-ServiceProvider-crt -passin pass:$passwordCA -sha512

openssl pkcs12 -export -in pem/$country-ncp-sp-self-sign.pem -inkey private/$country-ncp-sp.key -password pass:$passwordKS > keystore/ncp-$country-sp.p12
keytool -importkeystore -srckeystore keystore/ncp-$country-sp.p12 -destkeystore keystore/$country-service-provider-keystore.jks -srcstoretype pkcs12 -deststorepass $passwordKS -srcstorepass $passwordKS
keytool -changealias -v -alias 1 -destalias $ServiceProviderSignatureAlias -keystore keystore/$country-service-provider-keystore.jks -storepass $passwordKS

# VPN Server
openssl req -new -sha512 -nodes -newkey rsa:2048 -keyout private/$country-ncp-vpn-server.key -out test_requests/$country-ncp-vpn-server.csr -config conf/config-VPNserver-csr -text -utf8
openssl x509 -req -days 365 -in test_requests/$country-ncp-vpn-server.csr -CAcreateserial -CAserial ROOT/$country-ca.srl -CA ROOT/$country-ca.pem -CAkey ROOT/$country-ca.key -out pem/$country-ncp-vpn-server-self-sign.pem -extfile conf/config-VPNserver-crt -passin pass:$passwordCA -sha512

# VPN Client
openssl req -new -sha512 -nodes -newkey rsa:2048 -keyout private/$country-ncp-vpn-client.key -out test_requests/$country-ncp-vpn-client.csr -config conf/config-VPNclient-csr -text -utf8
openssl x509 -req -days 365 -in test_requests/$country-ncp-vpn-client.csr -CAcreateserial -CAserial ROOT/$country-ca.srl -CA ROOT/$country-ca.pem -CAkey ROOT/$country-ca.key -out pem/$country-ncp-vpn-client-self-sign.pem -extfile conf/config-VPNclient-crt -passin pass:$passwordCA -sha512

# OCSP Responder
openssl req -new -sha512 -nodes -newkey rsa:2048 -keyout private/$country-ncp-ocsp.key -out test_requests/$country-ncp-ocsp.csr -config conf/config-OCSPresponder-csr -text -utf8
openssl x509 -req -days 365 -in test_requests/$country-ncp-ocsp.csr -CAcreateserial -CAserial ROOT/$country-ca.srl -CA ROOT/$country-ca.pem -CAkey ROOT/$country-ca.key -out pem/$country-ncp-ocsp-self-sign.pem -extfile conf/config-OCSPresponder-crt -passin pass:$passwordCA -sha512

openssl pkcs12 -export -in pem/$country-ncp-ocsp-self-sign.pem -inkey private/$country-ncp-ocsp.key -password pass:$passwordKS > keystore/ncp-$country-ocsp.p12
keytool -importkeystore -srckeystore keystore/ncp-$country-ocsp.p12 -destkeystore keystore/$country-ocsp-keystore.jks -srcstoretype pkcs12 -deststorepass $passwordKS -srcstorepass $passwordKS
keytool -changealias -v -alias 1 -destalias $OCSPSignatureAlias -keystore keystore/$country-ocsp-keystore.jks -storepass $passwordKS


# Importing a New Trusted Certificate
#
# Before adding the certificate to the keystore, keytool tries to verify it by attempting to construct a chain of trust from that certificate to a self-signed certificate (belonging to a root CA), using trusted certificates that are already available in the keystore.
#
# If the -trustcacerts option has been specified, additional certificates are considered for the chain of trust, namely the certificates in a file named "cacerts".
#
# If keytool fails to establish a trust path from the certificate to be imported up to a self-signed certificate (either from the keystore or the "cacerts" file), the certificate information is printed out, and the user is prompted to verify it

# Importing CA certificate into the keystores
keytool -importcert -alias $CAcertAlias -file ROOT/$country-ca.pem -keystore keystore/$country-signature-keystore.jks -storepass $passwordKS
keytool -importcert -alias $CAcertAlias -file ROOT/$country-ca.pem -keystore keystore/$country-service-consumer-keystore.jks -storepass $passwordKS
keytool -importcert -alias $CAcertAlias -file ROOT/$country-ca.pem -keystore keystore/$country-service-provider-keystore.jks -storepass $passwordKS
keytool -importcert -alias $CAcertAlias -file ROOT/$country-ca.pem -keystore keystore/$country-ocsp-keystore.jks -storepass $passwordKS

# Importing all certificates into the truststore

if [ "$initialTrustStore" ]; then
  cp $initialTrustStore keystore/$country-truststore.jks
else
  keytool -importcert -alias $CAcertAlias -file ROOT/$country-ca.pem -keystore keystore/$country-truststore.jks -storepass $passwordTS
fi

keytool -importcert -alias $NcpSignatureAlias -file pem/$country-ncp-sig-self-sign.pem -keystore keystore/$country-truststore.jks -storepass $passwordTS
keytool -importcert -alias $ServiceConsumerSignatureAlias -file pem/$country-ncp-sc-self-sign.pem -keystore keystore/$country-truststore.jks -storepass $passwordTS
keytool -importcert -alias $ServiceProviderSignatureAlias -file pem/$country-ncp-sp-self-sign.pem -keystore keystore/$country-truststore.jks -storepass $passwordTS
keytool -importcert -alias $VPNServerSignatureAlias -file pem/$country-ncp-vpn-server-self-sign.pem -keystore keystore/$country-truststore.jks -storepass $passwordTS
keytool -importcert -alias $VPNClientSignatureAlias -file pem/$country-ncp-vpn-client-self-sign.pem -keystore keystore/$country-truststore.jks -storepass $passwordTS
keytool -importcert -alias $OCSPSignatureAlias -file pem/$country-ncp-ocsp-self-sign.pem -keystore keystore/$country-truststore.jks -storepass $passwordTS

# Clean .p12 files
rm -f keystore/*.p12
