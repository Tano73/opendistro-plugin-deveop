#!/bin/bash
PWD=`pwd`
docker run --rm -v $PWD/storage/plugins:/develop/kibana/plugins -it tano/kibana-plugin-dev:7.10.2 /develop/build_plugin.sh
