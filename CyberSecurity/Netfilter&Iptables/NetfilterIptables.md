# Netfilter/Iptables

Para que o iptables tenha seu funcionamento correto é necessário ativar a encaminhamento (roteamento entre as interfaces) de pacotes no servidor Linux (ip_forward)

>echo 1 > /proc/sys/net/ipv4/ip_forward

## Iptables

- Iptables trabalha com ACLs (Access Control List);
- Iptables utiliza o conceito de cadeias (chains), tabelas (tables) e regras (rules)

- Chains - Estrutura que irá armazenar as regras (rules);
- Rules - São as regras aplicadas/configuradas na cadeia;
- Tables - Selecionam os níveis/tipos de atuação das regras;

table 1 ---> [ Chain (rule1) -> (rule2) -> (rule3) ] ---> table 2

- Netfilter: é o módulo do Kernel Linux que faz a inspeção dos pacotes;
- Iptables: é o interpretador de comandos que permite manipular as regras via Netfilter;
- Iptables é statefull

### Tabela Filter (efetua a filtragem dos pacotes. Tem o poder de aceitar ou não um pacote mas NÃO pode modificar o pacote)
- INPUT: Após o roteamento, sendo pacote para um processo local;
- OUTPUT: Gerados por processos locais, antes de realizar o roteamento;
- FORWARD: Após a decisão de roteamento, para pacotes que devem ser encaminhados para outro servidor/máquina;
Opções da tabela Filter: Accept, Drop, Reject e Log

### Tabela NAT
- PREROUTING: Ao chegar na interface, antes de atingir o roteamento;
- POSTROUTING: Após ter sido roteado e antes de sair por uma interface;
- OUTPUT: Gerados por processos locais, antes de realizar o roteamento; 
Opções da tabela NAT: SNAT, DNAT, MASQUERADE e REDIRECT

### Tabela Mangle 
- INPUT: Após o roteamento, sendo pacote para um processo local;
- OUTPUT: Gerados por processos locais, antes de realizar o roteamento;
- FORWARD: Após a decisão de roteamento, para pacotes que devem ser encaminhados para outro servidor/máquina;
- PREROUTING: Ao chegar na interface, antes de atingir o roteamento;
- POSTROUTING: Após ter sido roteado e antes de sair por uma interface;

A tabela mangle, por sua vez, tem a função de especificar ações especiais que devem ser aplicadas no tráfego que passa pelas cadeias. No caso, tais ações ocorrem anteriormente aos chains das tabelas filter e NAT.

Para melhor compreendermos esse processo, vamos nos apegar ao fato de que as cadeias da tabela mangle são 5 (PREROUTING, POSTROUTING, INPUT, OUTPUT e FORWARD), isto é, correspondem às cadeias das outras camadas do iptables.

Supondo que a chain INPUT seja acionada na tabela mangle. Isso significa que regras especiais deverão ser aplicadas antes que os pacotes passem pela chain INPUT correspondente à tabela filter.
Vale salientar que a cadeia OUTPUT do mangle corresponde ao OUTPUT da tabela NAT.

