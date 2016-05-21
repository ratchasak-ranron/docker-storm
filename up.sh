#!/bin/bash
docker-compose -p storm -f ./docker-zookeeper.yml up -d
docker-compose -p storm -f ./docker-storm.yml up -d nimbus
docker exec -it storm_nimbus_1 cp /usr/share/apache-storm/external/flux/flux-core-1.0.1.jar /usr/share/apache-storm/lib
docker exec -it storm_nimbus_1 cp /usr/share/apache-storm/external/storm-mqtt/storm-mqtt-1.0.1.jar /usr/share/apache-storm/lib
docker exec -it storm_nimbus_1 cp /usr/share/apache-storm/external/storm-mqtt/storm-cassandra-1.0.1.jar /usr/share/apache-storm/lib
docker-compose -p storm -f ./docker-storm.yml up -d --no-deps supervisor
docker-compose -p storm -f ./docker-storm.yml up -d --no-deps ui
