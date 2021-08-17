#!/bin/bash
##author: Susan Shrestha##
##Date: April 1 2021##

 ##displaying content about three selected players if data is found##
threePlayers() {
	PS3="Select a number:" ##using prompt string to make selection of player##
	select p in $p1 $p2 $p3 ##storing selection in variable p##
	do
		case $p in
		"LM") 
		echo "#-------------------------------------------------------------------------#"		
		cat LM.txt ##displaying content for player using cat utility##
		echo "#-------------------------------------------------------------------------#"
		echo -e "\n"
		break;;
		"NJ")
		echo "#-------------------------------------------------------------------------#"
		cat NJ.txt
"#-------------------------------------------------------------------------#"
		echo -e "\n"
		break;;
		"KC")
		echo "#-------------------------------------------------------------------------#"
		cat KC.txt
		echo "#-------------------------------------------------------------------------#"
		echo -e "\n"
		break;;
		"ZZ") echo "#-------------------------------------------------------------------------#
	Error! Cannot fetch any data for Zheng Zhi!"

		echo "#-------------------------------------------------------------------------#"
		main
		echo -e "\n"
		break;;
		"HK") echo "#-------------------------------------------------------------------------#
	Error! Cannot fetch any data for Henry Kane!"
	echo "#-------------------------------------------------------------------------#"
		main
		echo -e "\n"
		break;;
		*) echo "#-------------------------------------------------------------------------#
	Error! Type the correct number."
		echo "#-------------------------------------------------------------------------#" ##printing error message if wrong selection is done##
		echo -n ">> "
		esac
	done
	
	while true;
	do
		echo "Continue? Yes [Y/y] or No [N/n]"
		echo -n ">> " ##asking user to continue or exit the program##
		read choice
		case $choice in 
			[yY]* ) ##if y/Y is entered program continues##
			main;; ##calls main function##
			[nN]* ) ##if n/N is entered program exits##
			exit;; ##exits program##
		esac
	done
}

##reading 3 player code as input and validating the player code input##
bestPlayer (){
	flag=0
	while [ $flag = 0 ]
	do
		read p1 p2 p3
		if [ -z "$p1" ] || [ -z "$p2" ] || [ -z "$p3" ];
		then
			echo "#-------------------------------------------------------------------------#
	ERROR! Please enter 3 players code seperated by space"
		echo -e "#-------------------------------------------------------------------------#"
		echo -n ">> "
		elif [[ "LM" != "$p1" && "NJ" != "$p1" && "KC" != "$p1" && 			"ZZ" != "$p1" && "HK" != "$p1" ]] || [[ "LM" != "$p2" && 			"NJ" != "$p2" && "KC" != "$p2" && "ZZ" != "$p2" && "HK" != 			"$p2" ]] || [[ "LM" != "$p3" && "NJ" != "$p3" && "KC" != 			"$p3" && "ZZ" != "$p3" && "HK" != "$p3" ]] ##validating the player codes if codes are not listed##
		then
			echo "#-------------------------------------------------------------------------#
	ERROR! Please enter correct players code!"
		echo "#-------------------------------------------------------------------------#"
		echo -n ">> "
		elif [ $p1 == $p2 ] || [ $p3 == $p2 ] || [ $p1 == $p3 ]; ##checking if player codes are redundant##
		then
			echo "#-------------------------------------------------------------------------#
	ERROR! Please enter 3 different players code!"
	echo "#-------------------------------------------------------------------------#"
		echo -n ">> "
		else
			threePlayers ##calls threePlayers funtion after validation##
			flag=1 ##sets flag to 1 to end loop##
		fi
	done
}

bestTeam (){
	read team
	if [ "$team" == "NEP" ]
	then
		echo -e "
#----------------------------------------------------------------------------#
	~YES, YOUR GUESS IS CORRECT!
	~Nepal is the best team in the world.
	~Nepal has won Saff U-19 championship in 2015
	~3 major tournaments in 2016 and gold medal in 2016 south Asian games.
#---------------------------------------------------------------------------#"
	else
		echo "#---------------------------------------------------------------------------#
		Error! Wrong guess. Please guess again!"
		echo "#---------------------------------------------------------------------------#"
		echo -n ">> "
		bestTeam
	fi
}		

main(){
	echo "
	**GUESS THE BEST FOOTBALL TEAM**
	   **TYPE THE COUNTRY CODE**
	     *-------------------*
	     | CODE | (COUNTRY)  |
	     *-------------------*
	     | ARG    (Argentina)|
	     | BRZ    (BRAZIL)   |
	     | NEP    (Nepal)    |
	     | CHI    (China)    |
	     | ENG    (England)  |
	     *------------------*" #asking user to guess the best football team#
	echo -n ">> "
	bestTeam
	echo "
	**THE BEST FIVE STAR PLAYERS ARE LISTED**
	   **TYPE ANY THREE PLAYER'S CODE**
	     *-----------------------*
	     | CODE | (PLAYER)       |
	     *-----------------------*
	     | LM    (Lionel Messi)  |
	     | NJ    (Neymar Junior) |
	     | KC    (Kiran Chemjong)|
	     | ZZ    (Zheng Zhi)     |
	     | HK    (Henry Kane)    |
	     *-----------------------* "
	echo -n ">> "
	bestPlayer
   	exit
}

#program function: from where the user logs in to the program and plays on#		
program (){
	echo "
#-------------------------------------------------------------------------#
  ##      ## ######## ##        ######   #######  ##     ## ######## 
  ##  ##  ## ##       ##       ##    ## ##     ## ###   ### ##       
  ##  ##  ## ##       ##       ##       ##     ## #### #### ##       
  ##  ##  ## ######   ##       ##       ##     ## ## ### ## ######   
  ##  ##  ## ##       ##       ##       ##     ## ##     ## ##       
  ##  ##  ## ##       ##       ##    ## ##     ## ##     ## ##       
   ###  ###  ######## ########  ######   #######  ##     ## ########
#-------------------------------------------------------------------------#"
	echo "
#-------------------------------------------------------------------------#
	~Name:$1		~ID:$2			

	~Date:$(date)
#-------------------------------------------------------------------------#
" #printing the username ID and Date#
	main ##calls main function##
}

#login function for getting into the program by typing the secret key#
login (){ 
	chances=5 ##initiating chances as 5##
	while [ $chances -gt 0  ] ##while loop for login function##
	do
		echo "Enter the secret key:"
		echo -n ">> "
		stty -echo ##hiding the secret key when user types##
		read key
		stty echo ##unhiding user keyboard input##
		if [ "$key" == "susz" ] ##checks if the key matches##
		then
			program $1 $2 ##if key matches goto program function and pass 1st and 2nd argument as parameter##
		else
			((chances--)) ##if key doesnot match return error message and decrement chance and print##
			echo -e ""
			echo "#-------------------------------------------------------------------------#
	Please enter the correct secret key! $chances chance left!"
echo "#-------------------------------------------------------------------------#"
	echo -n ">> "
		fi
	done
}

if [ $# == 2 ] #checks if the script file is initiated with two parameters as name and id
then
	login $1 $2	#calls login function passing the two parameter values#
elif [ "$1" = "" ] ##checks if first parameter is missing then prints error message##
then
	echo "#-------------------------------------------------------------------------#
	ERROR! Please enter your name!" #if the program is not initiated with two parameter value as name and id returns error to the user and exit$
echo "#-------------------------------------------------------------------------#"
else
	echo "#-------------------------------------------------------------------------#
	ERROR! Try again with your Name and ID as parameters."
	echo "#-------------------------------------------------------------------------#"
fi
