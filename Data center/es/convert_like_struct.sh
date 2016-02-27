# Convert 1-1 url-like to 1-n url-like
# Author: HoangHH

# Convert from xz 
lamluon() {
        src_file="$1"
        cp ${src_file} .
        src_file=$(echo ${src_file} | awk -F '/' '{print $NF}')
        xz -d ${src_file}
        src_file=${src_file%.xz}
        des_file="${src_file}.ok"
        java -cp ESIndexer8-0.0.11.jar dsvn.helper.LikeConvert ${src_file} out.tmp log4j.properties 5000
        cat out.tmp | sort -k1,1 > input2.tmp
        rm -f out.tmp
        mkdir $(date +%Y%m)
        java -cp ESIndexer8-0.0.11.jar dsvn.helper.LikeConvert input2.tmp $(date +%Y%m)/${des_file} log4j.properties 5000
        rm -f input2.tmp
}
month=$(date +%m -d "-1 month")
for i in {01..31}
do
        for section in "fanpage" "group"
        do
                src="/data/ArchiveData/vn/facebook/like/2015/${month}/${i}/2015${month}${i}.002000e.vn-00.likes.snsvn-${section}-v1.0.3.UTF-8.+0700.format1.sns.json.tsv.xz"
                lamluon $src
        done
done
