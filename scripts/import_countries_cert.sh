#!/bin/bash
# This script imports all the certificates of a country in all the truststores 
# (e.g, it-trustore, es-truststore, dk-truststore). So countries can talk to each other. This script should be revised
# in order to load in specific truststores only the needed certificates, and not all of them.

declare -a countries=("es" "it" "dk")
declare -a countries_ts=("es" "it" "dk")
declare -a countries_dir=("country-a-es" "country-b-it" "country-c-dk")

passwordTS="konfido"
passwordKS="konfido"

organization="cini"

index_ts=0;

for country_ts in "${countries_ts[@]}"; do
	index=0;
	for country in "${countries[@]}"; do


		CAcertAlias=ppt.ca.epsos.$organization.${country}
		NcpSignatureAlias=ppt.ncp-signature.epsos.$organization.${country}
		VPNServerSignatureAlias=ppt.ncp-vpns.epsos.$organization.${country}
		VPNClientSignatureAlias=ppt.ncp-vpnc.epsos.$organization.${country}
		ServiceConsumerSignatureAlias=ppt.ncp-sc.epsos.$organization.${country}
		ServiceProviderSignatureAlias=ppt.ncp-sp.epsos.$organization.${country}
		OCSPSignatureAlias=ppt.ncp-ocsp.epsos.$organization.${country}
		


		if [ "$country_ts" != "$country" ]
		then

		
			keytool -noprompt -importcert -alias $NcpSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sig-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-truststore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $ServiceConsumerSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sc-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-truststore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $ServiceProviderSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sp-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-truststore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $VPNServerSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-vpn-server-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-truststore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $VPNClientSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-vpn-client-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-truststore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $OCSPSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-ocsp-self-sign.pem -keystore ${countries_dir[$country_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-truststore.jks -storepass $passwordTS
	
			keytool -noprompt -importcert -alias $NcpSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sig-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-provider-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $ServiceConsumerSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sc-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-provider-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $ServiceProviderSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sp-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-provider-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $VPNServerSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-vpn-server-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-provider-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $VPNClientSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-vpn-client-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-provider-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $OCSPSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-ocsp-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-provider-keystore.jks -storepass $passwordTS
	
			keytool -noprompt -importcert -alias $NcpSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sig-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-consumer-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $ServiceConsumerSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sc-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-consumer-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $ServiceProviderSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sp-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-consumer-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $VPNServerSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-vpn-server-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-consumer-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $VPNClientSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-vpn-client-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-consumer-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $OCSPSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-ocsp-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-service-consumer-keystore.jks -storepass $passwordTS
	
			keytool -noprompt -importcert -alias $NcpSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sig-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-ocsp-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $ServiceConsumerSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sc-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-ocsp-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $ServiceProviderSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-sp-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-ocsp-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $VPNServerSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-vpn-server-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-ocsp-keystore.jks -storepass $passwordTS
			keytool -noprompt -importcert -alias $VPNClientSignatureAlias -file ${countries_dir[$index]}/openncp-configuration/cert/PPT/pem/${country}-ncp-vpn-client-self-sign.pem -keystore ${countries_dir[$index_ts]}/openncp-configuration/cert/PPT/keystore/${country_ts}-ocsp-keystore.jks -storepass $passwordTS


		fi
		
		index=$((index+1))

	done
	
	index_ts=$((index_ts+1))
	
done

