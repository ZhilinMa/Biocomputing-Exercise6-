cat 'wages (1).csv' |cut -d , -f 1,2|sort -t, -n -k1| tr "," " "
