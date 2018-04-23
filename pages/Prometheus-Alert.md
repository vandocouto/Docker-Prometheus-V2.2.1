# Alertas

* Alerta com Prometheus é separado em duas partes. As regras de alerta nos servidores Prometheus enviam alertas para um AlertManager
* O AlertManager gerencia esses alertas, incluindo silenciamento, inibição, agregação e envio de notificações por meio de métodos como email, PagerDuty e HipChat e etc


### Os principais passos para configurar alertas e notificações são:

* Configurar o Alertmanager
* Configurar o Prometheus para falar com o AlertManager
* Criar as regras de alerta no Prometheus

* O AlertManager lida com alertas enviados por aplicativos client, como o servidor Prometheus
* Ele cuida da desduplicação, do agrupamento e do roteamento para a integração correta do receptor, como email, PagerDuty e etc
* Também cuida do silenciamento e inibição de alertas

Leia: https://prometheus.io/docs/alerting/alertmanager/

## Configuração

* Alertmanager e configurado configurado por meio de flags na linha de comando ou em um arquivo de configuração
* Enquanto as flags da linha de comando configuram parâmetros imutáveis ​​do sistema, o arquivo de configuração define regras de inibição, roteamento de notificação e receptores de notificação
* Para especificar qual arquivo de configuração carregar, use a flags ```--config.file```

```bash
 ./alertmanager --config.file=simple.yml
```

Leia: https://prometheus.io/docs/alerting/configuration/