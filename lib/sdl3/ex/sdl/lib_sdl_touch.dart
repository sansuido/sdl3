part of '../../sdl.dart';

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
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_TouchID * SDLCALL SDL_GetTouchDevices(int *count)
/// ```
/// {@category touch}
List<int> sdlxGetTouchDevices() {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final devicesPointer = sdlGetTouchDevices(countPointer);
  if (devicesPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(devicesPointer[i]);
    }
    sdlFree(devicesPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
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
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Finger ** SDLCALL SDL_GetTouchFingers(SDL_TouchID touchID, int *count)
/// ```
/// {@category touch}
List<Pointer<SdlFinger>> sdlxGetTouchFingers(int touchId) {
  final result = <Pointer<SdlFinger>>[];
  final countPointer = ffi.calloc<Int32>();
  final fingersPointer = sdlGetTouchFingers(touchId, countPointer);
  if (fingersPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(fingersPointer[i]);
    }
    sdlFree(fingersPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}
