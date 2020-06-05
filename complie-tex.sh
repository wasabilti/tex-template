#!/bin/bash

# Use xelatex to complie .tex file
# Type :! ./complie.sh under vim can auto complie .tex file use xelatex complier and auto call prewview under macos to view .pdf file
# Edit FILENAME var before use this script

FILENAME=analyse_report

xelatex $FILENAME.tex
open $FILENAME.pdf
