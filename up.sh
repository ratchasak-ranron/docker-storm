#!/bin/bash
docker-compose -p storm -f ./docker-storm.yml up -d nimbus
docker exec -it storm_nimbus_1 cp /usr/share/apache-storm/external/flux/flux-core-1.0.1.jar /usr/share/apache-storm/lib
docker-compose -p storm -f ./docker-storm.yml up -d --no-deps supervisor
docker-compose -p storm -f ./docker-storm.yml up -d --no-deps ui
