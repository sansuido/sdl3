// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Use this function to get the number of built-in camera drivers.
///
/// This function returns a hardcoded number. This never returns a negative
/// value; if there are no drivers compiled into this build of SDL, this
/// function returns zero. The presence of a driver in this list does not mean
/// it will function, it just means SDL is capable of interacting with that
/// interface. For example, a build of SDL might have v4l2 support, but if
/// there's no kernel support available, SDL's v4l2 driver would fail if used.
///
/// By default, SDL tries all drivers, in its preferred order, until one is
/// found to be usable.
///
/// \returns the number of built-in camera drivers.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetCameraDriver
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumCameraDrivers(void)
/// ```
int sdlGetNumCameraDrivers() {
  final sdlGetNumCameraDriversLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>(
        'SDL_GetNumCameraDrivers',
      );
  return sdlGetNumCameraDriversLookupFunction();
}

///
/// Use this function to get the name of a built in camera driver.
///
/// The list of camera drivers is given in the order that they are normally
/// initialized by default; the drivers that seem more reasonable to choose
/// first (as far as the SDL developers believe) are earlier in the list.
///
/// The names of drivers are all simple, low-ASCII identifiers, like "v4l2",
/// "coremedia" or "android". These never have Unicode characters, and are not
/// meant to be proper names.
///
/// \param index the index of the camera driver; the value ranges from 0 to
/// SDL_GetNumCameraDrivers() - 1.
/// \returns the name of the camera driver at the requested index, or NULL if
/// an invalid index was specified.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetNumCameraDrivers
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetCameraDriver(int index)
/// ```
String? sdlGetCameraDriver(int index) {
  final sdlGetCameraDriverLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Utf8> Function(Int32 index),
        Pointer<Utf8> Function(int index)
      >('SDL_GetCameraDriver');
  final result = sdlGetCameraDriverLookupFunction(index);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the name of the current camera driver.
///
/// The names of drivers are all simple, low-ASCII identifiers, like "v4l2",
/// "coremedia" or "android". These never have Unicode characters, and are not
/// meant to be proper names.
///
/// \returns the name of the current camera driver or NULL if no driver has
/// been initialized.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetCurrentCameraDriver(void)
/// ```
String? sdlGetCurrentCameraDriver() {
  final sdlGetCurrentCameraDriverLookupFunction = libSdl3
      .lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'SDL_GetCurrentCameraDriver',
      );
  final result = sdlGetCurrentCameraDriverLookupFunction();
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get a list of currently connected camera devices.
///
/// \param count a pointer filled in with the number of cameras returned, may
/// be NULL.
/// \returns a 0 terminated array of camera instance IDs or NULL on failure;
/// call SDL_GetError() for more information. This should be freed
/// with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenCamera
///
/// ```c
/// extern SDL_DECLSPEC SDL_CameraID * SDLCALL SDL_GetCameras(int *count)
/// ```
Pointer<Uint32> sdlGetCameras(Pointer<Int32> count) {
  final sdlGetCamerasLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Uint32> Function(Pointer<Int32> count),
        Pointer<Uint32> Function(Pointer<Int32> count)
      >('SDL_GetCameras');
  return sdlGetCamerasLookupFunction(count);
}

///
/// Get the list of native formats/sizes a camera supports.
///
/// This returns a list of all formats and frame sizes that a specific camera
/// can offer. This is useful if your app can accept a variety of image formats
/// and sizes and so want to find the optimal spec that doesn't require
/// conversion.
///
/// This function isn't strictly required; if you call SDL_OpenCamera with a
/// NULL spec, SDL will choose a native format for you, and if you instead
/// specify a desired format, it will transparently convert to the requested
/// format on your behalf.
///
/// If `count` is not NULL, it will be filled with the number of elements in
/// the returned array.
///
/// Note that it's legal for a camera to supply an empty list. This is what
/// will happen on Emscripten builds, since that platform won't tell _anything_
/// about available cameras until you've opened one, and won't even tell if
/// there _is_ a camera until the user has given you permission to check
/// through a scary warning popup.
///
/// \param instance_id the camera device instance ID.
/// \param count a pointer filled in with the number of elements in the list,
/// may be NULL.
/// \returns a NULL terminated array of pointers to SDL_CameraSpec or NULL on
/// failure; call SDL_GetError() for more information. This is a
/// single allocation that should be freed with SDL_free() when it is
/// no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetCameras
/// \sa SDL_OpenCamera
///
/// ```c
/// extern SDL_DECLSPEC SDL_CameraSpec ** SDLCALL SDL_GetCameraSupportedFormats(SDL_CameraID instance_id, int *count)
/// ```
Pointer<Pointer<SdlCameraSpec>> sdlGetCameraSupportedFormats(
  int instanceId,
  Pointer<Int32> count,
) {
  final sdlGetCameraSupportedFormatsLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Pointer<SdlCameraSpec>> Function(
          Uint32 instanceId,
          Pointer<Int32> count,
        ),
        Pointer<Pointer<SdlCameraSpec>> Function(
          int instanceId,
          Pointer<Int32> count,
        )
      >('SDL_GetCameraSupportedFormats');
  return sdlGetCameraSupportedFormatsLookupFunction(instanceId, count);
}

///
/// Get the human-readable device name for a camera.
///
/// \param instance_id the camera device instance ID.
/// \returns a human-readable device name or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetCameras
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetCameraName(SDL_CameraID instance_id)
/// ```
String? sdlGetCameraName(int instanceId) {
  final sdlGetCameraNameLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Utf8> Function(Uint32 instanceId),
        Pointer<Utf8> Function(int instanceId)
      >('SDL_GetCameraName');
  final result = sdlGetCameraNameLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the position of the camera in relation to the system.
///
/// Most platforms will report UNKNOWN, but mobile devices, like phones, can
/// often make a distinction between cameras on the front of the device (that
/// points towards the user, for taking "selfies") and cameras on the back (for
/// filming in the direction the user is facing).
///
/// \param instance_id the camera device instance ID.
/// \returns the position of the camera on the system hardware.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetCameras
///
/// ```c
/// extern SDL_DECLSPEC SDL_CameraPosition SDLCALL SDL_GetCameraPosition(SDL_CameraID instance_id)
/// ```
int sdlGetCameraPosition(int instanceId) {
  final sdlGetCameraPositionLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_GetCameraPosition');
  return sdlGetCameraPositionLookupFunction(instanceId);
}

///
/// Open a video recording device (a "camera").
///
/// You can open the device with any reasonable spec, and if the hardware can't
/// directly support it, it will convert data seamlessly to the requested
/// format. This might incur overhead, including scaling of image data.
///
/// If you would rather accept whatever format the device offers, you can pass
/// a NULL spec here and it will choose one for you (and you can use
/// SDL_Surface's conversion/scaling functions directly if necessary).
///
/// You can call SDL_GetCameraFormat() to get the actual data format if passing
/// a NULL spec here. You can see the exact specs a device can support without
/// conversion with SDL_GetCameraSupportedFormats().
///
/// SDL will not attempt to emulate framerate; it will try to set the hardware
/// to the rate closest to the requested speed, but it won't attempt to limit
/// or duplicate frames artificially; call SDL_GetCameraFormat() to see the
/// actual framerate of the opened the device, and check your timestamps if
/// this is crucial to your app!
///
/// Note that the camera is not usable until the user approves its use! On some
/// platforms, the operating system will prompt the user to permit access to
/// the camera, and they can choose Yes or No at that point. Until they do, the
/// camera will not be usable. The app should either wait for an
/// SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event,
/// or poll SDL_GetCameraPermissionState() occasionally until it returns
/// non-zero. On platforms that don't require explicit user approval (and
/// perhaps in places where the user previously permitted access), the approval
/// event might come immediately, but it might come seconds, minutes, or hours
/// later!
///
/// \param instance_id the camera device instance ID.
/// \param spec the desired format for data the device will provide. Can be
/// NULL.
/// \returns an SDL_Camera object or NULL on failure; call SDL_GetError() for
/// more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetCameras
/// \sa SDL_GetCameraFormat
///
/// ```c
/// extern SDL_DECLSPEC SDL_Camera * SDLCALL SDL_OpenCamera(SDL_CameraID instance_id, const SDL_CameraSpec *spec)
/// ```
Pointer<SdlCamera> sdlOpenCamera(int instanceId, Pointer<SdlCameraSpec> spec) {
  final sdlOpenCameraLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlCamera> Function(
          Uint32 instanceId,
          Pointer<SdlCameraSpec> spec,
        ),
        Pointer<SdlCamera> Function(int instanceId, Pointer<SdlCameraSpec> spec)
      >('SDL_OpenCamera');
  return sdlOpenCameraLookupFunction(instanceId, spec);
}

///
/// Query if camera access has been approved by the user.
///
/// Cameras will not function between when the device is opened by the app and
/// when the user permits access to the hardware. On some platforms, this
/// presents as a popup dialog where the user has to explicitly approve access;
/// on others the approval might be implicit and not alert the user at all.
///
/// This function can be used to check the status of that approval. It will
/// return 0 if still waiting for user response, 1 if the camera is approved
/// for use, and -1 if the user denied access.
///
/// Instead of polling with this function, you can wait for a
/// SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event
/// in the standard SDL event loop, which is guaranteed to be sent once when
/// permission to use the camera is decided.
///
/// If a camera is declined, there's nothing to be done but call
/// SDL_CloseCamera() to dispose of it.
///
/// \param camera the opened camera device to query.
/// \returns -1 if user denied access to the camera, 1 if user approved access,
/// 0 if no decision has been made yet.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenCamera
/// \sa SDL_CloseCamera
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetCameraPermissionState(SDL_Camera *camera)
/// ```
int sdlGetCameraPermissionState(Pointer<SdlCamera> camera) {
  final sdlGetCameraPermissionStateLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Pointer<SdlCamera> camera),
        int Function(Pointer<SdlCamera> camera)
      >('SDL_GetCameraPermissionState');
  return sdlGetCameraPermissionStateLookupFunction(camera);
}

///
/// Get the instance ID of an opened camera.
///
/// \param camera an SDL_Camera to query.
/// \returns the instance ID of the specified camera on success or 0 on
/// failure; call SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenCamera
///
/// ```c
/// extern SDL_DECLSPEC SDL_CameraID SDLCALL SDL_GetCameraID(SDL_Camera *camera)
/// ```
int sdlGetCameraId(Pointer<SdlCamera> camera) {
  final sdlGetCameraIdLookupFunction = libSdl3
      .lookupFunction<
        Uint32 Function(Pointer<SdlCamera> camera),
        int Function(Pointer<SdlCamera> camera)
      >('SDL_GetCameraID');
  return sdlGetCameraIdLookupFunction(camera);
}

///
/// Get the properties associated with an opened camera.
///
/// \param camera the SDL_Camera obtained from SDL_OpenCamera().
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetCameraProperties(SDL_Camera *camera)
/// ```
int sdlGetCameraProperties(Pointer<SdlCamera> camera) {
  final sdlGetCameraPropertiesLookupFunction = libSdl3
      .lookupFunction<
        Uint32 Function(Pointer<SdlCamera> camera),
        int Function(Pointer<SdlCamera> camera)
      >('SDL_GetCameraProperties');
  return sdlGetCameraPropertiesLookupFunction(camera);
}

///
/// Get the spec that a camera is using when generating images.
///
/// Note that this might not be the native format of the hardware, as SDL might
/// be converting to this format behind the scenes.
///
/// If the system is waiting for the user to approve access to the camera, as
/// some platforms require, this will return false, but this isn't necessarily
/// a fatal error; you should either wait for an
/// SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event,
/// or poll SDL_GetCameraPermissionState() occasionally until it returns
/// non-zero.
///
/// \param camera opened camera device.
/// \param spec the SDL_CameraSpec to be initialized by this function.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenCamera
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetCameraFormat(SDL_Camera *camera, SDL_CameraSpec *spec)
/// ```
bool sdlGetCameraFormat(
  Pointer<SdlCamera> camera,
  Pointer<SdlCameraSpec> spec,
) {
  final sdlGetCameraFormatLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlCamera> camera, Pointer<SdlCameraSpec> spec),
        int Function(Pointer<SdlCamera> camera, Pointer<SdlCameraSpec> spec)
      >('SDL_GetCameraFormat');
  return sdlGetCameraFormatLookupFunction(camera, spec) == 1;
}

///
/// Acquire a frame.
///
/// The frame is a memory pointer to the image data, whose size and format are
/// given by the spec requested when opening the device.
///
/// This is a non blocking API. If there is a frame available, a non-NULL
/// surface is returned, and timestampNS will be filled with a non-zero value.
///
/// Note that an error case can also return NULL, but a NULL by itself is
/// normal and just signifies that a new frame is not yet available. Note that
/// even if a camera device fails outright (a USB camera is unplugged while in
/// use, etc), SDL will send an event separately to notify the app, but
/// continue to provide blank frames at ongoing intervals until
/// SDL_CloseCamera() is called, so real failure here is almost always an out
/// of memory condition.
///
/// After use, the frame should be released with SDL_ReleaseCameraFrame(). If
/// you don't do this, the system may stop providing more video!
///
/// Do not call SDL_DestroySurface() on the returned surface! It must be given
/// back to the camera subsystem with SDL_ReleaseCameraFrame!
///
/// If the system is waiting for the user to approve access to the camera, as
/// some platforms require, this will return NULL (no frames available); you
/// should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or
/// SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll
/// SDL_GetCameraPermissionState() occasionally until it returns non-zero.
///
/// \param camera opened camera device.
/// \param timestampNS a pointer filled in with the frame's timestamp, or 0 on
/// error. Can be NULL.
/// \returns a new frame of video on success, NULL if none is currently
/// available.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ReleaseCameraFrame
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_AcquireCameraFrame(SDL_Camera *camera, Uint64 *timestampNS)
/// ```
Pointer<SdlSurface> sdlAcquireCameraFrame(
  Pointer<SdlCamera> camera,
  Pointer<Uint64> timestampNs,
) {
  final sdlAcquireCameraFrameLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<SdlCamera> camera,
          Pointer<Uint64> timestampNs,
        ),
        Pointer<SdlSurface> Function(
          Pointer<SdlCamera> camera,
          Pointer<Uint64> timestampNs,
        )
      >('SDL_AcquireCameraFrame');
  return sdlAcquireCameraFrameLookupFunction(camera, timestampNs);
}

///
/// Release a frame of video acquired from a camera.
///
/// Let the back-end re-use the internal buffer for camera.
///
/// This function _must_ be called only on surface objects returned by
/// SDL_AcquireCameraFrame(). This function should be called as quickly as
/// possible after acquisition, as SDL keeps a small FIFO queue of surfaces for
/// video frames; if surfaces aren't released in a timely manner, SDL may drop
/// upcoming video frames from the camera.
///
/// If the app needs to keep the surface for a significant time, they should
/// make a copy of it and release the original.
///
/// The app should not use the surface again after calling this function;
/// assume the surface is freed and the pointer is invalid.
///
/// \param camera opened camera device.
/// \param frame the video frame surface to release.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AcquireCameraFrame
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseCameraFrame(SDL_Camera *camera, SDL_Surface *frame)
/// ```
void sdlReleaseCameraFrame(
  Pointer<SdlCamera> camera,
  Pointer<SdlSurface> frame,
) {
  final sdlReleaseCameraFrameLookupFunction = libSdl3
      .lookupFunction<
        Void Function(Pointer<SdlCamera> camera, Pointer<SdlSurface> frame),
        void Function(Pointer<SdlCamera> camera, Pointer<SdlSurface> frame)
      >('SDL_ReleaseCameraFrame');
  return sdlReleaseCameraFrameLookupFunction(camera, frame);
}

///
/// Use this function to shut down camera processing and close the camera
/// device.
///
/// \param camera opened camera device.
///
/// \threadsafety It is safe to call this function from any thread, but no
/// thread may reference `device` once this function is called.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenCamera
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_CloseCamera(SDL_Camera *camera)
/// ```
void sdlCloseCamera(Pointer<SdlCamera> camera) {
  final sdlCloseCameraLookupFunction = libSdl3
      .lookupFunction<
        Void Function(Pointer<SdlCamera> camera),
        void Function(Pointer<SdlCamera> camera)
      >('SDL_CloseCamera');
  return sdlCloseCameraLookupFunction(camera);
}
