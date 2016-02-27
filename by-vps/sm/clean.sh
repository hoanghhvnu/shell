#!/bin/bash
# get data from vps
# Author: hoanghh
src="/data/http"
delete_path=$(date +%Y/%m/%d -d '-2 days')
rm -rf ${src}/${delete_path}

