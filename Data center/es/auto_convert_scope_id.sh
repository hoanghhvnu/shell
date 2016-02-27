#!/bin/bash
# Hoanghh
# Auto convert scopeId from file to avatar

base_dir="/data/project/elasticsearch/indexer/_index_stat"
if [ ! -z $1 ]; then
    today=$(date +%Y-%m-%d -d "$1 days")
else
    today=$(date +%Y-%m-%d)
fi

path_scope_id="${base_dir}/${today}/${today}_create_id.txt"

# fetch avatar
run_dir="/data/project/elasticsearch/indexer"
cd $run_dir
java -cp RestFB.jar dsvn.FetchAvatarMain ${path_scope_id} input/token.txt conf/main/fetch_avatar/log4j.properties