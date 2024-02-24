#!/bin/bash
# Site list
websites=("https://google.com" "https://facebook.com" "https://twitter.com" "https://www.ababagalamaga.com")
# Log file
logfile="site_stage.log"
# Cleaning up of log file
> "$logfile"
# Sites checking
for site in "${websites[@]}"
do
	x=$(curl -o /dev/null -L -s -w "%{http_code}\\n" "$site")
	if [ $x -eq 200 ]
	then
		echo "Site $site is UP" >> "$logfile"
	else
		echo "Site $site is DOWN" >> "$logfile"
	fi
done
# Result
echo "The result has been written to file "$logfile""
