## Comando para adicionar informações em uma determinada linha
>sed -i '8i ErrorLog /admrede/logs_geral/www-error.log' *.conf

>sed -i '10i CustomLog /admrede/logs_geral/www-access-custom.log combined' *.conf

## Retirar todas as linhas em brancos de um determinado arquivo
>sed '/^$/d' arquivo.txt > novoarquivo.txt

## Substituir : por espaço
>sed -e "s/:/ /g" lambdas.txt > lambda.txt

## Comando para substituir informaçõs
>sed -i 's/ALLOWED_HOSTS = \[]/ALLOWED_HOSTS = \["*"\]/g' blackhole/blackhole/settings.py (substituicão)

>sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config (substituição)