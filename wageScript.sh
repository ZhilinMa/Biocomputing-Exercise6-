#Write a file containing the unique gender-yearsExperience combinations contained in the file “wages.csv”.
#The file you create should contain gender in the first column and yearsExperience in a second column
#with a space separating the two columns. The rows should be sorted first by gender and then by
#yearsExperience, but remember to keep the pairings in a given row intact. Don’t worry about column
#names in the output file.

cat wages.csv | sed '1d' | cut -d , -f 1,2 | sort -t , -k1,1 -k2n | uniq | tr ',' ' ' > uniqueGenderYrsExp.txt 
echo "unique gender and years experience combos output to text file"

#Return the following information to stdout when the shell script is executed: 1) the gender, yearsExpe-
#rience, and wage for the highest earner, 2) the gender, yearsExperience, and wage for the lowest earner,
#and 3) the number of females in the top ten earners in this data set. Be sure to indicate, which output
#is which when returning them to stdout.

echo "Highest Earner (Gender, YearsExperience, Wage):"
cat wages.csv | sed '1d' | cut -d , -f 1,2,4 | sort -t , -k3n |  uniq | tail -n 1

echo "Lowest Earner (Gender, Years Experience, Wage):"
cat wages.csv | sed '1d' | cut -d , -f 1,2,4 | sort -t , -k3n |  uniq | head -n 1

echo "Number of Women in Top 10 Earners in Data Set"
cat wages.csv | sed '1d' | cut -d , -f 1,2,4 | sort -t , -k3n |  uniq | tail -n 10 | grep -wc "female"  


#Return one more piece of information to stdout: the effect of graduating college (12 vs. 16 years of
#school) on the minimum wage for earners in this dataset. Two hints: 1) you can assign the output
#of a pipeline to a variable with this code variable_name=$(code), where variable_name can be any
#name of your choosing and “code” represents a Linux pipeline, and 2) you can assign numeric values to
#variables and then us the command bc to do simple arithmetic. If you’ve defined two shell variables
#(val1 and val2) that are decimal values you can subtract them with the following code: echo "$val1
#- $val2" | bc . If using bc doesn’t work on your system, test your code up to this last step and then
#add the line necessary to calculate the difference on a system that can use the bc method given above
#to your script.

no_college_min=$(cat wages.csv | sed '1d' | cut -d , -f 3,4 | grep -E "[0-9|11|12]," | cut -d , -f 2 | sort -n | head -n 1)
grad_min=$(cat wages.csv | sed '1d' | cut -d , -f 3,4 | grep -E "16," | cut -d , -f 2 | sort -n | head -n 1)
diff=$(echo "$grad_min - $no_college_min" | bc )
echo "Finishing college raises a worker's minimum wage from \$$no_college_min to \$$grad_min, a \$$diff difference! "
 
