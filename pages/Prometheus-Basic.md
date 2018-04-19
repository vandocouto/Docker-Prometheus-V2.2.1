# Prometheus

### Conceitos básicos sobre Prometheus 

* Prometheus é um software open source que contém um kit de ferramentas para monitoração e alertas
* Criado pela SoundCloud, Hoje é uma das ferramentas mais adotadas por diversas empresas
* É um dos maiores projetos de código aberto mantido por pela comunidade
* Para enfatizar o quão sólido é o projeto Prometheus, a Cloud Native Computing, mantém como o segundo projeto hospedado depois do Kubernetes

### Características 

#### As principais características do Prometheus são:

* Modelo de dados multidimensional com uma séria de dados sendo identificados pelo nome da métrica e key/value
* Linguagem de consulta / construção flexível para agilizar a dimensionalidade no modelo de Cloud Computing
* Nenhuma dependência de armazenamento distribuído
* Uma coleção (colletctions) que troca informações por meio do protocolo HTTP
* Os targets são descobertos por meio do (service discovery) ou da configuração estática
* Suporte para gráficos e dashboard

### Componentes 

#### O ecossistema Prometheus consiste em vários componentes:

* O Servidor Prometheus armazena os dados em série (data)
* Bibliotecas Client para instrumentar cada código da aplicação
* Gateway de push para apoiar os jobs de curta duração 
* Exporters (exportadores) para serviços como HAproxy, StatsD, Graphite, MongoDB e etc
* Um gerenciador de alertas para lidar com todos os tipos de alertas
* A maioria dos componentes do Prometheus é escrito em Go
* Ele armazena todos os exemplos coletados localmente e executa as regras sobre esses dados para agregar e registrar novas métricas em tempo real a partir de dados existentes 

### Onde posso utilizar o Prometheus?

* O Prometheus funciona bem para gravar qualquer dado alfa numérico em tempo real
* Ele se ajusta tanto ao monitoramento centralizado na máquina quanto ao monitoramento de arquiteturas altamente dinâmicas orientadas a serviços
* Em um mundo de microsserviços, seu suporte para coleta e consulta de dados multidimensionais é um ponto muito forte
* Com o Prometheus é possível diagnosticar rapidamente os problemas durante uma interrupção
* Cada servidor Prometheus pode ser independente, não dependendo do armazenamento de rede ou de outros serviços remotos

### Configurando Prometheus 

* A configuração do Prometheus é através do YAML
* O download Prometheus vem com uma configuração de exemplo em um arquivo chamado prometheus.yml

```bash
global:
  scrape_interval:     15s
  evaluation_interval: 15s
rule_files:
  # - "first.rules"
  # - "second.rules"
scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ['0.0.0.0:9090']
```

### Existem três blocos de configuração no arquivo de configuração de exemplo: global , rule_files e scrape_configs .

* O bloco **global** controla a configuração global do servidor Prometheus
* O **scrape_interval** controla com que frequência o Prometheus (scrape targets)
* O **evaluation_interval** controla com que frequência o Prometheus avalia as regras
* O **rule_files** específica a localização de qualquer regras que queremos que o servidor Prometheus carregue
* O **scrape_configs** controla quais os recursos o Prometheus monitora

---

* Como o Prometheus também expõe dados sobre si mesmo como um endpoint HTTP, ele pode rastrear e monitorar sua própria saúde 
* Na configuração padrão, existe um único Job, chamado prometheus, que coleta os dados em tempo real expostos pelo servidor Prometheus
* O Job contém um único destino estaticamente configurado, o localhost na porta 9090
* O Prometheus espera que as métricas estejam disponíveis nos destinos em uma rota/patch chamado de /metrics
* Portanto, para visualizar as métricas basta acessar a URL: _http://localhost:9090/metrics_

### Começando Prometheus

* Para iniciar o Prometheus com nosso arquivo de configuração recém-criado, mude para o diretório que contém o binário Prometheus e execute:

```bash
./prometheus --config.file=prometheus.yml
```

* Você pode navegar até uma página de status em http://localhost:9090
* A cada 30 segundos será coletado os dados  a partir do seu próprio ponto de extremidade de métricas via HTTP

### Verificando os dados que o Prometheus coletou

* Para usar o navegador de expressões internas do Prometheus, navegue até http://localhost:9090/graph e escolha a visualização "Console" na guia "Graph”
* Para visualizar as métricas, acesse a URL http://localhost:9090/metrics, uma métrica que o Prometheus exporta sobre si é chamada http_requests_total (o número total de solicitações HTTP que o servidor Prometheus fez). 
* Se estivéssemos interessados somente em solicitações que resultassem no código HTTP 200, basta fornecer ao console a seguinte regra:

```bash
 http_requests_total{code="200”} 
```

* Para contar o número de coletas retornadas, você pode escrever:

```bash
count(http_requests_total)
```
 
* Para representar graficamente expressões, navegue para  http://localhost:9090/graph e use a guia "Graph"
Por exemplo, insira a expressão para representar graficamente a taxa de solicitações HTTP por segundo:

```bash
rate(http_requests_total[1m])
```

### Instalando o Exportador de Nó 

* Para monitorar os recursos de um node, seja ele local ou remoto, basta fazer o download do **node_export** para a sua plataforma e, em seguida, extrair o binário

```bash
tar xvfz node_exporter-*.tar.gz
cd node_exporter-*
```

* O Node Exporter é um único binário (node_exporter), que possui um conjunto configurável de coletores para reunir vários tipos de métricas baseadas em host. Por padrão, os coletores reúnem  CPU, memory, disk, e outras métricas e em seguida os expõem para ser coletados

```bash
./node_exporter

```

### Verificando as métricas: 

* As métricas do Exportador de Nós estão disponíveis na porta 9100 no host no caminho /metrics
* Você pode navegar até este URL para ver as métricas expostas: _**http://IP:9100/metrics**_

### Configurando o Prometheus para monitorar o host 

* Configurando o Prometheus para adicionar o novo Node
* Para conseguir isso, adicione uma nova definição de Job na seção scrape_configs no arquivo prometheus.yml

```bash
- job_name: node1
    static_configs:
      - targets: ['localhost:9100’]
- job_name: node2
    static_configs:
      - targets: [‘192.168.1.151:9100']
```

* O novo Job é chamado de node2
* Eles coletam os dados, localhost na porta 9100 e 192.168.1.151 no porta 9100
* Se quiser substituir o nome (node) pelo endereço IP é possível também





