#Usage: cat file|bash exercise6.sh

#Q1
#Write a file containing unique gender/years experience
#Replace the commas with a space
#Sort rows by gender, then by years experience; keep pairings intact
#Saves file as gender_and_experience.txt

cut -d, -f 1,2 > gender_and_experience.txt
cat gender_and_experience.txt|tail +2|sort -t, -k2n

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


