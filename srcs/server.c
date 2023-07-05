/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: baalbade <baalbade@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/05 09:37:09 by baalbade          #+#    #+#             */
/*   Updated: 2023/07/05 09:37:11 by baalbade         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_print_signal(int signum)
{
	static char	sig;
	static int	count;

	++count;
	if (signum == SIGUSR1)
		sig = sig * 2 + 0;
	else
		sig = sig * 2 + 1;
	if (count == 8)
	{
		ft_putchar(sig);
		sig = '\0';
		count = 0;
	}
}

int	main(void)
{
	ft_printf("SERVER PID : %d\n", getpid());
	signal(SIGUSR1, ft_print_signal);
	signal(SIGUSR2, ft_print_signal);
	while (1)
		pause();
	return (0);
}
