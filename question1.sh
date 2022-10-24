cat 'wages (1).csv' |cut -d , -f 1,2|sort -t, -n -k1| tr "," " "
#you should get a unique gender-yearsExperience combinations here, so add -u to your sort
#cat wages.csv | grep -v gender | cut -d , -f 1,2 | sort -u | tr ',' ' ' | sort -k1,1d -k2,2n >> categories.txt
