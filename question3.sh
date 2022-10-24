var1=`cat 'wages (1).csv' | cut -d, -f  3,4 | grep 12,| cut -d, -f 2| sort -t, -n| head -n 1`
var2=`cat 'wages (1).csv' | cut -d, -f  3,4 | grep 16,| cut -d, -f 2|sort -t, -n| head -n 1`
echo "$var2 - $var1" | bc
