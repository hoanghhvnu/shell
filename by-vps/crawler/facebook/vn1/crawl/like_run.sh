### Like
cd /data/Application/Facebook4jCrawler && /usr/local/bin/java -cp Facebook4jCrawler.jar dsvn.like.LikeRunner conf/main/like/fanpage/config.json conf/main/like/fanpage/log4j.properties &
sleep 5
cd /data/Application/Facebook4jCrawler && /usr/local/bin/java -cp Facebook4jCrawler.jar dsvn.like.LikeRunner conf/main/like/group/00/config.json conf/main/like/group/00/log4j.properties &
sleep 5
cd /data/Application/Facebook4jCrawler && /usr/local/bin/java -cp Facebook4jCrawler.jar dsvn.like.LikeRunner conf/main/like/group/01/config.json conf/main/like/group/01/log4j.properties &