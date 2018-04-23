# Armazenamento (Storage)

* O Prometheus inclui um banco de dados de time series em disco local, mas também se integra opcionalmente a sistemas de armazenamento remoto

### Armazenamento local

* O banco de dados de time series local da Prometheus armazena dados de time series em um formato personalizado no disco

### Integrações de armazenamento remoto

* Como descrito acima, o armazenamento local da Prometheus é limitado em sua escalabilidade e durabilidade
* Em vez de tentar resolver o armazenamento de longo prazo no próprio Prometheus, o Prometheus possui um conjunto de interfaces que permitem a integração com sistemas remotos de armazenamento de longo prazo

#### Visão geral

* O Prometheus integra-se aos sistemas de armazenamento remoto de duas maneiras:

* O Prometheus pode escrever amostras que são armazenadas em um URL remoto em um formato padronizado
* O Prometheus pode ler (voltar) amostras de dados de um URL remoto em um formato padronizado

![Remote Storage](../imgs/remote_integrations.png)


Fonte: https://prometheus.io/docs/prometheus/latest/storage/