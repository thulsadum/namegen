#!/bin/bash

# Sebstastian Claus <sc@inferum.net>
# Date: Mon 18 Feb 2013 21:58:09 CET
# License: CC - BY
# Warranty: none. best case: do not use this.
# Description: A random name generator.
# Version: 0.1

###############
## CHANGELOG ##
###############
# 0.1(2013-02-19): initial release

############
## CONFIG ##
############

# female first names
FIRST_FEM_LIST="first-female.txt.gz"

# male first names
FIRST_MAL_LIST="first-male.txt.gz"

# last names
LAST_LIST="last.txt.gz"

# sources (output to stdout) of the lists
FEM="zcat $FIRST_FEM_LIST"
MAL="zcat $FIRST_MAL_LIST"
LST="zcat $LAST_LIST"

###
## CONFIG END
###


### NO CHANGES BELOW THIS LINE ###
##################################

FIRSTS="$(mktemp)"
LASTS="$(mktemp)"

# female [f], male [m], both [b]
GENDER="b"

NUM=10

SPLIT=0

[ -n "$1" ] && NUM="$1"
[ -n "$2" ] && GENDER="$2"

[ "$GENDER" == "b" ] && SPLIT=$(($RANDOM % ($NUM + 1)))

case $GENDER in
	b)
		$FEM|shuf -n $SPLIT|nl >> $FIRSTS
		$MAL|shuf -n $(($NUM - $SPLIT))|nl -v $(($SPLIT + 1)) >> $FIRSTS
		;;
	m)
		$MAL|shuf -n $NUM|nl >> $FIRSTS
		;;
	f)
		$FEM|shuf -n $NUM|nl >> $FIRSTS
		;;
esac

$LST | shuf -n $NUM | nl > $LASTS

join $FIRSTS $LASTS | cut -d' ' -f2-
