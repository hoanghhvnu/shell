#!/bin/bash
# Hoanghh
# auto index scopeid, then fetch avatar for new scopeId, then index avatar

### INDEX scope interaction
today=$(date +%Y/%m/%d)
index_dir="/data/project/elasticsearch/indexer"
cd $index_dir && java -jar ESIndexer.jar conf/main/scope_interaction_2015_08.json conf/main/raw_scope_user.json conf/main/scope_interaction/log4j.properties /data/http/fb/vn/$today
cd $index_dir && java -jar ESIndexer.jar conf/main/scope_interaction_2015_08.json conf/main/raw_scope_user.json conf/main/scope_interaction/log4j.properties /data/backup/facebook/vn/$today

### PREPARE new scopeID
root_dir="/data/project/elasticsearch/indexer/_index_stat"
if [ ! -z $1 ]; then
    today=$(date +%Y-%m-%d -d "$1 days")
else
    today=$(date +%Y-%m-%d)
fi

#echo $today
if [ ! -d $today ]; then
        mkdir $today
fi
goal_pattern_file="${today}*.txt"
#echo $goal_pattern_file
grep_pattern="scope_user"
cd $root_dir

find . -maxdepth 1 -type f -iname "$goal_pattern_file" -exec mv {} $today \;
cd $today
if [ ! -f "${today}_create_id.txt" ]; then
    cat *create.txt | grep "$grep_pattern" | cut -f3 > "${today}_create_id.txt"
else
	echo "${today}_create_id.txt already exist, exit immediate!"
fi

path_scope_id="${root_dir}/${today}/${today}_create_id.txt"

### FETCH avatar
run_dir="/data/project/elasticsearch/indexer"
cd $run_dir
java -cp RestFB.jar dsvn.FetchAvatarMain ${path_scope_id} input/token.txt conf/main/fetch_avatar/log4j.properties

### INDEX Avatar user
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