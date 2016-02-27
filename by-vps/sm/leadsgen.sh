#/bin/bash
# Author: hoanghh
# Date Jan 15, 16
today_path=$(date +%Y/%m/%d)
archive="/data/final/vn"

des_path="/data/hoanghh/leadsgen/monitor/"
cd ${des_path}
mkdir -p $today_path
rsync -a ${archive}/${today_path}/ ${des_path}/${today_path}
cd ${des_path}/${today_path}
find . -type f -exec xz -d {} \;