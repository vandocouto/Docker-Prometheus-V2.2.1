# Conceitos

* O Prometheus armazena fundamentalmente todos os dados como time series
* Fluxos de valores com registro de data e hora pertencentes à mesma métrica e ao mesmo conjunto de dimensões rotuladas
* O Prometheus pode gerar time series para consultas futuras

### Nomes e Labels de métricas

* Toda time series é identificada exclusivamente por seu nome de métrica e um conjunto de pares de key/value, também conhecidos como labels
* O nome da métrica especifica o recurso geral de um sistema que é medido (por exemplo, http_requests_total - o número total de solicitações HTTP recebidas)
* Pode conter letras e dígitos ASCII, bem como sublinhados e dois pontos. Ele deve corresponder ao regex [a-zA-Z_:][a-zA-Z0-9_:]*

### Tipos de métricas

* As bibliotecas do client Prometheus oferecem quatro tipos principais de métricas
* Atualmente, elas são diferenciadas apenas nas bibliotecas do client (para permitir APIs adaptadas ao uso de tipos específicos) e no protocolo de conexão
* O servidor Prometheus ainda não faz uso das informações de tipo e nivela todos os dados em time series sem tipo

#### Contador

* Um contador é uma métrica acumulativa que representa um valor numérico único que só sobe
* Um contador é normalmente usado para contar as solicitações atendidas, as tarefas concluídas, os erros ocorridos, etc
* Os contadores não devem ser usados ​​para expor as contagens atuais de itens cujo número também pode diminuir


#### Calibre

* Um medidor é uma métrica que representa um único valor numérico que pode subir e descer arbitrariamente
* Os medidores são normalmente usados ​​para valores medidos, como temperaturas ou uso de memória atual, mas também "contagens" que podem subir e descer


### Jobs e Instâncias

* Em termos do Prometheus, um endpoint que você pode coletar é chamado de instância, geralmente correspondendo a um único processo
* Uma coleção de instâncias com o mesmo propósito, um processo replicado para escalabilidade ou confiabilidade, por exemplo, é chamado de job
* Por exemplo, um trabalho do servidor de API com quatro instâncias replicadas:

```bash
job: api-server
instance1: 1.2.3.4:5670
instance2: 1.2.3.4:5671
instance3: 5.6.7.8:5670
instance4: 5.6.7.8:5671
```


