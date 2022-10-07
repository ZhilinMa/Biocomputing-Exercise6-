echo "Part 1 (highest earner):$file" 
cat 'wages (1).csv'| sort -t, -k4 -n| tail -n 1
echo "Part 2 (lowest earner): $file"
cat 'wages (1).csv'| sort -t, -k4 -n| head -n 2| tail -n 1 
echo "Part 3 (number of females in top 10): $file"
cat 'wages (1).csv'| sort -t, -k4 -n| tail  -n 10| grep "female" -w| wc -l
