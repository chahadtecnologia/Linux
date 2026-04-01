# Comando IP

## dicionar um IP em uma interface
>ip addr add "IP" dev "interface"

Exemplo: ip addr add 192.168.1.10 dev eth0

## Remover um IP de uma interface
>ip addr del "IP/MASC" dev "interface"

Exemplo: ip addr del 192.168.1.10/24 dev eth0

## Exibir todas as interfaces
>ip addr show

## Ativando uma interface de rede
>ip link set "interface" up 

Exemplo: ip link set eth0 up

## Desativar uma interface de rede
>ip link set "interface" down

Exemplo: ip link set eth0 down

## Verificar as rotas registradas no Linux
>ip route show 

## Adicionar uma rota estática
>ip route add "network" via "IP" dev "interface"

Exemplo: ip route add 10.10.20.0/24 via 192.168.50.100 dev eth0

## Remover uma rota
>ip route del "network"

Exemplo: ip route del 10.10.20.0/24