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
