# 1 - gender/years
cat wages.csv | cut -d , -f 1,2 | sed 's/,/ /g' | sort -t  , -k 1 -k 2 > gender-yearsExperience.txt

# 2.1 - highest earner
echo "Highest Earner:"
cat wages.csv | sort -t , -k 4 -nr | cut -d, -f 1,2,4 | head -n 1
echo ""

# 2.2 - lowest earner
echo "Lowest Earner:"
cat wages.csv | sort -t , -k 4 -n | cut -d, -f 1,2,4 | head -n 1
echo ""

# 2.3 - lowest earner
echo "Number of Females in Top 10 Earners"
cat wages.csv | sort -t , -k 4 -nr | cut -d, -f 1,2,4 | head -n 10 | grep -c 'female'
echo ""

# 3 - college vs hs

wage_hs=$(cat wages.csv | cut -d , -f 3,4 | grep '12,' | sort -t , -k 2 -n | cut -d , -f 2 | head -n 1)

wage_c=$(cat wages.csv | cut -d , -f 3,4 | grep '16,' | sort -t , -k 2 -n | cut -d , -f 2 | head -n 1)

echo "Effect of Graduating College on Min Wage:"
echo "$wage_c - $wage_hs" | bc

