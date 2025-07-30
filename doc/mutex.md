
# CategoryMutex

SDL offers several thread synchronization primitives. This document can't
cover the complicated topic of thread safety, but reading up on what each
of these primitives are, why they are useful, and how to correctly use them
is vital to writing correct and safe multithreaded programs.

- Mutexes: SDL_CreateMutex()
- Read/Write locks: SDL_CreateRWLock()
- Semaphores: SDL_CreateSemaphore()
- Condition variables: SDL_CreateCondition()

SDL also offers a datatype, SDL_InitState, which can be used to make sure
only one thread initializes/deinitializes some resource that several
threads might try to use for the first time simultaneously.
