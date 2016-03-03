#!/bin/bash
# written by hoanghh
# send email report craw every day
cd /data/CrawlerReport
mail_to="hoanghh.vnu@gmail.com"
mail_from="Crawler Report<crawler-report@datasection.com.vn>"
news_path="news/news_CrawlerReportEveryday_123_sites.txt"
forum_path="forum/forum_CrawlerReportEveryday_28_sites.txt"

today=$(date +%Y/%m/%d)
title="Crawler Report daily [ $today ]";
yesterday_string=$(date +%Y%m%d -d "yesterday")
content="Dear all! This email was auto sent everyday to report about crawler.\nDo not reply.\n\nFor $yesterday_string (exactly craw date)"
total_news="vn_news: $(grep $yesterday_string ${news_path} | cut -f2)"
total_forum="vn_forum: $(grep $yesterday_string ${forum_path}| cut -f2)"
echo -e "$content\n$total_news\n$total_forum"  | mail -s "$title" -r "$mail_from" -a "${news_path}" -a "${forum_path}" "$mail_to"

