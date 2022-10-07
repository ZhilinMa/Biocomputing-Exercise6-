#Usage: bash exercise6.sh file
#Q1
#Write a file containing unique gender/years experience (cut -d, -f 1,2|...|uniq > gender_and_experience.txt)
#Replace the commas with a space (sed 's/,/ /g')
#Sort rows by gender, then by years experience; keep pairings intact (sort -t, -k1,1 -k2,2n)


cat $1|cut -d, -f 1,2|tail +2|sort -t, -k1,1 -k2,2n|sed 's/,/ /g'|uniq > gender_and_experience.txt
#line below opens that file to verify, delete "#" to check
#cat gender_and_experience.txt

#Q2
#Return following to stdout
#Gender, years experience, wage (highest earner) (max)
#Gender, years experience, wage (lowest earner) (min)
#Number of females in top 10 earners


#isolate how many of top 10 earners are female
echo "Number of females in Top 10 earners:"
cat $1|sort -t, -k4rn|head -n +10|grep -a "female"|wc -l
#isolate highest earner
echo "Highest earner statistics"
cat $1|head -n +1| cut -d, -f 1,2,4
cat $1|sort -t, -k4rn|head -n +1|cut -d, -f 1,2,4
#isolate lowest earner
echo "Lowest earner statistics"
cat $1|head -n +1| cut -d, -f 1,2,4
cat $1|sort -t, -k4n|head -n +2|tail -n -1|cut -d, -f 1,2,4

#Q3
#Return following to stdout
#Effect of graduating college on minimum wage of dataset
	#12 years v. 16 years of school

#Assign output variable to min (12), and min (16)
#Calculate difference from the values using bc

echo "Difference between 16 years and 12 years minimum wage"
min12=$(cat $1|cut -d, -f 3,4|grep -E "^12"|sort -t, -nk 2|cut -d, -f 2|head -n 1)
min16=$(cat $1|cut -d, -f 3,4|grep -E "^16"|sort -t, -nk 2|cut -d, -f 2|head -n 1)
echo "$min16 - $min12"|bc

