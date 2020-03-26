#!/bin/bash -x

ls *.yaml | xargs -tI % kubectl delete -f %

while [ -n "$( kubectl -n kube-system get -l app.kubernetes.io/name=piraeus pod -o name )" ]; do 
    sleep 2
done 

ls *.yaml | xargs -tI % kubectl apply -f %

watch kubectl -n kube-system get -l app.kubernetes.io/name=piraeus pod -o wide