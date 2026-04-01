# Comandos Mysql (OpenStack)

## Comando para apagar uma determinada instância
>UPDATE nova.instances SET vm_state='deleted', deleted_at=now(), deleted='1' WHERE uuid='';

## Comando para apagar um determinado volume
>update volumes set deleted=1,deleted_at=now(),status='detached' where id='b7b68b9a-79ab-471b-8159-7900317b23dd';

## Comando para deixar volume em modo available
>UPDATE volumes SET attach_status='detached', instance_uuid=NULL, attach_time=NULL, status="available" WHERE id='46065f49-d967-4c88-a0c5-48d46ce80bdd'; (Versão ICEHOUSE)

>UPDATE volumes SET attach_status='detached', status="available" WHERE id='46065f49-d967-4c88-a0c5-48d46ce80bdd'; (Versão KILO)

>UPDATE volumes SET status='in-use' WHERE id='7303d265-7788-43ca-a521-2770b4ba714d';

## Comando para listar informações de um determinado Volume
>select * from volumes where id='554ec57a-c2a3-4195-b6f7-520c2625a829'\G;

## Comando para listar informações de uma determinada instância
>select * from instaces where id='554ec57a-c2a3-4195-b6f7-520c2625a829'\G;

## Comando para alterar o status (state) de uma determinada instância
>update instances SET vm_state='stopped' where uuid='62dfff0c-cbb1-45c2-8f13-4d6b434004e1';

## Exibe metricas dos Computes Nodes (total de recursos)
>select hypervisor_hostname,vcpus,vcpus_used,running_vms,memory_mb,memory_mb_used,free_ram_mb,deleted from compute_nodes where deleted=0 order by hypervisor_hostname;

## Exibe todas as instâncias por Compute Node
>SELECT t1.display_name, t2.name, t1.vm_state, CONCAT("instance-0000",CONV(t1.ID,10,16)) AS virsh_ID, t1.host FROM nova.instances t1 JOIN keystone.project t2 ON t2.id = t1.project_id where t1.deleted='0' and vm_state NOT IN ('deleted','error','building')

## Para exportar para CSV
>INTO OUTFILE '/tmp/instancias-compute2.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

## Comando utilizado para apagar volumes "fantasmas"
>update block_device_mapping set deleted_at=now(), deleted='1' where instance_uuid='af7e73d7-9140-4d2c-9e91-8cc7dd3a2f2f' and deleted = '0' and device_name='/dev/vdb';

## Verificar a montagem de volume de uma determinada instância
>select * from block_device_mapping where instance_uuid = '2e0faa94-c44d-4d77-9d37-9f5bf83ac6a9' and deleted = 0\G;
 
## Fazendo update de informações no banco de dados
>update instances set key_name='observatoriodaimprensa' where uuid='d91fa855-568d-47fa-a320-3bc26bec4fe2';
 
## Pegar ID das instâncias diretamente no banco de dados
>for i in `mysql -uroot -p -B nova -e "select * from instances where vm_state='active' and host='ops-compute-06.openstack.dualtecint.com.br'\G ;" | grep -i uuid| grep -v 'ephemeral_key_uuid:' | awk -F "uuid:" '{print $2}'`; do
echo $i
done

## Query que coleta várias informações do Openstack (NOVA)
>SELECT t1.display_name, t2.name, t1.vm_state, CONCAT("instance-0000",LOWER(CONV(t1.ID,10,16))) AS virsh_ID, t1.uuid, t1.created_at, t1.host, GROUP_CONCAT(t3.name) AS user FROM nova.instances t1 JOIN keystone.project t2 ON t2.id = t1.project_id LEFT JOIN keystone.user AS t3 ON t3.default_project_id = t2.id WHERE t1.deleted='0' AND t1.vm_state NOT IN ('deleted','error','building') GROUP BY t1.uuid;

## Query para levantar portas com estado de BUILD
>SELECT t0.id AS "port_id", t0.tenant_id, t2.name, t0.device_id AS "instance_id", t1.display_name AS "instance_name", t1.node FROM neutron.ports AS t0 INNER JOIN nova.instances t1 ON t0.device_id = t1.uuid INNER JOIN keystone.project t2 ON t2.id = t1.project_id WHERE t0.status = 'BUILD' order by t1.node;

## Comandos para localizar uma determinada entrada nas tabelas do banco de dados do Mysql
>mysql -D "nome_banco_mysql" -e "show tables;" | awk '{print $1}' > /tmp/tables

Exemplo: mysql -D neutron -e "show tables;" | awk '{print $1}' > /tmp/tables

Obs.: Apagar a primeira linha do arquivo tables

>for i in $(cat /tmp/tables); do mysql -u root -D "nome_bando_mysql" -e "select * from $i\G;"|grep "palavra_de_pesquisa" && echo $i; done

Exemplo: for i in $(cat /tmp/tables); do mysql -u root -D neutron -e "select * from $i\G;"|grep netscaler && echo $i; done

## Comando para retirar as informações de clientes pelo banco de dados (NOVA)
>SELECT t1.display_name, t2.name, t1.vm_state, CONCAT("instance-0000",LOWER(CONV(t1.ID,10,16))) AS virsh_ID, t1.uuid, t1.created_at, t1.host, GROUP_CONCAT(t3.name) AS user FROM nova.instances t1 JOIN keystone.project t2 ON t2.id = t1.project_id LEFT JOIN keystone.user AS t3 ON t3.default_project_id = t2.id WHERE t1.deleted='0' AND t1.vm_state NOT IN ('deleted','error','building') GROUP BY t1.uuid INTO OUTFILE '/tmp/instancias-computes-users-03-04.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

## Comando para alterar informações no banco de dados
>UPDATE volumes SET host=REPLACE(host, 'ops-ctrl-01', 'cinder') WHERE host LIKE 'ops-ctrl-01%';

## Comando para alterar informações no bando de dados via terminal (sem acesso diretamente ao banco)
>mysql -u root cinder -e "UPDATE volumes SET host=REPLACE(host, '$OLD_DOMAIN01', '$NEW_DOMAIN') WHERE host LIKE 'ops-ctrl-01%'";

## Atualizar status de consumo de quotas de um determinado projeto
>update quota_usages set in_use='31' where id="3232" and project_id='d530842bf2704d36bdc8811d895d3704';