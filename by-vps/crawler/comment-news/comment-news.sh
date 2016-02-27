today_path=$(date +%Y/%m/%d)
today_hyphen=$(date +%Y-%m-%d)
mkdir -p ${today_path}

java -jar CrawlComment.1.jar ${today_path}/${today_hyphen}.news.comment.tsv