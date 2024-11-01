// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Get a list of registered touch devices.
///
/// On some platforms SDL first sees the touch device if it was actually used.
/// Therefore the returned list might be empty, although devices are available.
/// After using all devices at least once the number will be correct.
///
/// \param count a pointer filled in with the number of devices returned, may
/// be NULL.
/// \returns a 0 terminated array of touch device IDs or NULL on failure; call
/// SDL_GetError() for more information. This should be freed with
/// SDL_free() when it is no longer needed.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_TouchID * SDLCALL SDL_GetTouchDevices(int *count)
/// ```
Pointer<Uint64> sdlGetTouchDevices(Pointer<Int32> count) {
  final sdlGetTouchDevicesLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint64> Function(Pointer<Int32> count),
      Pointer<Uint64> Function(Pointer<Int32> count)>('SDL_GetTouchDevices');
  return sdlGetTouchDevicesLookupFunction(count);
}

///
/// Get the touch device name as reported from the driver.
///
/// \param touchID the touch device instance ID.
/// \returns touch device name, or NULL on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetTouchDeviceName(SDL_TouchID touchID)
/// ```
String? sdlGetTouchDeviceName(int touchId) {
  final sdlGetTouchDeviceNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint64 touchId),
      Pointer<Utf8> Function(int touchId)>('SDL_GetTouchDeviceName');
  final result = sdlGetTouchDeviceNameLookupFunction(touchId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the type of the given touch device.
///
/// \param touchID the ID of a touch device.
/// \returns touch device type.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_TouchDeviceType SDLCALL SDL_GetTouchDeviceType(SDL_TouchID touchID)
/// ```
int sdlGetTouchDeviceType(int touchId) {
  final sdlGetTouchDeviceTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint64 touchId),
      int Function(int touchId)>('SDL_GetTouchDeviceType');
  return sdlGetTouchDeviceTypeLookupFunction(touchId);
}

///
/// Get a list of active fingers for a given touch device.
///
/// \param touchID the ID of a touch device.
/// \param count a pointer filled in with the number of fingers returned, can
/// be NULL.
/// \returns a NULL terminated array of SDL_Finger pointers or NULL on failure;
/// call SDL_GetError() for more information. This is a single
/// allocation that should be freed with SDL_free() when it is no
/// longer needed.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Finger ** SDLCALL SDL_GetTouchFingers(SDL_TouchID touchID, int *count)
/// ```
Pointer<Pointer<SdlFinger>> sdlGetTouchFingers(
    int touchId, Pointer<Int32> count) {
  final sdlGetTouchFingersLookupFunction = libSdl3.lookupFunction<
      Pointer<Pointer<SdlFinger>> Function(
          Uint64 touchId, Pointer<Int32> count),
      Pointer<Pointer<SdlFinger>> Function(
          int touchId, Pointer<Int32> count)>('SDL_GetTouchFingers');
  return sdlGetTouchFingersLookupFunction(touchId, count);
}
