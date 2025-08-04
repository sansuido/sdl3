
# CategoryJoystick

SDL joystick support.

This is the lower-level joystick handling. If you want the simpler option,
where what each button does is well-defined, you should use the gamepad API
instead.

The term "instance_id" is the current instantiation of a joystick device in
the system. If the joystick is removed and then re-inserted then it will
get a new instance_id. instance_id's are monotonically increasing
identifiers of a joystick plugged in.

The term "player_index" is the number assigned to a player on a specific
controller. For XInput controllers this returns the XInput user index. Many
joysticks will not be able to supply this information.

SDL_GUID is used as a stable 128-bit identifier for a joystick device that
does not change over time. It identifies class of the device (a X360 wired
controller for example). This identifier is platform dependent.

In order to use these functions, SDL_Init() must have been called with the
SDL_INIT_JOYSTICK flag. This causes SDL to scan the system for joysticks,
and load appropriate drivers.

If you would like to receive joystick updates while the application is in
the background, you should set the following hint before calling
SDL_Init(): SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS

SDL can provide virtual joysticks as well: the app defines an imaginary
controller with SDL_AttachVirtualJoystick(), and then can provide inputs
for it via SDL_SetJoystickVirtualAxis(), SDL_SetJoystickVirtualButton(),
etc. As this data is supplied, it will look like a normal joystick to SDL,
just not backed by a hardware driver. This has been used to make unusual
devices, like VR headset controllers, look like normal joysticks, or
provide recording/playback of game inputs, etc.
