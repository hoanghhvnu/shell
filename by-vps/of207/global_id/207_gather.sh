#! /bin/bash
# Author: HoangHH
# Gather scope id then copy to remote vps
remote_user="dzung"
today_path=$(date +%Y/%m/%d)
today_hyphen=$(date +%Y-%m-%d)

mkdir -p ${today_path}
local_path="/exdata/facebook_id/${today_path}"

if [ ! -d $local_path ]; then
        mkdir -p $local_path
fi

local_file=${today_hyphen}.scope


index_stat_dir="/data/project/elasticsearch/indexer/_index_stat/${today_hyphen}"
find $index_stat_dir -type f -name "*user_scope...user___created" -exec cat {} >> $local_path/$local_file \;
cd $local_path
total_line=$(wc -l $local_file |  cut -f1 -d ' ');
half=$(echo "$total_line / 2" | bc);
split -d -l ${half} ${today_hyphen}.scope ${today_hyphen}.scope.

# copy to remote
for i in {00..01}
do
	ssh ${remote_user}@fbid${i}.datasection.com.vn "mkdir -p /home/dzung/${today_path}"
	scp $local_path/${today_hyphen}.scope.${i} ${remote_user}@fbid${i}.datasection.com.vn:/home/dzung/${today_path}/
done