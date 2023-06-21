#!/bin/bash

# Create namespace
kubectl create namespace argocd

# Apply manifest
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
