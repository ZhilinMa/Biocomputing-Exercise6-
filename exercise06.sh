# Usage: bash exercise06.sh


cat wages.csv | grep "male" | cut -d , -f 1,2 | sort -t , -k1,1d -k2n | sed "s/,/ /g" | uniq > uniqpeople.csv

echo " "
echo "Gender, Years of Experience, and Wage for the highest earner:"
cat wages.csv | grep "male" | cut -d , -f 1,2,4 | sort -V -k 3 -t , -r | head -n 1 | sed "s/,/ /g"

echo " "
echo "Gender, Years of Experience, and Wage for the lowest earner:"
cat wages.csv | grep "male" | cut -d , -f 1,2,4 | sort -V -k 3 -t , | head -n 1 | sed "s/,/ /g"

echo " "
echo "The number of females in the top ten earners:"
cat wages.csv | grep "male" | sort -V -k 4 -t , -r | head -n 10 | grep "female" | wc -l
echo " "

nongrad=$(cat wages.csv | cut -d , -f 3,4 | grep "12," | cut -d , -f 2 | sort -n | head -n 1)

grad=$(cat wages.csv | cut -d , -f 3,4 | grep "16," | cut -d , -f 2 | sort -n | head -n 1)

echo "The positive effect of graduating college on the minimum wage for earners (16 years of school vs. 12 years of school): "
echo "$grad - $nongrad" | bc
echo " "
