/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: baalbade <baalbade@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/05 09:42:20 by baalbade          #+#    #+#             */
/*   Updated: 2023/07/05 09:43:04 by baalbade         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_H
# define MINITALK_H
# include <sys/types.h>
# include <signal.h>
# include <unistd.h>
# include <stdlib.h>
# include <stdarg.h>
# include <stddef.h>
# include <fcntl.h>

// client
void			ft_check_signal(int kill_ref);
void			ft_post_str(char *str, int str_len, int pid);

// server
void			ft_print_signal(int signum);

// ft_printf
int				ft_printf(const char *str, ...);
void			ft_print_nb(int nb, int *tot_len);
void			ft_print_hexa(unsigned int nb, char c, int *tot_len);
void			ft_print_unsigned(unsigned int u, int *tot_len);
void			ft_print_ptr(size_t ptr, int *tot_len);
void			ft_print_char(char c, int *tot_len);
void			ft_print_str(char *str, int *tot_len);

// utils
int				ft_strlen(char *str);
void			ft_putchar(char c);
long long int	ft_atoi(const char *str);

#endif
