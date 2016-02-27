#!/bin/bash
# get data from vps
# Author: hoanghh
src="/data/http"
today_path=$(date +%Y/%m/%d)

cd ${src}/${today_path}
find . -type f -name "*.xz" -exec xz -d {} \;
