#task 1
#Write a file containing the unique gender-yearsExperience combinations
cat wages.csv | cut -d, -f 1,2 |sed 's/,/ /g'|sort -k 1,1 -k 2,2n| uniq > gender-year.txt
#task 2
#return the gender, yearsExperience and wage for the hignest earner, the least eariner and number of females in 
#the top 10 earners
cat wages.csv |sort -k 4 -t , -n |tail -n 1|cut -d , -f 1,2,4
cat wages.csv |sort -k 4 -t , -n |head -n 2|tail -n 1|cut -d , -f 1,2,4
cat wages.csv |sort -k 4 -t , -nr |head -n 11|grep "female"|wc -l
#task 3
#return the effect of the graduating college(12 vs 16 years of school)
A=$(cat wages.csv|cut -d , -f 3,4|grep -w 12|sort -k 2 -t , -nr|tail -n 1|cut -d , -f 2)
B=$(cat wages.csv|cut -d , -f 3,4|grep -w 16|sort -k 2 -t , -nr|tail -n 1|cut -d , -f 2)
echo "$B - $A" | bc
