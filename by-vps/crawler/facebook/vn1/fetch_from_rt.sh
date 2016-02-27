#!/bin/bash
# Author: Hoanghh
# Last modified: 
# 
today_path=$(date +%Y/%m/%d -d "-0 days")
remote_src="/data/http/facebook/rt/${today_path}"
local_des="/data/http/fb/vn/comment/${today_path}"
if [ ! -d ${local_des} ];then
	mkdir -p ${local_des}
fi
scp hoanghh@rt-facebook.datasection.com.vn:${remote_src}/* ${local_des}