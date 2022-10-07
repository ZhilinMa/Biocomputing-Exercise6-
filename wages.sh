#usage bash wages.sh
cat *.csv | cut -d, -f 1,2 | sort -t, -k 1 | uniq > gender-yearsExperience.csv

cat *.csv | cut -d, -f 1,2,4 | sort -t, -k 4 -n | tail -n $1 > 
highestearner.csv
cat highestearner.csv 

cat *.csv | cut -d, -f 1,2,4 | sort -t, -k 4 -n | head -n $1 > 
lowestearner.csv
cat lowestearner.csv

cat *.csv | cut -d, -f 1,4 | sort -t, -k 4 -n | tail -n 1-10 > top10.csv
cat *top10.csv | grep female | wc -l

highschool=$cat *.csv | cut -d, -f 3,4 | sort -t, -k 4 -n | grep 12
college=$cat *.csv | cut -d, -f, 3,4 | sort -t, -k 4 -n | grep 16
echo $college - $highschool | bc
