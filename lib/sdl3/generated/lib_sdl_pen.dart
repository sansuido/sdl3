// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl_pen.dart';

///
/// Get the device type of the given pen.
///
/// Many platforms do not supply this information, so an app must always be
/// prepared to get an SDL_PEN_DEVICE_TYPE_UNKNOWN result.
///
/// \param instance_id the pen instance ID.
/// \returns the device type of the given pen, or SDL_PEN_DEVICE_TYPE_INVALID
/// on failure; call SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.4.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PenDeviceType SDLCALL SDL_GetPenDeviceType(SDL_PenID instance_id)
/// ```
///
/// See also:
/// - [SDL_GetPenDeviceType - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetPenDeviceType)
///
/// {@category pen}
int sdlGetPenDeviceType(int instanceId) {
  final sdlGetPenDeviceTypeLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_GetPenDeviceType');
  return sdlGetPenDeviceTypeLookupFunction(instanceId);
}
