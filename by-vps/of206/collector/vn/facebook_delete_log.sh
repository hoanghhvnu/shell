GROUP_LOG="/data/log/VN/GROUP"
PAGE_LOG="/data/log/VN/PAGE"
LIKE_LOG="/data/log/facebook/likes/vn"

DELETE_DATE_SUFFIX=$(date -d "-30 days" +%Y-%m-%d)
COMPRESS_DATE_SUFFIX=$(date -d "-2 days" +%Y-%m-%d)

# Delete old log
find $GROUP_LOG $PAGE_LOG $LIKE_LOG -name "*${DELETE_DATE_SUFFIX}*" -exec rm -f {} \;


# Compress old log
find $GROUP_LOG $PAGE_LOG $LIKE_LOG -name "*${COMPRESS_DATE_SUFFIX}*" -exec xz {} \;