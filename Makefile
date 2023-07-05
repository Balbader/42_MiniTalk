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
CLI_TARGET			:=	client
SERV_TARGET			:=	server

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
						ft_strlen.c
UTILS				:=	$(addprefix $(UTILS_DIR), $(UTILS_FILES))

# INGREDIENTS
SRCS_DIR			:=	./srcs/
INC_DIR				:=	./inc/

SRCS				:=	\
						$(FT_PRINTF) \
						$(UTILS) \
						server.c \
						client.c
SRCS				:=	$(SRCS:%=$(SRCS_DIR)/%)

BUILD_DIR			:=	.build
OBJS        		:=	$(SRCS:$(SRCS_DIR)/%.c=$(BUILD_DIR)/%.o)
DEPS        		:=	$(OBJS:.o=.d)

CC					:=	cc
CFLAGS				:=	-Wall -Wextra -Werror -g3
IFLAGS				:=	$(addprefix -I, $(INC_DIR))

# USTENSILS
RM					:=	rm -rf
DIR_DUP				=	mkdir -p $(@D)


# RECIPES
all: $(CLI_TARGET) $(SERV_TARGET)

$(CLI_TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o client.c

$(SERV_TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o server.c

$(BUILD_DIR)/%.o: $(SRCS_DIR)/%.c
	$(DIR_DUP)
	$(CC) $(CFLAGS) $(IFLAGS) -c -o $@ $<

-include $(DEPS)

clean:
	$(RM) $(BUILD_DIR) $(DEPS)
	$(RM) $(CLI_TARGET) $(SERV_TARGET)

fclean:
	$(MAKE) clean
	$(RM) $(CLI_TARGET) $(SERV_TARGET)

re:
	$(MAKE) fclean
	$(MAKE) all


# SPEC
.PHONY: all clean fclean re
# .SILENT:
