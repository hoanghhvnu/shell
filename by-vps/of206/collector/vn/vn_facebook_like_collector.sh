#!/bin/bash
crawl_version="v1.0.3"
like_home="/data/facebook/likes/vn"
yesterday=$(date -d '-1 day' +%Y-%m-%d)
today=$(date +%Y%m%d)
suffix="like_result.tsv"

for section in "fanpage" "group"
do
	cd "${like_home}/${section}"
	goal_name="${today}.002000.vn-00.likes.snsvn-${section}-${crawl_version}.UTF-8.+0700.format1.sns.tsv"
	find . -maxdepth 1 -type f -iname "${yesterday}*${suffix}" -exec cat {} \; >> "$goal_name"
	xz "${goal_name}"
	
done
