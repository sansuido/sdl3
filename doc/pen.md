
# CategoryPen

SDL pen event handling.

SDL provides an API for pressure-sensitive pen (stylus and/or eraser)
handling, e.g., for input and drawing tablets or suitably equipped mobile /
tablet devices.

To get started with pens, simply handle pen events:

- SDL_EVENT_PEN_PROXIMITY_IN, SDL_EVENT_PEN_PROXIMITY_OUT
  (SDL_PenProximityEvent)
- SDL_EVENT_PEN_DOWN, SDL_EVENT_PEN_UP (SDL_PenTouchEvent)
- SDL_EVENT_PEN_MOTION (SDL_PenMotionEvent)
- SDL_EVENT_PEN_BUTTON_DOWN, SDL_EVENT_PEN_BUTTON_UP (SDL_PenButtonEvent)
- SDL_EVENT_PEN_AXIS (SDL_PenAxisEvent)

When a pen starts providing input, SDL will assign it a unique SDL_PenID,
which will remain for the life of the process, as long as the pen stays
connected.

Pens may provide more than simple touch input; they might have other axes,
such as pressure, tilt, rotation, etc.
