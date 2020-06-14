#!/bin/bash

# Use xelatex to complie .tex file
# Type :! ./complie.sh under vim can auto complie .tex file use xelatex complier and auto call prewview under macos to view .pdf file
# $1 some function
#	clean: clean tmp file like .log .aux ...
#	filename: indicate your specific filename to be complie or use the default filename below

# Some extra function of this script
# Check whether clean tmp file
if [ $1 = 'clean' ]; then
	rm *.aux
	rm *.bbl
	rm *.blg
	rm *.log
	rm *.toc
	exit 0
fi

# Edit FILENAME var before use this script
if [ ! $1 ]; then
	# This is the default filename
	FILENAME=survey_report
else
	FILENAME=$1;
fi

# Whether complie reference file
# Will take more time
# Comment this line if you don't need complie reference from bibtex
set INCLUDE_BIBTEX;

# Start complie
# First check whether source file exist
if [ -f $FILENAME.tex ]; then
	xelatex $FILENAME.tex
	if [ INCLUDE_BIBTEX ]; then
		bibtex $FILENAME.aux
		xelatex $FILENAME.tex
		xelatex $FILENAME.tex
	fi
	# Open .pdf file use viewer under MacOS
	open $FILENAME.pdf
else
	echo -e '==> File '$FILENAME 'does not exist! \n==> Please check whether file exist or change FILENAME var to fit your .tex file' >&2
	echo -e '\n==> '$0 ' clean: to clean tmp file\n==> '$0 'filename: to complie your specific source code or edit this script to indicate the default filename to your source code'
fi
