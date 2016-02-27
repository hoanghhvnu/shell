goal_day=`date +%Y-%m-%d -d "-1 days"`
like_data="/data/facebook/likes/vn/"
cd $like_data
total_like=$(find . -type f -name "$goal_day*.tsv" -exec cat {} \; | wc -l)
comment_data="/data/VN"
cd $comment_data
total_comment=$(find PAGE GROUP -type f -name "$goal_day*.tsv" -exec cat {} \; | wc -l)

echo -e "This is result craw data for $goal_day\nTotal line: $total_like\nTotal_comment: $total_comment" | mail -s "[Report] Facebook crawler for $goal_day" hoanghh.vnu@gmail.com