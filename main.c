#include "get_next_line.h"
#include "test_get_next_line.h"
#include <stdio.h>
#include <fcntl.h>
#include <ctype.h>
#include <unistd.h>
#include <stdlib.h>

static int	isnumeric(const char *str)
{
	for (size_t i = 0; i < strlen(str); i++)
	{
		if (!isdigit(str[i]))
			return (0);
	}
	return (1);
}

int	main(int argc, char **argv)
{
	char	*line;
	int		ret;
	int		fd;

	line = NULL;
	if (argc > 1)
	{
		if (isnumeric(argv[1]))
		{
			fd = atoi(argv[1]);
		}
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
	{
		fd = 0;
	}
	if (fd >= 0)
	{
		size_t	i = 1;
		printf("FD: %d\n", fd);
		while (1)
		{
			ret = get_next_line(fd, &line);
			printf("line %zu: %s\n", i, line);
			printf("ret: %d\n", ret);
			if (ret < 1 || i == 100)
				break ;
			if (line)
			{
				free(line);
				line = NULL;
			}
			i++;
		}
		close(fd);
	}
	return (0);
}
