#!/bin/sh

oc delete all -l provider=fabric8
oc delete all -l label=fabric8

oc delete rc -l provider=fabric8
oc delete services -l provider=fabric8
oc delete templates --all
oc delete service elasticsearch-cluster
oc delete service letschat
oc delete service sonarqube
oc delete service taiga
oc delete rc letschat
oc delete rc sonarqube
oc delete rc taiga
oc delete serviceaccount fabric8
oc delete OAuthClient fabric8

. ./demo/scripts/deleteroutes.sh
