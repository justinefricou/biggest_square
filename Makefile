##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## A Makefile that compiles cat
##

NAME	=	bsq

SRC	=	main.c\
		error_detection.c\
		load_map_from_file.c\
		mem_alloc_arrays.c\
		map.c\
		map_initializing.c\
		find_biggest_square.c\
		display_result.c

OBJ	=	$(SRC:.c=.o)

NAME_TESTS = 	tests_bsq

SRC_TESTS =	error_detection.c\
			load_map_from_file.c\
			mem_alloc_arrays.c\
			map_initializing.c\
			map.c\
			find_biggest_square.c\
			display_result.c\
			tests/test_check_first_line.c\
			tests/test_check_map.c\
			tests/test_load_map_from_file.c\
			tests/test_get_number_from_line.c\
			tests/test_get_columns_nb_from_file.c\
			tests/test_set_map_dimensions.c\
			tests/test_copy_line_in_arr.c\
			tests/test_is_line.c\
			tests/test_is_square_of_size.c\
			tests/test_display_character.c


OBJ_TESTS	=	$(SRC_TESTS:.c=.o)

all:	$(NAME)

$(NAME):	$(OBJ)
			gcc -o $(NAME) $(OBJ)

clean:
		rm -f $(OBJ)
		rm -f $(OBJ_TESTS)
		rm -f *.gcno
		rm -f *.gcda

fclean: clean
		rm -f $(NAME)
		rm -f $(NAME_TESTS)

re:	fclean all

tests_run: 	$(SRC_TESTS)
			gcc -o $(NAME_TESTS) $(SRC_TESTS) --coverage -lcriterion
			./$(NAME_TESTS)