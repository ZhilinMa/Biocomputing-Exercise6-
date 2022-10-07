#Usage: pass the name of the wages.csv file as an argument

#the first line takes the file, isolates all the female entries, 
#sorts by the second column (years experience), isolates the first 2 columns, 
#removes any non-unique entries, replaces the comma with a space, and creates/overwrites a file and puts that info it in.
cat "$1" | grep "female" |sort -n  -t , -k 2 | cut -d, -f 1,2 | uniq | tr "," " " > gender_yearsExp.txt

#the second line does the same thing as the first except directly after cating it removes all the female entries and then
#isolates male entries (since grep "male" would give all the female entries too).  It also appends to the file created in 
#line 1 instead of overwriting it
cat "$1" | grep -v "female" | grep "male" |sort -n  -t , -k 2 | cut -d, -f 1,2 | uniq | tr "," " " >> gender_yearsExp.txt

#these lines take the file, sort it by highest wage, and display both the message "highest wage earner:" and the first line
#of the file, which is the highest wage earner
echo "Highest Wage Earner:"
cat "$1" | sort -n -r -t , -k 4 | head -n 1 

#these lines take the file, sort it by lowest wage, and display both the message "lowest wage earner:" and the 2nd line
#of the file, which is the lowest wage earner (the first line in this sort is the column titles line)
echo "Lowest Wage Earner:"
cat "$1" | sort -n -t , -k 4 | head -n 2 | tail -n 1 

#these lines take the file, sort it by the top earners (4th column), find the top ten, find all the females in top 10,
#and counts them
echo "Number of Females in Top Ten Earners:"
cat "$1" | sort -n -r -t , -k 4 | head -n 10 | grep "female" | wc -l

#this line isolates those with 12 yrs school, isolates the fourth column, sorts to find the lowest wage, and stores it
#as a variable
min_hs_wage=$(grep "\d\,12\,\d" "$1" | cut -d , -f 4 | sort -n | head -n 1)

#this line isolates those with 16 yrs school, isolates the fourth column, sorts to find the lowest wage, and stores it  
#as a variable
min_col_wage=$(grep "\d\,16\,\d" "$1" | cut -d , -f 4 | sort -n | head -n 1)

#these lines announce that the college/HS min wage difference is being displayed and then subtracts the min HS wage
#variable from the min college wage variable and displays the result
echo "The difference in minimum wage between those with a college and high school degree is:" 
echo "$min_col_wage - $min_hs_wage" | bc
