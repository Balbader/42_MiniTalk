# MiniTalk
The purpose of this project is to code a small data exchange program
using UNIX signals.

## Project Instructions
You must create a communication program in the form of a client and a server.<br>
<br>
• The server must be started first. After its launch, it has to print its PID.<br>
<br>
• The client takes two parameters:<br>
> ◦ The server PID.<br>
> ◦ The string to send.<br>
<br>
• The client must send the string passed as a parameter to the server.<br>
<br>
• Once the string has been received, the server must print it.<br>
<br>
• The server has to display the string pretty quickly. Quickly means that if you think it takes too long, then it is probably too long.<br>
1 second for displaying 100 characters is way too much!<br>
<br>
• Your server should be able to receive strings from several clients in a row without needing to restart.<br>
<br>
• The communication between your client and your server has to be done only using UNIX signals.<br>
<br>
• You can only use these two signals: SIGUSR1 and SIGUSR2.<br>
<br>
• You have to turn in a Makefile which will compile your source files. It must not relink.<br>
<br>
• You can definitely use your libft.<br>
<br>
• You have to handle errors thoroughly. In no way your program should quit unexpectedly (segmentation fault, bus error, double free, and so forth).<br>
<br>
• Your program mustn’t have memory leaks.<br>
<br>
• You can have one global variable per program (one for the client and one for the server), but you will have to justify their use.<br>
<br>
• You are allowed to use the following functions:<br>

> ◦ write<br>
> ◦ ft_printf and any equivalent YOU coded<br>
> ◦ signal<br>
> ◦ sigemptyset<br>
> ◦ sigaddset<br>
> ◦ sigaction<br>
> ◦ kill<br>
> ◦ getpid<br>
> ◦ malloc<br>
> ◦ free<br>
> ◦ pause<br>
> ◦ sleep<br>
> ◦ usleep<br>
> ◦ exit<br>
