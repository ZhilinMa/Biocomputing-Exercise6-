#Usage: cat file|bash exercise6.sh

#Q1
#Write a file containing unique gender/years experience (cut -d, -f 1,2|...|uniq > gender_and_experience.txt)
#Replace the commas with a space (sed 's/,/ /g')
#Sort rows by gender, then by years experience; keep pairings intact (sort -t, -k1,1 -k2,2n)


cut -d, -f 1,2|tail +2|sort -t, -k1,1 -k2,2n|sed 's/,/ /g'|uniq > gender_and_experience.txt
#opens that file
cat gender_and_experience.txt

#Q2
#Return following to stdout
#Gender, years experience, wage (highest earner) (max)
#Gender, years experience, wage (lowest earner) (min)
#Number of females in top 10 earners


#Q3
#Return following to stdout
#Effect of graduating college on minimum wage of dataset
	#12 years v. 16 years of school

#Assign output variable to min (12), and min (16)
#Calculate difference from the values using bc


