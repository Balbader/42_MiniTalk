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

# NAME
NAME_C				:=	client
NAME_S				:=	server


# SRCS FILES
SERVER_DIR			:=	srcs/
SERVER_FILES		:=	server.c
SERVER				:=	$(addprefix $(SERVER_DIR), $(SERVER_FILES))

CLIENT_DIR			:=	srcs/
CLIENT_FILES		:=	client.c
CLIENT				:=	$(addprefix $(CLIENT_DIR), $(CLIENT_FILES))

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
						ft_putchar.c \
						ft_strlen.c
UTILS				:=	$(addprefix $(UTILS_DIR), $(UTILS_FILES))


# INGREDIENTS
SRCS_DIR			:=	./srcs/
INC_DIR				:=	./inc/

SRCS				:=	\
						$(FT_PRINTF) \
						$(UTILS)
SRCS				:=	$(SRCS:%=$(SRCS_DIR)/%)

BUILD_DIR			:=	.build
OBJS_C        		:=	$(SRCS:$(SRCS_DIR)/%.c=$(BUILD_DIR)/%.o) $(CLIENT:$(SRCS_DIR)/%.c=$(BUILD_DIR)/%.o)
OBJS_S        		:=	$(SRCS:$(SRCS_DIR)/%.c=$(BUILD_DIR)/%.o) $(SERVER:$(SRCS_DIR)/%.c=$(BUILD_DIR)/%.o)

CC					:=	cc
CFLAGS				:=	-Wall -Wextra -Werror -g3
IFLAGS				:=	$(addprefix -I, $(INC_DIR))


# USTENSILS
RM					:=	rm -rf
DIR_DUP				=	mkdir -p $(@D)


# RECIPES
all: $(NAME_C) $(NAME_S)

$(NAME_C): $(OBJS_C)
	$(CC) $(CFLAGS) $(IFLAGS) $(OBJS_C) -o $(NAME_C)

$(NAME_S): $(OBJS_S)
	$(CC) $(CFLAGS) $(IFLAGS) $(OBJS_S) -o $(NAME_S)

$(BUILD_DIR)/%.o: $(SRCS_DIR)/%.c
	$(DIR_DUP)
	$(CC) $(CFLAGS) $(IFLAGS) -c -o $@ $<

clean:
	$(RM) $(BUILD_DIR)

fclean:
	$(MAKE) clean
	$(RM) $(NAME_C) $(NAME_S)

re:
	$(MAKE) fclean
	$(MAKE) all

# SPEC
.PHONY: all clean fclean re
# .SILENT:
