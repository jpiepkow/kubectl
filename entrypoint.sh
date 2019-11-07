#!/bin/sh

set -e
curl -sL https://github.com/digitalocean/doctl/releases/download/v1.33.1/doctl-1.33.1-linux-amd64.tar.gz | tar -xzv
# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config

sh -c "$*"
