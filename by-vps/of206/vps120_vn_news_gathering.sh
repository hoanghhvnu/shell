#!/bin/bash
# News data gathering
## Written by hoanghh
# last modified: mar 30, 2015
USER="ds_vn"
IP="123.30.186.120"
craw_type="news"
today=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)

remote_dir="/data/http/${craw_type}/wnvn-v2/${today_path}"
local_dir="/data/final/vn/${today_path}"
if [ ! -d "$local_dir" ]; then
	mkdir -p "$local_dir"
fi

suffix=".029000e.vn-00.wnvn-v2.UTF-8.+0700.format1.${craw_type}.json.tsv"
file_name="${today}${suffix}"

/usr/bin/rsync -az $USER@$IP:$remote_dir/ $local_dir/