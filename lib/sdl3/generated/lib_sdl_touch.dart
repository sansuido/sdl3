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
/// This was fixed for Android in SDL 2.0.1.
///
/// \param count a pointer filled in with the number of devices returned, can
/// be NULL.
/// \returns a 0 terminated array of touch device IDs which should be freed
/// with SDL_free(), or NULL on error; call SDL_GetError() for more
/// details.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_TouchID *SDLCALL SDL_GetTouchDevices(int *count)
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
/// You do not own the returned string, do not modify or free it.
///
/// \param touchID the touch device instance ID.
/// \returns touch device name, or NULL on error; call SDL_GetError() for more
/// details.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC const char* SDLCALL SDL_GetTouchDeviceName(SDL_TouchID touchID)
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
/// \param touchID the ID of a touch device
/// \returns touch device type
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_TouchDeviceType SDLCALL SDL_GetTouchDeviceType(SDL_TouchID touchID)
/// ```
int sdlGetTouchDeviceType(int touchId) {
  final sdlGetTouchDeviceTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint64 touchId),
      int Function(int touchId)>('SDL_GetTouchDeviceType');
  return sdlGetTouchDeviceTypeLookupFunction(touchId);
}

///
/// Get the number of active fingers for a given touch device.
///
/// \param touchID the ID of a touch device
/// \returns the number of active fingers for a given touch device on success
/// or a negative error code on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetTouchFinger
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetNumTouchFingers(SDL_TouchID touchID)
/// ```
int sdlGetNumTouchFingers(int touchId) {
  final sdlGetNumTouchFingersLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint64 touchId),
      int Function(int touchId)>('SDL_GetNumTouchFingers');
  return sdlGetNumTouchFingersLookupFunction(touchId);
}

///
/// Get the finger object for specified touch device ID and finger index.
///
/// The returned resource is owned by SDL and should not be deallocated.
///
/// \param touchID the ID of the requested touch device
/// \param index the index of the requested finger
/// \returns a pointer to the SDL_Finger object or NULL if no object at the
/// given ID and index could be found.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_Finger * SDLCALL SDL_GetTouchFinger(SDL_TouchID touchID, int index)
/// ```
Pointer<SdlFinger> sdlGetTouchFinger(int touchId, int index) {
  final sdlGetTouchFingerLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlFinger> Function(Uint64 touchId, Int32 index),
      Pointer<SdlFinger> Function(
          int touchId, int index)>('SDL_GetTouchFinger');
  return sdlGetTouchFingerLookupFunction(touchId, index);
}
