#Part A Unique gender and yearExperience combinations.

cat wages.csv | tail +2 | cut -d, -f 1,2 |  sort -t, -k 1,1  -k 2,2n | sed 's/,/ /g' | uniq > unique_genderyearExperience.txt

#Part B Unique gender and yearExperience combinations.

echo Highest Earner
cat wages.csv | cut -d, -f 1,2,4 | sort -t, -k 3 -n | tail -n 1

echo Lowest Earner
cat wages.csv | cut -d, -f 1,2,4 | sort -t, -k 3 -n | head -n 2 | tail -n 1

echo Females in Top 10
cat wages.csv | sort -t, -k 4 -n | tail -n 10 | grep female | wc -l

#Part C Graduating college effect on minimum wage

minwage12 = $(cat wages.csv | cut -d , -f 3,4 | grep 12, | sort -t, -k 2 -n | head -n 1  | cut -d, -f 2)

minwage16 = $(cat wages.csv | cut -d , -f 3,4 | grep 16, | sort -t, -k 2 -n | head -n 1  | cut -d, -f 2)
echo “$minwage16 - $minwage12” | bc
