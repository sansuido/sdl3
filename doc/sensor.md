
# CategorySensor

SDL sensor management.

These APIs grant access to gyros and accelerometers on various platforms.

In order to use these functions, SDL_Init() must have been called with the
SDL_INIT_SENSOR flag. This causes SDL to scan the system for sensors, and
load appropriate drivers.
