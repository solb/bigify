BASH=/usr/bin/bash

courses-Bigger.txt: courses-Big.txt
	$(BASH) foundationsandfundamentalsandintroductionsandprinciplesohmy.sh $< $@

courses-Big.txt: courses.txt
	$(BASH) ify.sh Big

courses.txt:
	$(BASH) getcourses.sh
