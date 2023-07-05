/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: baalbade <baalbade@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/05 09:37:02 by baalbade          #+#    #+#             */
/*   Updated: 2023/07/05 09:37:04 by baalbade         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_check_signal(int kill_ref)
{
	if (kill_ref == -1)
	{
		ft_printf("Error : Signal Failure!\n");
		exit(1);
	}
}

void	ft_post_str(char *str, int str_len, int pid)
{
	int	bit;
	int	bit_ref;
	int	check_kill;
	int	i;
	int	j;

	i = -1;
	while (++i < len)
	{
		j = -1;
		bit_ref = 128;
		while (++j < 8)
		{
			bit = string[i] & bit_ref;
			if (bit == bit_ref)
				check_kill = kill(pid, SIGUSR2);
			else
				check_kill = kill(pid, SIGUSR1);
			ft_check_signal(check_kill);
			bit_ref = bit_ref >> 1;
			usleep(130);
		}
	}
}

int	main(int argc, char **argv)
{
	char	*str;
	int		str_len;
	int		pid;

	if (argc == 3)
	{
		pid = ft_atoi(argv[1]);
		if (pid <= 1204)
		{
			ft_printf("Error : Incorrect PID!\n");
			exit(1);
		}
		str_len = ft_strlen(argv[2]);
		str = argv[2];
		ft_post_string(str, str_len, pid);
		return (0);
	}
	ft_printf("Error : Wrong Argument Count!\n");
   	ft_printf("Only 2 arguments needed : PID and MESSAGE\n");
	return (0);
}
