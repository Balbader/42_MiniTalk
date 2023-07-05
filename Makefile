# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: baalbade <baalbade@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/05 09:36:19 by baalbade          #+#    #+#              #
#    Updated: 2023/07/05 09:36:24 by baalbade         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# TARGET
NAME				:=	s

# SRCS FILES
FT_PRINTF_DIR		:=	ft_printf/
FT_PRINTF_FILES		:=	\
						ft_print_char.c \
						ft_printf.c \
						ft_print_hexa.c \
						ft_print_nb.c \
						ft_print_ptr.c \
						ft_print_str.c \
						ft_print_unsigned.c
FT_PRINTF			:=	$(addprefix $(FT_PRINTF_DIR), $(FT_PRINTF_FILES))


UTILS_DIR			:=	utils/
UTILS_FILES			:=	\
						ft_atoi.c \
 						ft_is_duplicate.c \
						ft_isdigit.c \
						ft_itoa.c \
 						ft_print_error.c \
						ft_putchar.c \
						ft_putstr.c \
						ft_split.c \
						ft_strchr.c \
						ft_strdup.c \
						ft_strjoin.c \
						ft_strlen.c \
						ft_strncpy.c
UTILS				:=	$(addprefix $(UTILS_DIR), $(UTILS_FILES))

# INGREDIENTS

SRCS_DIR			:=	./srcs/
INC_DIR				:=	./inc/

SRCS				:=	\
						$(FT_PRINTF) \
						$(UTILS) \
						main.c
SRCS				:=	$(SRCS:%=$(SRCS_DIR)/%)

BUILD_DIR			:=	.build
OBJS        		:=	$(SRCS:$(SRCS_DIR)/%.c=$(BUILD_DIR)/%.o)
DEPS        		:=	$(OBJS:.o=.d)

CC					:=	cc
CFLAGS				:=	-Wall -Wextra -Werror -g3

# USTENSILS
RM					:=	rm -rf
DIR_DUP				=	mkdir -p $(@D)


# RECIPES
all: $(NAME)

$(NAME): $(LIBMLX) $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) -o $(NAME)

$(BUILD_DIR)/%.o: $(SRCS_DIR)/%.c
	$(DIR_DUP)
	$(CC) $(CFLAGS) $(IFLAGS) -c -o $@ $<

-include $(DEPS)

$(LIBMLX):
	$(MAKE_LIBMLX)

clean:
	$(MAKE_LIBMLX) clean
	$(RM) $(BUILD_DIR) $(DEPS)

fclean:
	$(MAKE) clean
	$(RM) $(NAME)

re:
	$(MAKE) fclean
	$(MAKE) all


# SPEC
.PHONY: all clean fclean re
# .SILENT:
