#!/bin/bash
# Collect comment
yesterday_path=$(date +%Y/%m/%d -d "-1 day")

today_path=$(date +%Y/%m/%d -d "-0 day")
today_narrow=$(date +%Y%m%d)
src="/data/app/CommentNewsCrawler/data/${yesterday_path}"
des="/data/http/comment/${today_path}"
mkdir -p ${des}
find ${src} -type f -exec cat {} \; >> ${des}/${today_narrow}.comment.json.tsv
cd ${des}
find . -type f -exec xz {} \;