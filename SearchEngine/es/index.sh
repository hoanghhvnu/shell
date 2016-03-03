today_path=$(date +%Y/%m/%d)
index_dir="/data/project/elasticsearch/indexer"
today_config=$(date +%Y_%m)".json"
comment_path="/data/ArchiveData/vn/facebook/comment/${today_path}"

cd $index_dir

java -jar ESIndexer.jar conf/main/interaction_page_scope/${today_config} conf/main/user_scope/config.json  conf/main/interaction_page_scope/log4j.properties $comment_path



# for like: late 3 days
like_config=$(date +%Y_%m -d '-3 days')".json"
_3day_path=$(date +%Y/%m/%d -d '-3 days')
like_path="/data/ArchiveData/vn/facebook/like/${_3day_path}"
java -jar ESIndexer.jar conf/main/interaction_page_scope/${like_config} conf/main/user_scope/config.json conf/main/interaction_page_scope/log4j.properties $like_path


java -jar ESIndexer.jar conf/main/interaction_post_scope/${today_config} conf/main/interaction_post_scope/log4j.properties $comment_path &