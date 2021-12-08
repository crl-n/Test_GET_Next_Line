################################################################################

#							GNL Test Shell Script

################################################################################

# Function for modifying BUFF_SIZE
function set_buff_size() {
	sed -i'' -e 's/^# define BUFF_SIZE.*/# define BUFF_SIZE '$1'/g' '../GET_Next_Line/get_next_line.h'
	rm ../GET_Next_Line/get_next_line.h-e
}

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "\t\t\t\tBasic Tests"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

set_buff_size 8

# Line of 8 chars
echo "abcdabcd" > input
./test_gnl


