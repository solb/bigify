#!/bin/sh

cp "$1" "$2"
sed -i 's/\(Big\) \(Foundation of\|Fundamentals of\|Found of\|Introduction to\|Intro to\|Principles of\|Princ of\)/\2 \1/' "$2"
