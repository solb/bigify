#!/bin/bash

while read COURSE
do
	echo "$1 $COURSE" >> "courses-$1.txt"
done < courses.txt
