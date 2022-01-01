#######################################################################
######################   Strings   ####################################
#######################################################################
: '
#Checking if strings match case sensitive match
echo "Enter string1"
read str1
echo "Enter string2"
read str2

if [[ $str1 == $str2 ]]
then
	echo "Both strings match"
else
	echo "Both strings don't match"
fi
	
	

#Checking if LENGTH OF strings match
echo "Enter string1"
read str1
echo "Enter string2"
read str2

if [ "$str1" \> "$str2" ]
then
	echo "Length of $str1 is smaller than $str2"
elif [ "$str1" \< "$str2" ]
then
	echo "Length of $str1 is larger than $str2"
else
	echo "Length of $str1 equals $str2"
fi
	'