#!/usr/bin/env bash

APP=$1
docker logs $(docker ps | grep 'fabric8/$APP' | cut -f1 -d" ")
