NAME = run_tests

GNL_PATH = ../GET_Next_Line/

LIB_PATH = ../libft/

CFLAGS = -g -pedantic -Wall -Wextra -Werror

IFLAG = -I$(GNL_PATH)

LIBFLAG = -L$(LIB_PATH) -lft

SRCS = main.c \
	   $(GNL_PATH)get_next_line.c

all: $(NAME)

$(NAME): $(SRCS)
	gcc $(CFLAGS) $(SRCS) $(IFLAG) $(LIBFLAG)

clean:

fclean: clean
	/bin/rm $(NAME)

re: fclean all
