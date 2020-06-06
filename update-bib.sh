#!/bin/bash

# save reference .bib file here seperated
REF_DIR=./ref.d
REF_FILENAME=ref

cat $REF_DIR/* > $REF_FILENAME.bib
