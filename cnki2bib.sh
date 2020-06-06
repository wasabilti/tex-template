#!/bin/bash

# convert cnki cite format to bibtex format
# recommend to use pip3 install cnki2bib

IN_FILE=sample
IN_FILE_POST_FIX=str
OUT_FILE=cnki

# pre slove
echo '' > $IN_FILE.tmp.$IN_FILE_POST_FIX
sed -E 's/\[[0-9]+\]//g' $IN_FILE.$IN_FILE_POST_FIX >> $IN_FILE.tmp.$IN_FILE_POST_FIX
IN_FILE=$IN_FILE.tmp

echo '' > $OUT_FILE.bib

set Doctorial

while read line
do
	paper_type=$(echo $line | awk -F '[' '{print $2}'| awk -F ']' '{print $1}')
	if (( $paper_type == 'D')); then
		echo $line
		author_str=$(echo $line | awk -F '.' '{print $1}' | sed 's/,/ and /g')
		title_str=$(echo $line | awk -F '.' '{print $2}' | sed -E 's/\[[a-zA-Z]\]//g')
		school_str=$(echo $line | awk -F '.' '{print $3}' | awk -F ',' '{print $1}')
		year_str=$(echo $line | awk -F '.' '{print $3}' | awk -F ',' '{print $2}')
		echo 'author: '$author_str
		echo 'title: '$title_str
		echo 'school: '$school_str
		echo 'year: ' $year_str
	fi
done < $IN_FILE.$IN_FILE_POST_FIX
