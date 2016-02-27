#!/bin/bash
# Author: hoanghh
# Date create: Sep 08, 2015
# Last modified: Sep 08, 2015
# Version: 0.1
# Script to get data from http (backup)

BASE_URL="http://test.datasection.com/vn_data"
year="2015"
month="09"




	
	mkdir -p "data/$year/$month"
	cd "data/$year/$month"

	for day in {01..30}
	do
		mkdir "$day"
		cd "$day"
		URL="$BASE_URL/$year$month/$day"
		#echo $URL
		wget $URL -O - | grep $year$month | grep -oE "2015[^>]*\.json\.tsv\.xz" | sort | uniq | while read link
		do
			#echo "$URL/$link" >> links.txt
			wget "$URL/$link"
			#break
		done

		cd ..

	done

