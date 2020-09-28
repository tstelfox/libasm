# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: tmullan <tmullan@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2020/09/17 16:10:57 by tmullan       #+#    #+#                  #
#    Updated: 2020/09/28 17:54:53 by tmullan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

OBJ = ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o ft_strdup.o \
		tester.o

FLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJ)
	# ld -e start -macosx_version_min 10.13.0 -static -o $(NAME) $(OBJ)
	ar rc $(NAME) $(OBJ)

%.o: %.s
	nasm -f macho64 $<

test: $(NAME)
	$(CC) -L. -lasm -o test tester.c $(FLAGS)
	@echo "\n\n\tAIGHT LET'S TEST THIS\n"
	@echo "\tplease execute ./test and supply one string as argument\n\n"

clean:
	rm -rf $(OBJ)

fclean : clean
	rm -rf $(NAME) test

re: fclean all
