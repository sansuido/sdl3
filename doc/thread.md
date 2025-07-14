
# CategoryThread

SDL offers cross-platform thread management functions. These are mostly
concerned with starting threads, setting their priority, and dealing with
their termination.

In addition, there is support for Thread Local Storage (data that is unique
to each thread, but accessed from a single key).

On platforms without thread support (such as Emscripten when built without
pthreads), these functions still exist, but things like SDL_CreateThread()
will report failure without doing anything.

If you're going to work with threads, you almost certainly need to have a
good understanding of [CategoryMutex](CategoryMutex) as well.
