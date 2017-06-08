#!/bin/sh
for f in ../.. ; do
	#echo "$f"
	if [[ -d $f ]]; then 
		echo 'ok'
	else
		#htlatex ../../"$f"
		echo 'no'		
	fi
done