mkdir -p ROOT
country="es"
openssl genrsa -des3 -out ROOT/$country-ca.key 4096
openssl req -new -x509 -days 3650 -key ROOT/$country-ca.key -out ROOT/$country-ca.pem
