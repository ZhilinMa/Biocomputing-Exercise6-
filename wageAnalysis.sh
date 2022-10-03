# Usage: bash wageAnalysis.sh

# Unique combos: read file, delete first line, isolate gender and experience, sort by experience, move female and then male datapoints to output file
cat "wages (1).csv" | sed '1,1d' | cut -d, -f1,2 | sort -n  -t, -k2 | uniq | grep -w "female" > uniqueCombos.txt
cat "wages (1).csv" | sed '1,1d' | cut -d, -f1,2 | sort -n  -t, -k2 | uniq | grep -w "male" >> uniqueCombos.txt

# High and Low Earners: read file, limit to gender/experience/wage fields, sort by wage, extract lines with highest/lowest wage value, find ten highest wages and search for females
highestEarner=$(cat "wages (1).csv" | cut -d, -f1,2,4 | sort -n -t, -k3 | tail -n 1)
echo Highest Earner: $highestEarner

lowestEarner=$(cat "wages (1).csv" | sed '1,1d' | cut -d, -f1,2,4 | sort -n -t, -k3 | head -n 1)
echo Lowest Earner: $lowestEarner 

numFemales=$(cat "wages (1).csv" | sort -n -t, -k4 | tail -n 10 | grep -cw "female")
echo Number of females in the top ten earners: $numFemales

# Compare min wage: read file, limit to school/wage fields, isolate by 12 or 16 years of school, sort by wage, extract lowest wage
collegeGrad=$(cat "wages (1).csv" | cut -d, -f3,4 | grep "16," | sort -g -t, -k2 | cut -d, -f2 | head -n 1)
highSchool=$(cat "wages (1).csv" | cut -d, -f3,4 | grep "12," | sort -g -t, -k2 | cut -d, -f2 | head -n 1)
echo "Minimum Wage Difference (12 vs. 16 years of school):"
# Subtract high school min wage from college grad min wage
echo "$collegeGrad - $highSchool" | bc
