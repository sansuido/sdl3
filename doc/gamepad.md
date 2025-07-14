
# CategoryGamepad

SDL provides a low-level joystick API, which just treats joysticks as an
arbitrary pile of buttons, axes, and hat switches. If you're planning to
write your own control configuration screen, this can give you a lot of
flexibility, but that's a lot of work, and most things that we consider
"joysticks" now are actually console-style gamepads. So SDL provides the
gamepad API on top of the lower-level joystick functionality.

The difference between a joystick and a gamepad is that a gamepad tells you
_where_ a button or axis is on the device. You don't speak to gamepads in
terms of arbitrary numbers like "button 3" or "axis 2" but in standard
locations: the d-pad, the shoulder buttons, triggers, A/B/X/Y (or
X/O/Square/Triangle, if you will).

One turns a joystick into a gamepad by providing a magic configuration
string, which tells SDL the details of a specific device: when you see this
specific hardware, if button 2 gets pressed, this is actually D-Pad Up,
etc.

SDL has many popular controllers configured out of the box, and users can
add their own controller details through an environment variable if it's
otherwise unknown to SDL.

In order to use these functions, SDL_Init() must have been called with the
SDL_INIT_GAMEPAD flag. This causes SDL to scan the system for gamepads, and
load appropriate drivers.

If you would like to receive gamepad updates while the application is in
the background, you should set the following hint before calling
SDL_Init(): SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS

Gamepads support various optional features such as rumble, color LEDs,
touchpad, gyro, etc. The support for these features varies depending on the
controller and OS support available. You can check for LED and rumble
capabilities at runtime by calling SDL_GetGamepadProperties() and checking
the various capability properties. You can check for touchpad by calling
SDL_GetNumGamepadTouchpads() and check for gyro and accelerometer by
calling SDL_GamepadHasSensor().

By default SDL will try to use the most capable driver available, but you
can tune which OS drivers to use with the various joystick hints in
SDL_hints.h.

Your application should always support gamepad hotplugging. On some
platforms like Xbox, Steam Deck, etc., this is a requirement for
certification. On other platforms, like macOS and Windows when using
Windows.Gaming.Input, controllers may not be available at startup and will
come in at some point after you've started processing events.
