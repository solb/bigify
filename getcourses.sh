#!/bin/bash

API="http://schedule.csh.rit.edu/entity"
ACCEPT="Accept: application/json"
TERM="term=20151"
FILE="courses.txt"

function cshapi {
	DATA="$1"
	ROUTE="$2"
	curl -X POST -H "$ACCEPT" --data "$TERM&$DATA" -s "$API/$ROUTE"
}

JSON=$(cshapi "" getSchoolsForTerm)
SCHOOLS=$(jq -r '.[].id' <<<$JSON)

for SCHOOL in $SCHOOLS
do
	JSON=$(cshapi "school=$SCHOOL" getDepartments)
	DEPTS="${DEPTS} $(jq -r '.departments [].id' <<<$JSON)"
done

for DEPT in $DEPTS
do
	JSON=$(cshapi "department=$DEPT" getCourses)
	COURSES="$(jq -r '.courses [].title' <(echo $JSON))"
	for COURSE in "$COURSES"
	do
		echo "$COURSE" >> "$FILE"
	done
done
