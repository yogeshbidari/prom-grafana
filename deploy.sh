#!/bin/bash

slack_url=$(awk -F= '{if ($1 == "slack_url") print $2}' <variables.txt)
slack_channel=$(awk -F= '{if ($1 == "slack_channel") print $2}' <variables.txt)
cluster=$(awk -F= '{if ($1 == "cluster_name") print $2}' <variables.txt)

sed -i "s+\(api_url:\s\)\(.*\)+\1$slack_url+g" values-monit.yaml
sed -i "s+\(channel:\s\)\(.*\)+\1\'$slack_channel\'+g" values-monit.yaml
sed -i "s+\(cluster_name:\s\)\(.*\)+\1$cluster+g" values-monit.yaml

#helm install -f values-monit.yaml stable/prometheus --name prometheus --namespace monitoring
