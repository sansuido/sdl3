
# CategoryProcess

Process control support.

These functions provide a cross-platform way to spawn and manage OS-level
processes.

You can create a new subprocess with SDL_CreateProcess() and optionally
read and write to it using SDL_ReadProcess() or SDL_GetProcessInput() and
SDL_GetProcessOutput(). If more advanced functionality like chaining input
between processes is necessary, you can use
SDL_CreateProcessWithProperties().

You can get the status of a created process with SDL_WaitProcess(), or
terminate the process with SDL_KillProcess().

Don't forget to call SDL_DestroyProcess() to clean up, whether the process
process was killed, terminated on its own, or is still running!
