#!/bin/bash
# get data from vps
# Author: hoanghh
forum_src="/data/http/forum/"
news_src="/data/http/news/wnvn-v2/"
facebook_src="/data/http/fb/vn/comment/"
src="/data/http/"
today_path=$(date +%Y/%m/%d)
mkdir -p ${src}${today_path}
rsync -az news:/${news_src}${today_path}/ ${src}${today_path}
rsync -az forum:/${forum_src}${today_path}/ ${src}${today_path}
rsync -az facebook:/${facebook_src}${today_path}/ ${src}${today_path}