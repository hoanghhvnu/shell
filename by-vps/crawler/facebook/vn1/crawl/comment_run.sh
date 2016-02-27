cd /data/Application/Facebook4jCrawler && /usr/local/bin/java -jar Facebook4jCrawler.jar conf/main/comment/fanpage/config.json conf/main/comment/fanpage/log4j.properties postid 2>&1 >> ~/cron_log/crawl.log &
sleep 5
cd /data/Application/Facebook4jCrawler && /usr/local/bin/java -jar Facebook4jCrawler.jar conf/main/comment/group/00/config.json conf/main/comment/group/00/log4j.properties postid 2>&1 >> ~/cron_log/crawl.log &
sleep 5
cd /data/Application/Facebook4jCrawler && /usr/local/bin/java -jar Facebook4jCrawler.jar conf/main/comment/group/01/config.json conf/main/comment/group/01/log4j.properties postid 2>&1 >> ~/cron_log/crawl.log &
