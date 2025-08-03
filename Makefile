# Output
NAME_STATIC_LIB = get_next_line.a
NAME = get_next_line

# Compiler
CC = gcc
CFLAGS = -Wall -Wextra -Werror
AR = ar rcs

# Directories
SRC_DIR = srcs
INC_DIR = includes
TEST_DIR = tests

# Source files
SRC_FILES = get_next_line.c get_next_line_utils.c
OBJS = $(addprefix $(SRC_DIR)/, $(SRC_FILES:.c=.o))

# Rules
all: $(NAME_STATIC_LIB)

run: $(NAME_STATIC_LIB)
	$(CC) $(CFLAGS) -I$(INC_DIR) $(TEST_DIR)/main.c $(NAME_STATIC_LIB) -o $(NAME)
	bash $(TEST_DIR)/test.sh

$(NAME_STATIC_LIB): $(OBJS)
	$(AR) $@ $^

$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME_STATIC_LIB)
	rm -f $(NAME)

re: fclean all

.PHONY: all run clean fclean re
