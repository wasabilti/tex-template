#!/bin/bash

# Use xelatex to complie .tex file

FILENAME=analyse_report

xelatex $FILENAME.tex
open $FILENAME.pdf
