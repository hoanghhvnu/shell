#!/bin/bash
# Author: Hoanghh
# Last modified: 
# 
today_narrow=$(date +%Y%m%d -d "-0 days")
today_path=$(date +%Y/%m/%d -d "-0 days")
today_hyphen=$(date +%Y-%m-%d -d "-1 days")
src="/data/app/facebook/facebook4jcrawler/data/rt/comment"
des="/data/http/facebook/rt/${today_path}"

if [ ! -d ${des} ]; then
        mkdir -p ${des}
fi

for name in "page" "group"
do
        file_name="${today_narrow}.000000.realtime.snsvn-${name}-v1.0.3.UTF-8.+0700.format1.sns.json.tsv"
        cd ${des}
        find ${src}/${name} -type f -name "${today_hyphen}*.tsv" -exec cat {} \; >> ${file_name}
        xz ${file_name}
        # delete old
        delete_hyphen=$(date +%Y-%m-%d -d "-3 days")
        find ${src} -type f -name "${delete_hyphen}*" -exec rm -f {} \;
done

delete_hyphen=$(date +%Y-%m-%d -d "-7 days")
find /data/app/facebook/facebook4jcrawler/logs/test/rt/comment -type f -name "logging.${delete_hyphen}" -exec rm -f {} \;

delete_hyphen=$(date +%Y-%m-%d -d "-3 days")
find /data/app/facebook/facebook4jcrawler/data/rt/postid -type f -name "${delete_hyphen}*" -exec rm -f {} \;