#!/bin/bash
# FORUM data gathering
## Written by hoanghh
# last modified: mar 30, 2015
USER="hoanghh"
IP="123.30.171.42"
craw_type="forum"
today=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)

remote_dir="/data/http/${craw_type}/${today_path}"
local_dir="/data/final/vn/${today_path}"
if [ ! -d "$local_dir" ]; then
	mkdir -p "$local_dir"
fi

suffix=".025000e.vn-00.wnvn-v2.UTF-8.+0700.format1.${craw_type}.json.tsv"
file_name="${today}${suffix}"

/usr/bin/rsync -az $USER@$IP:$remote_dir/ $local_dir/