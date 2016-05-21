#!/bin/bash
docker-compose -p storm -f ./docker-storm.yml down
docker-compose -p storm -f ./docker-zookeeper.yml down