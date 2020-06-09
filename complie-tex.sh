#!/bin/bash

# Use xelatex to complie .tex file
# Type :! ./complie.sh under vim can auto complie .tex file use xelatex complier and auto call prewview under macos to view .pdf file
# Edit FILENAME var before use this script

FILENAME=analyse_report
set INCLUDE_BIBTEX;

if [ -f $FILENAME.tex ]; then
	xelatex $FILENAME.tex
	if [ $INCLUDE_BIBTEX ]; then
		bibtex $FILENAME.aux
		xelatex $FILENAME.tex
		xelatex $FILENAME.tex
	fi
	open $FILENAME.pdf
else
	echo -e 'File '$FILENAME 'does not exist! \nPlease check whether file exist or change FILENAME var to fit your .tex file' >&2
fi
