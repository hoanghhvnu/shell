#!/bin/bash
# NEWS data collector
## Written by hoanghh
# last modified: mar 30, 2015
craw_type="news"
today=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)
yesterday=$(date --date="yesterday" +%Y%m%d)

source_dir="/data/${craw_type}/dsvncrawler/data/${yesterday}"
dest_dir="/data/http/${craw_type}/wnvn-v2/${today_path}"
mkdir -p "$dest_dir"



suffix=".025000e.vn-00.wnvn-v2.UTF-8.+0700.format1.${craw_type}.json.tsv"
output_name="${today}${suffix}"

cd "$source_dir"
if [ -d "$source_dir" ]; then
        find . -name "*.tsv" -type f -exec cat {} >> $output_name \;
        xz "$output_name";
        mv "$output_name.xz" "$dest_dir/"
fi

############################################################################
# DELETE OLD DATA
cd ..
seven_day_ago=$(date --date="14 days ago" +%Y%m%d)
if [ -d "$seven_day_ago" ]; then
        rm -rf "$seven_day_ago"
fi
