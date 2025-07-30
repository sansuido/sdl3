
# CategoryEvents

Event queue management.

It's extremely common--often required--that an app deal with SDL's event
queue. Almost all useful information about interactions with the real world
flow through here: the user interacting with the computer and app, hardware
coming and going, the system changing in some way, etc.

An app generally takes a moment, perhaps at the start of a new frame, to
examine any events that have occured since the last time and process or
ignore them. This is generally done by calling SDL_PollEvent() in a loop
until it returns false (or, if using the main callbacks, events are
provided one at a time in calls to SDL_AppEvent() before the next call to
SDL_AppIterate(); in this scenario, the app does not call SDL_PollEvent()
at all).

There is other forms of control, too: SDL_PeepEvents() has more
functionality at the cost of more complexity, and SDL_WaitEvent() can block
the process until something interesting happens, which might be beneficial
for certain types of programs on low-power hardware. One may also call
SDL_AddEventWatch() to set a callback when new events arrive.

The app is free to generate their own events, too: SDL_PushEvent allows the
app to put events onto the queue for later retrieval; SDL_RegisterEvents
can guarantee that these events have a type that isn't in use by other
parts of the system.
