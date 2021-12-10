################################################################################

#							GNL Test Shell Script

################################################################################

# Colors
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
reset=`tput sgr0`

# Function for modifying BUFF_SIZE
function set_buff_size() {
	sed -i'' -e 's/^# define BUFF_SIZE.*/# define BUFF_SIZE '$1'/g' '../GET_Next_Line/get_next_line.h'
	rm ../GET_Next_Line/get_next_line.h-e
}

# Basic tests
echo "${magenta}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "\t\t\t\tBasic Tests"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

set_buff_size 8
echo "# BUFF SIZE: 8${reset}"

# Line of 8 chars
echo "${green}\n# One line of 8 chars${reset}"
echo "abcdabcd" > input
./test_gnl

# Two lines of 8 chars
echo "${green}\n# Two lines of 8 chars${reset}"
echo "abcdabcd" >> input
./test_gnl

# Middle tests
echo "${magenta}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "\t\t\t\tMiddle Tests"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${reset}"

# Too big BUFF_SIZE
for i in {1..8}
do
	echo "dfagjaljgk" >> input
done
set_buff_size 1000000
./test_gnl
