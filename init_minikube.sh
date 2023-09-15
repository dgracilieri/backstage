#!/bin/bash

minikube start --driver=docker
minikube addons enable ingress 
minikube addons enable ingress-dns
minikube addons enable metrics-server
minikube addons enable pod-security-policy
minikube addons enable registry
minikube addons enable dashboard
kubectl create ns curso001