#!/bin/bash

# Sebstastian Claus <sc@inferum.net>
# Date: Tue 19 Feb 2013 01:58:50 CET
# License: public domain
# Warranty: none.
# Description: gets the data from
#  http://deron.meranda.us/data/
# dependencies: curl, gzip, sed

# URLs
LAST_URL="http://deron.meranda.us/data/census-dist-all-last.txt.gz"
FEM_URL="http://deron.meranda.us/data/census-dist-female-first.txt"
MAL_URL="http://deron.meranda.us/data/census-dist-male-first.txt"

# Outputfiles
LAST="last.txt.gz"
FEM="first-female.txt.gz"
MAL="first-male.txt.gz"


echo Fetching female first names...
curl -# $FEM_URL|sed -r 's/(.)(\w*).*/\1\L\2/' |gzip -c > $FEM

echo Fetching male first names...
curl -# $MAL_URL|sed -r 's/(.)(\w*).*/\1\L\2/' |gzip -c > $MAL

echo Fetching last names...
curl -# $LAST_URL|gunzip -c|sed -r 's/(.)(\w*).*/\1\L\2/' |gzip -c > $LAST
