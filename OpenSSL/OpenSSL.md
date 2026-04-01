## Gerando a chave
>openssl genrsa -out chave_privada.key 4096

## Criando certificado .csr
>openssl req -new -key chave_privada.key -out req_cert.csr 

## Auto Assinar Certificado
>openssl x509 -req -days 365 -in req_cert.csr -signkey chave_privada.key -out certificado_assinado.crt

## Version 3
>openssl req -new -nodes -key chahad.key -x509 -subj "/O=Chahad Tecnologia/CN=*.chahad.com.br" -out chahad.com.br.crt


## Verificar conteúdo de certificado

>openssl x509 -text -noout -in certificado.crt


## Converter chave para PEM
>openssl x509 -inform DER -outform PEM -in server.crt -out server.crt.pem

## Criar certificado SSL (cert e pem)
>openssl req -x509 -newkey rsa:2048 -subj "/CN=chahad" -days 365 -out chahad.crt -keyout chahad.pem -passout pass:chahad!
 
## Convert PEM to PFX
>openssl pkcs12 -inkey chahad.key -in chahad.crt -export -out chahad.pfx

>openssl pkcs12 -export -in chahad.crt -inkey chahad.pem -passin pass:chahad! -out chahad.pfx -passout pass:chahad!

>openssl pkcs12 -export -in chahad.crt -inkey chahad.key -certfile root.crt -out chahad.pfx