NAME = run_tests

GNL_PATH = ../GET_Next_Line/

LIB_PATH = ../libft/

CFLAGS = -g -Wall -Wextra -Werror

IFLAG = -I$(GNL_PATH)

LIBFLAG = -L$(LIB_PATH) -lft

SRCS = main.c \
	   $(GNL_PATH)get_next_line.c \

LIBSRCS = $(LIB_PATH)ft_strncpy.c \
		  $(LIB_PATH)ft_strnew.c \
		  $(LIB_PATH)ft_strdup.c \
		  $(LIB_PATH)ft_strsub.c \
		  $(LIB_PATH)ft_strlen.c \
		  $(LIB_PATH)ft_memchr.c \
		  $(LIB_PATH)ft_memcpy.c \
		  $(LIB_PATH)ft_memmove.c \

all: $(NAME)

$(NAME): $(SRCS)
	gcc $(CFLAGS) $(SRCS) $(LIBSRCS) $(IFLAG) -o $(NAME)

clean:

fclean: clean
	/bin/rm $(NAME)

re: fclean all
