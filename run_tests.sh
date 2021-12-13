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
for i in {1..16}
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
for i in {1..16}
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
for i in {1..4}
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
for i in {1..4}
do
	echo "xyzx" >> input
done
./test_gnl "input"

# Line of 4 chars from file, no newline
echo "${green}\n# One line of 4 chars from file, no newline${reset}"
printf "xyzx" > input
./test_gnl "input"

# One line of 8 chars from file, no newline
echo "${green}\n# One line of 8 chars from file, no newline${reset}"
printf "ijklijkl" > input

# One line of 16 chars from file, no newline
echo "${green}\n# One line of 16 chars from file, no newline${reset}"
printf "azazbabaliligugu" | ./test_gnl

# Empty line from file
echo "${green}\n# Empty line from file${reset}"
echo "" > input
./test_gnl "input" | cat -e

#### END OF EVAL FORM TESTS

#### START OF EXTRA TESTS

# Too big BUFF_SIZE
echo "${green}\n# BUFF_SIZE = 1 000 000${reset}"
rm input
for i in {1..8}
do
	echo "dfagjaljgk" >> input
done
set_buff_size 1000000
./test_gnl < input
