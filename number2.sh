# Laurel Lown

# Question Number 1
# To sort file by gender and yearsExperience, then create .txt file with gender and yearsExperience
# usage: cat file_name | bash number2.sh
cat wages.csv | sed 's/,/ /g' | cut -d ' ' -f 1,2 | sort -u -t ' ' -k1,1 -k2,2n > gender_yearsExperience.txt

# Question 2, Part 1
# To sort wages.csv file by gender and yearsExperience, plus display the highest wage
# usage: cat file_name | bash number2.sh
cat wages.csv | sed 's/,/ /g' | cut -d ' ' -f 1,2,4 | sort -u -t ' ' -k3n | tail -n 1

# Question 2, Part 2
# To sort wages.csv file by gender and yearsExperience, plus display the lowest wage
# usage: cat file_name | bash number2.sh
cat wages.csv | sed 's/,/ /g' | cut -d ' ' -f 1,2,4 | sort -u -t ' ' -k3n | head -n 1

# Question 2, Part 3
# To sort wages.csv to find the number of females in the top 10 earners
# usage: cat file_name | bash number2.sh
cat wages.csv | sed 's/,/ /g' | cut -d ' ' -f 1,4 | sort -u -t ' ' -k2n | tail -n 10 | grep female | wc -l

# Question 3
# Will display the effect of graduating college on the minimum wage for earners 
# included in the wages.csv file
# usage: cat file_name | bash number 2.sh
collegedegree=$(cat 'wages.csv' | cut -d , -f 3,4 | sed 's/,/ /g' | grep -E "16" | cut -d ' ' -f 2 | sort -n | head -n 1)
nocollege=$(cat 'wages.csv' | cut -d , -f 3,4 | sed 's/,/ /g' | grep -E "12" | cut -d ' ' -f 2 | sort -n | head -n 1)
echo "$collegedegree - $nocollege" | bc


# NOTE: I named my shell script number2.sh which is why it is displayed like this
# in the usages.
