#include <unistd.h>
#include <signal.h>

int main(void)
{
	struct sigaction sa;

	sigemptyset(&sa.sa_mask);
	sa.sa_flags = SA_RESTART | SA_SIGINFO;
	sa.sa_handler = SIG_IGN;
	sigaction(SIGINT, &sa, NULL);
	while (1)
		sleep(1);
	return (0);
}
