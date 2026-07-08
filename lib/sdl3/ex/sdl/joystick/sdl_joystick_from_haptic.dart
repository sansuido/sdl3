part of '../../../sdl.dart';

extension SdlJoystickPointerFromJHapticEx on Pointer<SdlJoystick> {
  ///
  /// Query if a joystick has haptic features.
  ///
  /// \param joystick the SDL_Joystick to test for haptic capabilities.
  /// \returns true if the joystick is haptic or false if it isn't.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_OpenHapticFromJoystick
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_IsJoystickHaptic(SDL_Joystick *joystick)
  /// ```
  /// {@category haptic}
  bool isHaptic() => sdlIsJoystickHaptic(this);

  ///
  /// Open a haptic device for use from a joystick device.
  ///
  /// You must still close the haptic device separately. It will not be closed
  /// with the joystick.
  ///
  /// When opened from a joystick you should first close the haptic device before
  /// closing the joystick device. If not, on some implementations the haptic
  /// device will also get unallocated and you'll be unable to use force feedback
  /// on that device.
  ///
  /// \param joystick the SDL_Joystick to create a haptic device from.
  /// \returns a valid haptic device identifier on success or NULL on failure;
  /// call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CloseHaptic
  /// \sa SDL_IsJoystickHaptic
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Haptic * SDLCALL SDL_OpenHapticFromJoystick(SDL_Joystick *joystick)
  /// ```
  /// {@category haptic}
  Pointer<SdlHaptic> openHaptic() => sdlOpenHapticFromJoystick(this);
}
