
# CategoryPen

SDL pen event handling.

SDL provides an API for pressure-sensitive pen (stylus and/or eraser)
handling, e.g., for input and drawing tablets or suitably equipped mobile /
tablet devices.

To get started with pens, simply handle SDL_EVENT_PEN_* events. When a pen
starts providing input, SDL will assign it a unique SDL_PenID, which will
remain for the life of the process, as long as the pen stays connected.

Pens may provide more than simple touch input; they might have other axes,
such as pressure, tilt, rotation, etc.
