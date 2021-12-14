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

# Line of 8 chars from STDOUT
echo "${green}\n# One line of 8 chars from STDOUT${reset}"
echo "abcdabcd" > input
./test_gnl < input

# Two lines of 8 chars from STDOUT
echo "${green}\n# Two lines of 8 chars from STDOUT${reset}"
echo "abcdabcd" >> input
./test_gnl < input

# 10 lines of 8 chars from STDOUT
echo "${green}\n# 10 lines of 8 chars from STDOUT${reset}"
for i in {1..8}
do
	echo "abcdabcd" >> input
done
./test_gnl < input

rm input

# Line of 8 chars from file
echo "${green}\n# One line of 8 chars from file${reset}"
echo "abcdabcd" > input
./test_gnl "input"

# Two lines of 8 chars from file
echo "${green}\n# Two lines of 8 chars from file${reset}"
echo "abcdabcd" >> input
./test_gnl "input"

# 10 lines of 8 chars from file
echo "${green}\n# 10 lines of 8 chars from file${reset}"
for i in {1..8}
do
	echo "abcdabcd" >> input
done
./test_gnl "input"

rm input

# Middle tests
echo "${magenta}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "\t\t\t\tMiddle Tests"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${reset}"

# Line of 16 chars from STDOUT
echo "${green}\n# One line of 16 chars from STDOUT${reset}"
echo "abcdabcd12345678" > input
./test_gnl < input

# Two lines of 16 chars from STDOUT
echo "${green}\n# Two lines of 16 chars from STDOUT${reset}"
echo "abcdabcd12345678" >> input
./test_gnl < input

# 10 lines of 16 chars from STDOUT
echo "${green}\n# 10 lines of 16 chars from STDOUT${reset}"
for i in {1..8}
do
	echo "abcdabcd12345678" >> input
done
./test_gnl < input

rm input

# Line of 16 chars from file
echo "${green}\n# One line of 16 chars from file${reset}"
echo "abcdabcd12345678" > input
./test_gnl "input"

# Two lines of 16 chars from file
echo "${green}\n# Two lines of 16 chars from file${reset}"
echo "abcdabcd12345678" >> input
./test_gnl "input"

# 10 lines of 16 chars from file
echo "${green}\n# 10 lines of 16 chars from file${reset}"
for i in {1..8}
do
	echo "abcdabcd12345678" >> input
done
./test_gnl "input"

# Advanced tests
echo "${magenta}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "\t\t\t\tAdvanced Tests"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${reset}"

# Line of 4 chars from STDOUT
echo "${green}\n# One line of 4 chars from STDOUT${reset}"
echo "xyzx" > input
./test_gnl < input

# Two lines of 4 chars from STDOUT
echo "${green}\n# Two lines of 4 chars from STDOUT${reset}"
echo "xyzx" >> input
./test_gnl < input

# 10 lines of 4 chars from STDOUT
echo "${green}\n# 10 lines of 4 chars from STDOUT${reset}"
for i in {1..8}
do
	echo "xyzx" >> input
done
./test_gnl < input

rm input

# Line of 4 chars from file
echo "${green}\n# One line of 4 chars from file${reset}"
echo "xyzx" > input
./test_gnl "input"

# Two lines of 4 chars from file
echo "${green}\n# Two lines of 4 chars from file${reset}"
echo "xyzx" >> input
./test_gnl "input"

# 10 lines of 4 chars from file
echo "${green}\n# 10 lines of 4 chars from file${reset}"
for i in {1..8}
do
	echo "xyzx" >> input
done
./test_gnl "input"

# Line of 4 chars from file, no newline
echo "${green}\n# One line of 4 chars from file, no newline${reset}"
printf "xyzx" | ./test_gnl

# One line of 8 chars from file, no newline
echo "${green}\n# One line of 8 chars from file, no newline${reset}"
printf "ijklijkl" | ./test_gnl

# One line of 16 chars from file, no newline
echo "${green}\n# One line of 16 chars from file, no newline${reset}"
printf "azazbabaliligugu" | ./test_gnl

# Empty line from file
echo "${green}\n# Empty line from file${reset}"
echo "" > input
./test_gnl "input" | cat -e

# Error managment tests
echo "${magenta}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "\t\t\t\tError Management Tests"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${reset}"

# Arbitrary FD
./test_gnl 42

#Different bufff sizes
set_buff_size 1
echo "# BUFF SIZE: 1${reset}"
./test_gnl bible

#set_buff_size 32
#echo "# BUFF SIZE: 32${reset}"
#./test_gnl bible
#
#set_buff_size 9999
#echo "# BUFF SIZE: 9999${reset}"
#./test_gnl bible
#
#set_buff_size 1000000
#echo "# BUFF SIZE: 1000000${reset}"
#./test_gnl bible

#### END OF EVAL FORM TESTS

#### START OF EXTRA TESTS
