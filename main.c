#include "get_next_line.h"
#include <stdio.h>
#include <fcntl.h>

int	main(void)
{
	char	*line;
	int		ret;
	int		fd;

	printf("Test GET_Next_Line\n");

	fd = open("hello.txt", O_RDONLY);
	if (fd > 2)
	{
		while (1)
		{
			ret = get_next_line(fd, &line);
			if (ret < 1)
				break ;
			printf("line: %s\n", line);
			printf("ret: %d\n", ret);
			free(line);
		}
		close(fd);
	}
	return (0);
}
