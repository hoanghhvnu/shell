today=$(date +%Y/%m/%d)
index_dir="/data/project/elasticsearch/indexer"
cd $index_dir && java -jar FacebookElasticSearchIndexer-0.1.12.1.jar conf/main/scope_interaction_2015_08.json conf/main/raw_scope_user.json conf/main/log4j.properties /data/http/fb/vn/$today
cd $index_dir && java -jar FacebookElasticSearchIndexer-0.1.12.1.jar conf/main/scope_interaction_2015_08.json conf/main/raw_scope_user.json conf/main/log4j.properties /data/backup/facebook/vn/$today