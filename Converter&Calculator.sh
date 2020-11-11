#!/bin/sh
clear
echo "Input.dat has been written correctly to output.dat"
echo "You can look at output.dat"
ConvertBase()
{
	number=$1
	inputbase=$2
	outputbase=$3

	echo "obase=$outputbase; ibase=$inputbase; $number" | bc
}
#############################################
Cross10()	##mod 10 fonksiyonu
{
	input1=$1
	input2=$2
	number3=0
	number3=$(($input1 * $input2))
	echo "$number3 (positive)"
}
Cross16()
{
	input1=$1
	input2=$2
	number3=0

	number1=$(echo "obase=10 ; ibase=16 ; $input1" | bc)
	number2=$(echo "obase=10 ; ibase=16 ; $input2" | bc)
	number3=$(($number1 * $number2))
	number3=$(echo "obase=16 ; ibase=10 ; $number3" | bc)

	echo "0x$number3 (positive)"
}

Cross2()
{
	input1=$1
	input2=$2
	number3=0

	number1=$(echo "obase=10 ; ibase=2 ; $input1" | bc)
	number2=$(echo "obase=10 ; ibase=2 ; $input2" | bc)
	number3=$(($number1 * $number2))
	number3=$(echo "obase=2 ; ibase=10 ; $number3" | bc)

	echo "0b$number3 (positive)"
}
################################################
DivisionSign16()
{
	input1=$1
	input2=$2
	number3=0

	number1=$(echo "obase=10 ; ibase=16 ; $input1" | bc)
	number2=$(echo "obase=10 ; ibase=16 ; $input2" | bc)
	number3=$(($number1 / $number2))
	number3=$(echo "obase=16 ; ibase=10 ; $number3" | bc)
	
	if test $number3 -lt 0
	then
	echo "0x$number3 (negative)"
	else
	echo "0x$number3 (positive)"
	fi
}
DivisionSign10()
{

	input1=$1
	input2=$2
	number3=0
	number3=$(($input1 / $input2))
	
	if test $number3 -lt 0
	then
	echo "$number3 (negative)"
	else
	echo "$number3 (positive)"
	fi
}
DivisionSign2()
{
	input1=$1
	input2=$2
	number3=0

	number1=$(echo "obase=10 ; ibase=2 ; $input1" | bc)
	number2=$(echo "obase=10 ; ibase=2 ; $input2" | bc)
	number3=$(($number1 / $number2))
	number3=$(echo "obase=2 ; ibase=10 ; $number3" | bc)
	
	if test $number3 -lt 0
	then
	echo "0b$number3 (negative)"
	else
	echo "0b$number3 (positive)"
	fi
}
DivisionSign25()
{
	Number1=$1
	Number2=$2
	i=0
	j=1

while test $Number2 -ne 1
	do
		Number2=$(($Number2/10))
		i=$(($i+1))
	done

	while test $j -le $i
	do
		Number1=${Number1%0}
		j=$(($j+1))
	done

	echo $Number1
}
#################################################
Plus16()
{
	input1=$1
	input2=$2
	number3=0

	number1=$(echo "obase=10 ; ibase=16 ; $input1" | bc)
	number2=$(echo "obase=10 ; ibase=16 ; $input2" | bc)
	number3=$(($number1 + $number2))
	number3=$(echo "obase=16 ; ibase=10 ; $number3" | bc)

	echo "0x$number3 (positive)"
}
Plus10()
{
	input1=$1
	input2=$2
	number3=0
	number3=$(($input1 + $input2))
	echo "$number3 (positive)"
}

Plus2()
{
	input1=$1
	input2=$2
	Cout=0
	number3=""

	number1=$(echo "obase=10 ; ibase=2 ; $input1" | bc)
	number2=$(echo "obase=10 ; ibase=2 ; $input2" | bc)

	while test $number1 -ne 0 -o $number2 -ne 0
	do
	        byte1=$(( $number1%2 ))
	        number1=$(( $number1/2 ))

	        byte2=$(( $number2%2 ))
	        number2=$(( $number2/2 ))

	        if test $(( $byte1+$byte2+$Cout )) -eq 2
                then
        	        Cout=1
        	        sum=0
        	        number3=${sum}$number3
        	elif test $(( $byte1+$byte2+$Cout )) -eq 3
                then
        	        Cout=1
        	        sum=1
        	        number3=${sum}$number3
        	else
        	        sum=$(( $byte1+$byte2+$Cout ))
        	        Cout=0
        	        number3=${sum}$number3
		fi
	done

	if test $Cout -eq 1
	then
	        number3=${Cout}$number3
	fi

	echo "0b$number3 (positive)"
}
###################################
Minus16()
{
	input1=$1
	input2=$2
	number3=0

	number1=$(echo "obase=10 ; ibase=16 ; $input1" | bc)
	number2=$(echo "obase=10 ; ibase=16 ; $input2" | bc)
	number3=$(($number1 - $number2))
	number3=$(echo "obase=16 ; ibase=10 ; $number3" | bc)
	
	if test $number3 -lt 0
	then
	echo "0x$number3 (negative)"
	else
	echo "0x$number3 (positive)"
	fi
}
Minus10()
{

	input1=$1
	input2=$2
	number3=0
	number3=$(($input1 - $input2))
	
	if test $number3 -lt 0
	then
	echo "$number3 (negative)"
	else
	echo "$number3 (positive)"
	fi
}
Minus2()
{
	input1=$1
	input2=$2
	number3=0

	number1=$(echo "obase=10 ; ibase=2 ; $input1" | bc)
	number2=$(echo "obase=10 ; ibase=2 ; $input2" | bc)
	number3=$(($number1 - $number2))
	number3=$(echo "obase=2 ; ibase=10 ; $number3" | bc)
	
	if test $number3 -lt 0
	then
	echo "0b$((number3*-1)) (negative)"
	else
	echo "0b$number3 (positive)"
	fi
}
################################################
Mod2()
{
	input1=$1
	input2=$2
	number3=0

	number1=$(echo "obase=10 ; ibase=2 ; $input1" | bc)
	number2=$(echo "obase=10 ; ibase=2 ; $input2" | bc)
	number3=$(($number1 % $number2))
	number3=$(echo "obase=2 ; ibase=10 ; $number3" | bc)
	
	if test $number3 -lt 0
	then
	echo "0b$number3 (negative)"
	else
	echo "0b$number3 (positive)"
	fi
}
Mod16()
{
	input1=$1
	input2=$2
	number3=0

	number1=$(echo "obase=10 ; ibase=16 ; $input1" | bc)
	number2=$(echo "obase=10 ; ibase=16 ; $input2" | bc)
	number3=$(($number1 % $number2))
	number3=$(echo "obase=16 ; ibase=10 ; $number3" | bc)
	
	if test $number3 -lt 0
	then
	echo "0x$number3 (negative)"
	else
	echo "0x$number3 (positive)"
	fi
}
Mod10()
{
	input1=$1
	input2=$2
	number3=0
	number3=$(($input1 % $input2))
	
	if test $number3 -lt 0
	then
	echo "$number3 (negative)"
	else
	echo "$number3 (positive)"
	fi
}
########################################################
while read line
do
	input=0

	for word in $line
	do
		input=$(( $input+ 1))
		if test $input -eq 1
			then
			variable1=$word
		elif test $input -eq 2
			then
			variable2=$word
		elif test $input -eq 3
			then
			variable3=$word
		fi
	done
	
	if test "$variable2" = "+"
		then
			if test "${variable1:0:2}" = "0b"
			then
			subVar1=${variable1:2:${#variable1}}
			subVar3=${variable3:2:${#variable3}}
			Plus2 $subVar1 $subVar3 >> $2
			elif test "${variable1:0:2}" = "0x"
			then
			subVar1=${variable1:2:${#variable1}}
			subVar3=${variable3:2:${#variable3}}
			Plus16 $subVar1 $subVar3 >> $2
			else
			Plus10 $variable1 $variable3 >> $2
			fi

	elif test "$variable2" = "-"
		then
			if test "${variable1:0:2}" = "0b"
			then
			subVar1=${variable1:2:${#variable1}}
			subVar3=${variable3:2:${#variable3}}
			Minus2 $subVar1 $subVar3 >> $2
			elif test "${variable1:0:2}" = "0x"
			then
			subVar1=${variable1:2:${#variable1}}
			subVar3=${variable3:2:${#variable3}}
			Minus16 $subVar1 $subVar3 >> $2
			else
			Minus10 $variable1 $variable3 >> $2
			fi

	elif test "$variable2" = "/" ## dividing operation
		then
			
			if test "${variable1:0:2}" = "0b"
			then
			subVar1=${variable1:2:${#variable1}}
			subVar3=${variable3:2:${#variable3}}
			DivisionSign2 $subVar1 $subVar3 >> $2
			elif test "${variable1:0:2}" = "0x"
			then
			subVar1=${variable1:2:${#variable1}}
			subVar3=${variable3:2:${#variable3}}
			DivisionSign16 $subVar1 $subVar3 >> $2
			else
			DivisionSign10 $variable1 $variable3 >> $2
			fi

	elif test "$variable2" = "x" ## crossing operation ## hocam * işaretini variable olarak tutamadım o yüzden * yerine x olarak girerseniz doğru sonucu verecektir
		then
			if test "${variable1:0:2}" = "0b"
			then
			subVar1=${variable1:2:${#variable1}}
			subVar3=${variable3:2:${#variable3}}
			Cross2 $subVar1 $subVar3 >> $2
			elif test "${variable1:0:2}" = "0x"
			then
			subVar1=${variable1:2:${#variable1}}
			subVar3=${variable3:2:${#variable3}}
			Cross16 $subVar1 $subVar3 >> $2
			else
			Cross10 $variable1 $variable3 >> $2
			fi
	elif test "$variable2" = "%" ## mod operation
		then
			if test "${variable1:0:2}" = "0b"
			then
			subVar1=${variable1:2:${#variable1}}
			subVar3=${variable3:2:${#variable3}}
			Mod2 $subVar1 $subVar3 >> $2
			elif test "${variable1:0:2}" = "0x"
			then
			subVar1=${variable1:2:${#variable1}}
			subVar3=${variable3:2:${#variable3}}
			Mod16 $subVar1 $subVar3 >> $2
			else
			Mod10 $variable1 $variable3 >> $2
			fi

	else		## taban değiştirme
		if test "${variable1:0:2}" = "0b"
		then
		subVar1=${variable1:2:${#variable1}}
		ConvertBase $subVar1 $variable2 $variable3 >> $2
		elif test "${variable1:0:2}" = "0x"
		then 
		subVar1=${variable1:2:${#variable1}}
		ConvertBase $subVar1 $variable2 $variable3 >> $2
		else
		subVar1=${variable1:0:${#variable1}}
		ConvertBase $subVar1 $variable2 $variable3 >> $2
		fi
	fi

done < $1
