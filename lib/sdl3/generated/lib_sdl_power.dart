// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

///
/// Get the current power supply details.
///
/// You should never take a battery status as absolute truth. Batteries
/// (especially failing batteries) are delicate hardware, and the values
/// reported here are best estimates based on what that hardware reports. It's
/// not uncommon for older batteries to lose stored power much faster than it
/// reports, or completely drain when reporting it has 20 percent left, etc.
///
/// Battery status can change at any time; if you are concerned with power
/// state, you should call this function frequently, and perhaps ignore changes
/// until they seem to be stable for a few seconds.
///
/// It's possible a platform can only report battery percentage or time left
/// but not both.
///
/// On some platforms, retrieving power supply details might be expensive. If
/// you want to display continuous status you could call this function every
/// minute or so.
///
/// \param seconds a pointer filled in with the seconds of battery life left,
/// or NULL to ignore. This will be filled in with -1 if we
/// can't determine a value or there is no battery.
/// \param percent a pointer filled in with the percentage of battery life
/// left, between 0 and 100, or NULL to ignore. This will be
/// filled in with -1 we can't determine a value or there is no
/// battery.
/// \returns the current battery state or `SDL_POWERSTATE_ERROR` on failure;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PowerState SDLCALL SDL_GetPowerInfo(int *seconds, int *percent)
/// ```
/// {@category power}
int sdlGetPowerInfo(Pointer<Int32> seconds, Pointer<Int32> percent) {
  final sdlGetPowerInfoLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Pointer<Int32> seconds, Pointer<Int32> percent),
        int Function(Pointer<Int32> seconds, Pointer<Int32> percent)
      >('SDL_GetPowerInfo');
  return sdlGetPowerInfoLookupFunction(seconds, percent);
}
