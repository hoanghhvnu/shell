#!/bin/bash
# Hoanghh
# Auto index avatar map to avatar user index

source_dir="/data/project/elasticsearch/indexer/data"
if [ ! -z $1 ]; then
    today=$(date +%Y-%m-%d -d "$1 days")
else
    today=$(date +%Y-%m-%d)
fi
cd $source_dir

if [ ! -d $today ]; then
        mkdir $today
fi
find . -maxdepth 1 -type f -iname "${today}*result.txt" -exec mv {} $today \;
cd $today

cat ${today}*map_result.txt > "${today}_sumary_result.txt"
source_file="${source_dir}/${today}/${today}_sumary_result.txt"
#echo $source_file
run_dir="/data/project/elasticsearch/indexer"
cd $run_dir
java -jar ESIndexer.jar conf/main/avatar_user/avatar_user.json conf/main/avatar_user/log4j.properties ${source_file}