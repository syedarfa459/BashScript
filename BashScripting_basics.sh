#!/bin/sh

###############################	Input Reading ###############################
#Getting input as a parameter while executing shell script

: '
#you need to execute script like this ./BashScripting.sh One Two Three Four
#$0=./BashScripting.sh $1=One $2=Two $3=Three $4=Four
echo $0 $1 $2 $3 $4
#getting number of arguments received including filename $0
echo $#
# "$#" tells the number of parameters
	'

: '
echo "Enter text: "
read text
echo "Entered text: $text"
	'

###############################	Output Script ###############################
: '
#suppose we need to store the ls content in an output file
ls -ltrh > outfile.txt
#the above line store the output of command ls -ltrh in file outfile.txt
	'

: '
#suppose you need to store table of 100 in file tableof100.txt
rm -r tableof100.txt
for i in {1..10}
do
	echo "100 x $i = $((100*i))" >> tableof100.txt
done
	'

: '
#similarly if you want to store tables of 1 to 10 in file tables.txt
rm -r tables.txt
for i in {1..10}
do
echo "######## TABLE OF $i ########" >> tables.txt
	for j in {1..10}
	do
	echo "$i x $j = $((i*j))" >> tables.txt
	done
done
	'

###############################	Multi-Line Comments ###############################
#for multi line comment we use : '   ' in bash scripting

#######################################################################
######################    Conditionals    #############################
#######################################################################


###############################	if else ###############################
: '
echo "Enter number: "
read num
if [[ $num%2 -eq 0 ]]
then
echo "$num is even"
else
echo "$num is odd"
fi 
	'

: '
count=90

if [ $count -gt 0 ] && [ $count -le 100 ]
then 
echo "Count= $count is between 0 and 100"
elif [[ $count -lt 0 ]]
then
echo "Count = $count is < 0"
else
echo "Unknown Count Value"
fi
   '
#echo "This is out of comment"

###############################	Case in Bash Script ###############################
#Inputting marks to get the grade of student in particular subject
: '
echo "Enter marks: "
read marks

case $marks in
	#this shows if marks are >=90 and <=100
	9[0-9]|100)
		echo "A grade";;
	8[0-9])
		echo "A- grade";;
	7[0-9])
		echo "B+ grade";;
	5[5-9]|6[0-9])
		echo "B grade";;
	5[0-4])
		echo "C grade";;
	4[0-9])
		echo "D grade";;
	*)
		echo "F grade";;
esac
	'
: '
#2nd method of doing the above thing
echo "Enter marks: "
read marks
case $((
  (marks >= 90 && marks <= 100)   * 1 +
  (marks > 80 && marks < 90)  * 2 +
  (marks >= 70 && marks < 79) * 3 +
  (marks >= 55 && marks <= 69) * 4 +
  (marks >= 50 && marks < 55) * 5 +
  (marks >= 40 && marks < 50) * 6
)) in
  (1) echo "A grade";;
  (2) echo "A- grade";;
  (3) echo "B+ grade";;
  (4) echo "B grade";;
  (5) echo "C grade";;
  (6) echo "D grade";;
  (0) echo "F grade";;
esac
	'
#######################################################################
######################    Loops    ####################################
#######################################################################

###############################	while loop ###############################

: '
num=10

while [[ $num -lt 20 ]]
do
echo "$num is < 20"
num=$((num+1))
done
	'

###############################	For loop ###############################
: '
for i in 1 2 3 4 5
do
echo "$i"
done
	'
: '
# {0..20} means starting from 0 and till 20th with by default increment of 1
for i in {0..20}
do
echo "$i"
done
	'

: '
# {0..100..5} means starting from 0 and till 100 with an increment of 5 in each iteration
for i in {0..100..5}
do
echo "$i"
done
	'
: '
# default method of using a for loop
for (( i=1 ; i<=100 ; i+=4 ))
do 
echo "$i"
done
	'

###############################	Until Loop ###############################
# It executes the statements as long as condition gets true. When condition gets true the loop terminates
: '
val=1000
until [[ $val -eq 1100 ]]
#condition is false and hence do till done block is executed
do
echo "value= $val, hence the above condition $val=1100 is false"
val=$((val+10))
done
#condition gets true false hence after done block is executed
echo "Until loop exits since the condition gets true"
	'

###############################	More about loops break,continue in shell scripting ###############################
: '
num={1,2,3,4,5}
for i in $num
do
echo "$i"
done
	'
######################## break ##########################
: '
num=1
for i in {1..20}
do
echo "$num"
if [[ $num -eq 5 ]]
then
break
fi
num=$((num+1))
done
echo "Loop exits because the number gets equal to 5"
	'

######################## continue ##########################
# Now suppose we want to skip and continue next iteration when i gets equal to 6/8 then we can do this using continue
: '
for i in {1..10}
do
if [[ $i -eq 6 || $i -eq 8 ]]
then
echo "See, when i=$i this iteration is skipped and next iteration is continued"
continue
fi
echo "$i"
done
	'

#######################################################################
######################    Scripts Communication    ####################################
#######################################################################

: '
#Make sure you 1st created Script2.sh with content "MESSAGE FROM Script1.sh is= $MYMESSAGE"

cat > Script1.sh << EOF

MYMESSAGE="HELLO THIS IS FROM Script1.sh"

export MYMESSAGE

./Script2.sh

EOF
	'
		

