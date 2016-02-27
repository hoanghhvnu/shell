today=$(date +%Y/%m/%d)
index_dir="/data/project/elasticsearch/indexer"
config_file=$(date +%Y_%m)".json"
comment_path="/data/ArchiveData/vn/facebook/comment/${today}"

cd $index_dir

java -jar ESIndexer.jar conf/main/interaction_page_scope/$config_file conf/main/user_scope/config.json  conf/main/interaction_page_scope/log4j.properties $comment_path


java -jar ESIndexer.jar conf/main/interaction_post_scope/$config_file conf/main/interaction_post_scope/log4j.properties $comment_path

# for like: late 3 days
config_file=$(date +%Y_%m -d '-3 days')".json"
_3_days_ago=$(date +%Y/%m/%d -d '-3 days')
like_path="/data/ArchiveData/vn/facebook/like/${_3_days_ago}"
java -jar ESIndexer.jar conf/main/interaction_page_scope/$config_file conf/main/user_scope/config.json conf/main/interaction_page_scope/log4j.properties $like_path
