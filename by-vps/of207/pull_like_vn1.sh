today=$(date +%Y/%m/%d)
for section in "like"
do
    DES_DIR="/data/ArchiveData/vn/facebook/${section}/$today"
    mkdir -p ${DES_DIR}

    scp -r dsvn@vn1.in.datasection.com:/data/http/fb/vn/${section}/$today/* ${DES_DIR}/
done