
# CategoryMouse

Any GUI application has to deal with the mouse, and SDL provides functions
to manage mouse input and the displayed cursor.

Most interactions with the mouse will come through the event subsystem.
Moving a mouse generates an SDL_EVENT_MOUSE_MOTION event, pushing a button
generates SDL_EVENT_MOUSE_BUTTON_DOWN, etc, but one can also query the
current state of the mouse at any time with SDL_GetMouseState().

For certain games, it's useful to disassociate the mouse cursor from mouse
input. An FPS, for example, would not want the player's motion to stop as
the mouse hits the edge of the window. For these scenarios, use
SDL_SetWindowRelativeMouseMode(), which hides the cursor, grabs mouse input
to the window, and reads mouse input no matter how far it moves.

Games that want the system to track the mouse but want to draw their own
cursor can use SDL_HideCursor() and SDL_ShowCursor(). It might be more
efficient to let the system manage the cursor, if possible, using
SDL_SetCursor() with a custom image made through SDL_CreateColorCursor(),
or perhaps just a specific system cursor from SDL_CreateSystemCursor().

SDL can, on many platforms, differentiate between multiple connected mice,
allowing for interesting input scenarios and multiplayer games. They can be
enumerated with SDL_GetMice(), and SDL will send SDL_EVENT_MOUSE_ADDED and
SDL_EVENT_MOUSE_REMOVED events as they are connected and unplugged.

Since many apps only care about basic mouse input, SDL offers a virtual
mouse device for touch and pen input, which often can make a desktop
application work on a touchscreen phone without any code changes. Apps that
care about touch/pen separately from mouse input should filter out events
with a `which` field of SDL_TOUCH_MOUSEID/SDL_PEN_MOUSEID.
