#media="sns_vn"
media="forum_vn"
#media="news_vn"
days_past="-3 days"
if [ ! -z "$1" ]; then
	days_past="$1 days"
fi
since_date=$(date +%Y-%m-%d -d "${days_past}")


until_date=$(date +%Y-%m-%d)

format_type="csv"
#format_type="json"
#format_type="tsv"
echo "Range Time (GMT+7) from ${since_date} to ${until_date}"
for media in "sns_vn" "forum_vn"  "news_vn"
do
	echo "Media: \"${media}\""
	curl "http://210.188.228.88/stw/solr/dummy/select/?source=ii_vn_monitor&facet=true&facet.mincount=0&facet.limit=-1&facet.range=pubdate&f.pubdate.facet.range.start=${since_date}T17%3A00%3A00Z&f.pubdate.facet.range.end=${until_date}T16%3A59%3A59Z&facet.sort=index&facet.field=tag-pubdate&q=%28media%3A${media}%29&wt=${format_type}"
done