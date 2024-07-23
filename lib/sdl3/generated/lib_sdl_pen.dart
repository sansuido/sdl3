// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Retrieves all pens that are connected to the system.
///
/// Yields an array of SDL_PenID values. These identify and track pens
/// throughout a session. To track pens across sessions (program restart), use
/// SDL_GUID .
///
/// \param count the number of pens in the array (number of array elements
/// minus 1, i.e., not counting the terminator 0).
/// \returns a 0 terminated array of SDL_PenID values, or NULL on failure. The
/// array must be freed with SDL_free(). On a NULL return,
/// SDL_GetError() is set.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PenID * SDLCALL SDL_GetPens(int *count)
/// ```
Pointer<Uint32> sdlGetPens(Pointer<Int32> count) {
  final sdlGetPensLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(Pointer<Int32> count)>('SDL_GetPens');
  return sdlGetPensLookupFunction(count);
}

///
/// Retrieves the pen's current status.
///
/// If the pen is detached (cf. SDL_PenConnected), this operation may return
/// default values.
///
/// \param instance_id the pen to query.
/// \param x out-mode parameter for pen x coordinate. May be NULL.
/// \param y out-mode parameter for pen y coordinate. May be NULL.
/// \param axes out-mode parameter for axis information. May be null. The axes
/// are in the same order as SDL_PenAxis.
/// \param num_axes maximum number of axes to write to "axes".
/// \returns a bit mask with the current pen button states (SDL_BUTTON_LMASK
/// etc.), possibly SDL_PEN_DOWN_MASK, and exactly one of
/// SDL_PEN_INK_MASK or SDL_PEN_ERASER_MASK , or 0 on error (see
/// SDL_GetError()).
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_GetPenStatus(SDL_PenID instance_id, float *x, float *y, float *axes, size_t num_axes)
/// ```
int sdlGetPenStatus(int instanceId, Pointer<Float> x, Pointer<Float> y,
    Pointer<Float> axes, int numAxes) {
  final sdlGetPenStatusLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Uint32 instanceId, Pointer<Float> x, Pointer<Float> y,
          Pointer<Float> axes, Uint32 numAxes),
      int Function(int instanceId, Pointer<Float> x, Pointer<Float> y,
          Pointer<Float> axes, int numAxes)>('SDL_GetPenStatus');
  return sdlGetPenStatusLookupFunction(instanceId, x, y, axes, numAxes);
}

///
/// Retrieves an SDL_PenID for the given SDL_GUID.
///
/// \param guid a pen GUID.
/// \returns a valid SDL_PenID, or SDL_PEN_INVALID if there is no matching
/// SDL_PenID.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PenID SDLCALL SDL_GetPenFromGUID(SDL_GUID guid)
/// ```
int sdlGetPenFromGuid(SdlGuid guid) {
  final sdlGetPenFromGuidLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(SdlGuid guid),
      int Function(SdlGuid guid)>('SDL_GetPenFromGUID');
  return sdlGetPenFromGuidLookupFunction(guid);
}

///
/// Retrieves the SDL_GUID for a given SDL_PenID.
///
/// \param instance_id the pen to query.
/// \returns the corresponding pen GUID; persistent across multiple sessions.
/// If "instance_id" is SDL_PEN_INVALID, returns an all-zeroes GUID.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GUID SDLCALL SDL_GetPenGUID(SDL_PenID instance_id)
/// ```
SdlGuid sdlGetPenGuid(int instanceId) {
  final sdlGetPenGuidLookupFunction = libSdl3.lookupFunction<
      SdlGuid Function(Uint32 instanceId),
      SdlGuid Function(int instanceId)>('SDL_GetPenGUID');
  return sdlGetPenGuidLookupFunction(instanceId);
}

///
/// Checks whether a pen is still attached.
///
/// If a pen is detached, it will not show up for SDL_GetPens(). Other
/// operations will still be available but may return default values.
///
/// \param instance_id a pen ID.
/// \returns SDL_TRUE if "instance_id" is valid and the corresponding pen is
/// attached, or SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_PenConnected(SDL_PenID instance_id)
/// ```
bool sdlPenConnected(int instanceId) {
  final sdlPenConnectedLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_PenConnected');
  return sdlPenConnectedLookupFunction(instanceId) == 1;
}

///
/// Retrieves a human-readable description for a SDL_PenID.
///
/// This returns temporary memory which will be automatically freed later, and
/// can be claimed with SDL_ClaimTemporaryMemory().
///
/// \param instance_id the pen to query.
/// \returns a string that contains the name of the pen, intended for human
/// consumption. The string might or might not be localised, depending
/// on platform settings. It is not guaranteed to be unique; use
/// SDL_GetPenGUID() for (best-effort) unique identifiers. The pointer
/// is managed by the SDL pen subsystem and must not be deallocated.
/// The pointer remains valid until SDL is shut down. Returns NULL on
/// error (cf. SDL_GetError()).
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetPenName(SDL_PenID instance_id)
/// ```
String? sdlGetPenName(int instanceId) {
  final sdlGetPenNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 instanceId),
      Pointer<Utf8> Function(int instanceId)>('SDL_GetPenName');
  final result = sdlGetPenNameLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Retrieves capability flags for a given SDL_PenID.
///
/// \param instance_id the pen to query.
/// \param capabilities detail information about pen capabilities, such as the
/// number of buttons.
/// \returns a set of capability flags, cf. SDL_PEN_CAPABILITIES.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PenCapabilityFlags SDLCALL SDL_GetPenCapabilities(SDL_PenID instance_id, SDL_PenCapabilityInfo *capabilities)
/// ```
int sdlGetPenCapabilities(
    int instanceId, Pointer<SdlPenCapabilityInfo> capabilities) {
  final sdlGetPenCapabilitiesLookupFunction = libSdl3.lookupFunction<
          Uint32 Function(
              Uint32 instanceId, Pointer<SdlPenCapabilityInfo> capabilities),
          int Function(
              int instanceId, Pointer<SdlPenCapabilityInfo> capabilities)>(
      'SDL_GetPenCapabilities');
  return sdlGetPenCapabilitiesLookupFunction(instanceId, capabilities);
}

///
/// Retrieves the pen type for a given SDL_PenID.
///
/// \param instance_id the pen to query.
/// \returns the corresponding pen type (cf. SDL_PenSubtype) or 0 on error.
/// Note that the pen type does not dictate whether the pen tip is
/// SDL_PEN_TIP_INK or SDL_PEN_TIP_ERASER; to determine whether a pen
/// is being used for drawing or in eraser mode, check either the pen
/// tip on SDL_EVENT_PEN_DOWN, or the flag SDL_PEN_ERASER_MASK in the
/// pen state.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PenSubtype SDLCALL SDL_GetPenType(SDL_PenID instance_id)
/// ```
int sdlGetPenType(int instanceId) {
  final sdlGetPenTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetPenType');
  return sdlGetPenTypeLookupFunction(instanceId);
}
