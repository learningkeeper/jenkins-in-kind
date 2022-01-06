#! /bin/bash
set -euo pipefail

# set up kind cluster
kind create cluster --wait 10m --config kind-config/kind-ingress-config.yaml


# install ingress-nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s


helm upgrade --install jenkins ./jenkins-k8s -f jenkins-tailored-values.yaml -n default

# delete ingress-nginx webhook for mis-dection
kubectl delete   validatingwebhookconfigurations ingress-nginx-admission -A

# apply ingress yaml manually
kubectl apply -f app-ingress.yaml

echo "sleep 300 seconds"
sleep 300


echo "Use browser to connect 127.0.0.1:80"
curl -D- 127.0.0.1:80 
