# Main Points
1. A program exists on a hard drive; a process exists in RAM
2. Program : Set of files that contains sets of instructions that are saved on the hard drive in a vegetative state.
3. Process :  At execution, the system loads the instruction to the RAM and executes them one after the other.
4. The OS can run several processes at the same time. It will allocate a memory zone to each one (i.e. stack, heap, instruction pointer, etc...). This means that each process is its own entity and cannot access each other memory or instructions.

## FORK : Creating a Child Process
The `fork` system call will allow our process to create a new process, which will be its exact clone and executed simultaneously. In the way, our initial process will be the parent the new process, its  child. In fact, the very name of the system call, `fork`, id like the fork of a family tree.

Prototype of `fork` :
```c
#inlcude <unistd.h>

pid_t fork(void);
```

### Distinguishing Between the Parent and Child Processes

Parents and Child processes can be differentiated based on their `PID : Process IDentifier` and `PPID : Parent Process IDentifier`.
When created through the `fork` command, the child process will be an exact clone of the parent and is executed simultaneously. Since `Child` is an exact clone of `Parent`, they will both have the same `PID` code.
The `fork` system call return value allows us to differentiate both processes as it does not return the same `PID` to the `Parent` and to the `Child`.
If `fork` returns :
+ `0` : This means we are in the `Child` process
+ `int > 0` : An positive integer is simply the `PID` and means that we are in the `Parent` process
+ `-1` : is returned in the event of an error

> NOTE: A `Child` process also inherit the `Parent` instruction pointer (or program counter) which contains the memory address of the current instruction. So if we fork a child in the middle of the execution of the parent process, the child will start at the same instruction at which it was forked and NOT all the way from the beginning of the program.

