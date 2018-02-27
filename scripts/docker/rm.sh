#!/bin/bash

docker-compose -p $app -f $data_path/docker-compose.yml rm -f -v -s >/dev/null 2>&1
echo $?
