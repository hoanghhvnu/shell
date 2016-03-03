while true
do
                count=$(ps aux | grep "[j]ava -jar ESIndexer.jar" | wc -l)
                
                if [ ${count} -eq 0 ]; then
                        sudo /data/crontab/fbid/push_convert.sh &
                        break
                fi
        echo "$(date)  ${src_dir}, sleep 60s..." >> /data/project/elasticsearch/indexer/wait.log
        sleep 300
done
