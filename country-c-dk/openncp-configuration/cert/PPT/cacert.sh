mkdir -p ROOT
country="dk"
openssl genrsa -des3 -out ROOT/$country-ca.key 4096
openssl req -new -x509 -days 3650 -key ROOT/$country-ca.key -out ROOT/$country-ca.pem
