cat wages.csv | grep -E -o '[a-z]+,[0-9]+' | sed -E 's/,/ /' | sort -k 1,1 -k 2,2n | uniq > genders.csv
echo "highest earner: $(cat wages.csv | sort -t ',' -k 4,4n | tail -n 1 | cut -d ',' -f1,2,4)"
echo "lowest earner: $(cat wages.csv | sort -t ',' -k 4,4n | head -n 2 | tail -n 1 | cut -d ',' -f1,2,4)"
echo "num high earning females: $(cat wages.csv | sort -t ',' -k 4,4n | tail -n 10 | grep -c 'female')"
var1=$(cat wages.csv | grep -E '[a-z]+,[0-9]+,12' | sort -t ',' -k 4,4n | head -n 2 | tail -n 1 | cut -d ',' -f4)
var2=$(cat wages.csv | grep -E '[a-z]+,[0-9]+,16' | sort -t ',' -k 4,4n | head -n 2 | tail -n 1 | cut -d ',' -f4)
echo "16 years of school lowest wage - 12 years of school lowest wage: $(echo "$var2 - $var1" | bc)"
