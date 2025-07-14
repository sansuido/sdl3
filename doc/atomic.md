
# CategoryAtomic

Atomic operations.

IMPORTANT: If you are not an expert in concurrent lockless programming, you
should not be using any functions in this file. You should be protecting
your data structures with full mutexes instead.

***Seriously, here be dragons!***

You can find out a little more about lockless programming and the subtle
issues that can arise here:
https://learn.microsoft.com/en-us/windows/win32/dxtecharts/lockless-programming

There's also lots of good information here:

- https://www.1024cores.net/home/lock-free-algorithms
- https://preshing.com/

These operations may or may not actually be implemented using processor
specific atomic operations. When possible they are implemented as true
processor specific atomic operations. When that is not possible the are
implemented using locks that *do* use the available atomic operations.

All of the atomic operations that modify memory are full memory barriers.
