#!/bin/bash
# Hoanghh
# filter scopeId from index log file

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

# fetch avatar
run_dir="/data/project/elasticsearch/indexer"
cd $run_dir
java -cp RestFB.jar dsvn.FetchAvatarMain ${path_scope_id} input/token.txt conf/main/fetch_avatar/log4j.properties