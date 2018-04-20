#!/bin/bash


sed -i 's/PROMETHEUS_SMTP/'$PROMETHEUS_SMTP'/g'         /etc/prometheus/alertmanager.yml
sed -i 's/SMTP_FROM/'$SMTP_FROM'/g'                     /etc/prometheus/alertmanager.yml
sed -i 's/SMTP_REQUIRE_TLS/'$SMTP_REQUIRE_TLS'/g'       /etc/prometheus/alertmanager.yml
sed -i 's/TO/'$TO'/g'                            	/etc/prometheus/alertmanager.yml
sed -i 's/CHANNEL/'$CHANNEL'/g'                         /etc/prometheus/alertmanager.yml
sed -i 's/USERNAME/'$USERNAME'/g'                       /etc/prometheus/alertmanager.yml
sed -i 's/SLACK_API_URL/'$SLACK_API_URL'/g'             /etc/prometheus/alertmanager.yml


alertmanager --config.file=/etc/prometheus/alertmanager.yml
