#include "get_next_line.h"
#include "test_get_next_line.h"
#include <stdio.h>
#include <fcntl.h>
#include <ctype.h>

int	main(int argc, char **argv)
{
	char	*line;
	int		ret;
	int		fd;

	line = NULL;
	if (argc > 1)
	{
		if (isdigit(atoi(argv[1])))
			fd = atoi(argv[1]);
		else
		{
			fd = open(argv[1], O_RDONLY);
			if (strcmp("input", argv[1]))
			{
				printf(BLU "\n********************************************************************************\n\n" RESET);
				printf("\t\t\t\tTest GET_Next_Line\n");
				printf(BLU "\n********************************************************************************\n" RESET);
			}
		}
	}
	else
		fd = open("input", O_RDONLY);
	if (fd > 2)
	{
		while (1)
		{
			ret = get_next_line(fd, &line);
			if (ret < 1)
				break ;
			printf("line: %s\n", line);
			printf("ret: %d\n", ret);
			if (line)
				free(line);
		}
		close(fd);
	}
	return (0);
}
