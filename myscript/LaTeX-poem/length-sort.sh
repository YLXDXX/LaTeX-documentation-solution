cat $1 | awk '{ print length, $0 }' | sort -n -s | cut -d" " -f2- 
