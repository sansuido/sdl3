
# CategoryTouch

SDL offers touch input, on platforms that support it. It can manage
multiple touch devices and track multiple fingers on those devices.

Touches are mostly dealt with through the event system, in the
SDL_EVENT_FINGER_DOWN, SDL_EVENT_FINGER_MOTION, and SDL_EVENT_FINGER_UP
events, but there are also functions to query for hardware details, etc.

The touch system, by default, will also send virtual mouse events; this can
be useful for making a some desktop apps work on a phone without
significant changes. For apps that care about mouse and touch input
separately, they should ignore mouse events that have a `which` field of
SDL_TOUCH_MOUSEID.
