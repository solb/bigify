BASH=/usr/bin/bash

courses-Big.txt: courses.txt
	$(BASH) ify.sh Big	

courses.txt:
	$(BASH) getcourses.sh
