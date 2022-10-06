#Exercise 06 Shell Script

#Andrew Lupinski

#This script will execute three different commands describe below
#This script works for the file wages.csv
#This script will generate 1 .txt file and 4 lines sent to stdout
#The first 3 lines in stdout will fufill part 2 of the problem set and the final line of stdout will fufill part 3

#Usage: bash exersise06.sh 

#Part 1) Using wages.csv, create a file called gender-yearsExperience.txt that contains a lsit of unique employee
#genders and unique years of experinece.
#This unique list is sorted by gender then years of experince

cat 'wages (1).csv' | grep -E "(female|male)" | cut -d , -f 1,2 | sed -E s'/,/ /g'| sort -u -t ' ' -k 1,1 -k 2,2n >gender-yearsExperience.txt

#Part2) Three Pipelines that will return 3 values to stdout
# Line 1 with output the gender, years experinece, wage of employee with highest wage
# Line 2 will output the gender, years experinece, wage of lowest earner
# Lines 3-12 will be the top 10 women earners 

cat 'wages (1).csv' | grep -E "(female|male)" | cut -d , -f 1,2,4 | sed -E s'/,/ /g' | sort -t ' ' -k 3n | tail -n 1

cat 'wages (1).csv' | grep -E "(female|male)" | cut -d , -f 1,2,4 | sed -E s'/,/ /g' | sort -t ' ' -k 3n | head -n 1

cat 'wages (1).csv' | cut -d , -f 1,4 | sed -E s'/,/ /g' | sort -t ' ' -k 2n | tail -n 10 | grep "female" | wc -l

#Part3) Command to output the difference in minimum salary between employees with 16 years of school vs 12
#The variable "collegedegree" represents employees with 16 years of school
# The variable "nocollege" represents employees with 12 years of school
# The final line to stdout is the numeric difference between the lowest college earner and the lowest non college earner

collegedegree=$(cat 'wages (1).csv' | cut -d , -f 3,4 | sed -E 's/,/ /g' | grep -E "16 " | cut -d ' ' -f 2 | sort -n | head -n 1 )

nocollege=$(cat 'wages (1).csv' | cut -d , -f 3,4 | sed -E 's/,/ /g' | grep -E "12 " | cut -d ' ' -f 2 | sort -n | head -n 1)

echo "$collegedegree - $nocollege" | bc 


