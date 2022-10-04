cat wages.csv | tail -n +2 | cut -d , -f 1,2 | sort -t , -k 1 -k 2 -n | sed 's/,/ /g' > genExp.txt

echo "highest earner:"
cat wages.csv | tail -n +2 | sort -t , -k 4 -nr | cut -d , -f 1,2,4  | head -n 1

echo "lowest earner:"
 cat wages.csv | tail -n +2 | sort -t , -k 4 -n | cut -d , -f 1,2,4  | head -n 1 

echo "number of females in top ten earners:"
cat wages.csv | tail -n +2 | sort -t , -k 4 -nr | cut -d , -f 1,2,4  | head -n 10 | grep -c 'female'

min_wage_hs=$(cat wages.csv | cut -d , -f 3,4 | grep '12,' | sort -t , -k 2 -n | cut -d , -f 2 | head -n 1)

min_wage_c=$(cat wages.csv | cut -d , -f 3,4 | grep '16,' | sort -t , -k 2 -n | cut -d , -f 2 | head -n 1)

echo "effect of graduating college on min wage:"
echo "$min_wage_c - $min_wage_hs" | bc

