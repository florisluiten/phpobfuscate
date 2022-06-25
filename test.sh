#!/usr/bin/env sh

exitCode=0

for f in *.php; do
	code="echo $(cat $f)"
	output=$(php -derror_reporting=0 -r "$code")
	expected=$(basename $f .php)

	if LC_ALL=c grep -q '[A-Za-z0-9 ]' $f; then
		exitCode=1
		echo
		echo "Failed! File '$f' contains alphanumerical character"
		echo
	elif [ "$output" != "$expected" ]; then
		exitCode=1
		echo
		echo "Failed! Expected '$expected', got '$output' instead"
		echo
	else
		echo -n '.'
	fi
done

echo

exit $exitCode
