// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Get a list of currently connected video capture devices.
///
/// \param count a pointer filled in with the number of video capture devices
/// \returns a 0 terminated array of video capture instance IDs which should be
/// freed with SDL_free(), or NULL on error; call SDL_GetError() for
/// more details.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_OpenVideoCapture
///
/// ```c
/// extern DECLSPEC SDL_VideoCaptureDeviceID *SDLCALL SDL_GetVideoCaptureDevices(int *count)
/// ```
Pointer<Uint32> sdlGetVideoCaptureDevices(Pointer<Int32> count) {
  final sdlGetVideoCaptureDevicesLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(
          Pointer<Int32> count)>('SDL_GetVideoCaptureDevices');
  return sdlGetVideoCaptureDevicesLookupFunction(count);
}

///
/// Open a Video Capture device
///
/// \param instance_id the video capture device instance ID
/// \returns device, or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetVideoCaptureDeviceName
/// \sa SDL_GetVideoCaptureDevices
/// \sa SDL_OpenVideoCaptureWithSpec
///
/// ```c
/// extern DECLSPEC SDL_VideoCaptureDevice *SDLCALL SDL_OpenVideoCapture(SDL_VideoCaptureDeviceID instance_id)
/// ```
Pointer<SdlVideoCaptureDevice> sdlOpenVideoCapture(int instanceId) {
  final sdlOpenVideoCaptureLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlVideoCaptureDevice> Function(Uint32 instanceId),
      Pointer<SdlVideoCaptureDevice> Function(
          int instanceId)>('SDL_OpenVideoCapture');
  return sdlOpenVideoCaptureLookupFunction(instanceId);
}

///
/// Set specification
///
/// \param device opened video capture device
/// \param desired desired video capture spec
/// \param obtained obtained video capture spec
/// \param allowed_changes allow changes or not
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_OpenVideoCapture
/// \sa SDL_OpenVideoCaptureWithSpec
/// \sa SDL_GetVideoCaptureSpec
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetVideoCaptureSpec(SDL_VideoCaptureDevice *device, const SDL_VideoCaptureSpec *desired, SDL_VideoCaptureSpec *obtained, int allowed_changes)
/// ```
int sdlSetVideoCaptureSpec(
    Pointer<SdlVideoCaptureDevice> device,
    Pointer<SdlVideoCaptureSpec> desired,
    Pointer<SdlVideoCaptureSpec> obtained,
    int allowedChanges) {
  final sdlSetVideoCaptureSpecLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlVideoCaptureDevice> device,
          Pointer<SdlVideoCaptureSpec> desired,
          Pointer<SdlVideoCaptureSpec> obtained,
          Int32 allowedChanges),
      int Function(
          Pointer<SdlVideoCaptureDevice> device,
          Pointer<SdlVideoCaptureSpec> desired,
          Pointer<SdlVideoCaptureSpec> obtained,
          int allowedChanges)>('SDL_SetVideoCaptureSpec');
  return sdlSetVideoCaptureSpecLookupFunction(
      device, desired, obtained, allowedChanges);
}

///
/// Open a Video Capture device and set specification
///
/// \param instance_id the video capture device instance ID
/// \param desired desired video capture spec
/// \param obtained obtained video capture spec
/// \param allowed_changes allow changes or not
/// \returns device, or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_OpenVideoCapture
/// \sa SDL_SetVideoCaptureSpec
/// \sa SDL_GetVideoCaptureSpec
///
/// ```c
/// extern DECLSPEC SDL_VideoCaptureDevice *SDLCALL SDL_OpenVideoCaptureWithSpec(SDL_VideoCaptureDeviceID instance_id, const SDL_VideoCaptureSpec *desired, SDL_VideoCaptureSpec *obtained, int allowed_changes)
/// ```
Pointer<SdlVideoCaptureDevice> sdlOpenVideoCaptureWithSpec(
    int instanceId,
    Pointer<SdlVideoCaptureSpec> desired,
    Pointer<SdlVideoCaptureSpec> obtained,
    int allowedChanges) {
  final sdlOpenVideoCaptureWithSpecLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlVideoCaptureDevice> Function(
          Uint32 instanceId,
          Pointer<SdlVideoCaptureSpec> desired,
          Pointer<SdlVideoCaptureSpec> obtained,
          Int32 allowedChanges),
      Pointer<SdlVideoCaptureDevice> Function(
          int instanceId,
          Pointer<SdlVideoCaptureSpec> desired,
          Pointer<SdlVideoCaptureSpec> obtained,
          int allowedChanges)>('SDL_OpenVideoCaptureWithSpec');
  return sdlOpenVideoCaptureWithSpecLookupFunction(
      instanceId, desired, obtained, allowedChanges);
}

///
/// Get device name
///
/// \param instance_id the video capture device instance ID
/// \returns device name, shouldn't be freed
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetVideoCaptureDevices
///
/// ```c
/// extern DECLSPEC const char * SDLCALL SDL_GetVideoCaptureDeviceName(SDL_VideoCaptureDeviceID instance_id)
/// ```
String? sdlGetVideoCaptureDeviceName(int instanceId) {
  final sdlGetVideoCaptureDeviceNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 instanceId),
      Pointer<Utf8> Function(int instanceId)>('SDL_GetVideoCaptureDeviceName');
  final result = sdlGetVideoCaptureDeviceNameLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the obtained video capture spec
///
/// \param device opened video capture device
/// \param spec The SDL_VideoCaptureSpec to be initialized by this function.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetVideoCaptureSpec
/// \sa SDL_OpenVideoCaptureWithSpec
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetVideoCaptureSpec(SDL_VideoCaptureDevice *device, SDL_VideoCaptureSpec *spec)
/// ```
int sdlGetVideoCaptureSpec(
    Pointer<SdlVideoCaptureDevice> device, Pointer<SdlVideoCaptureSpec> spec) {
  final sdlGetVideoCaptureSpecLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlVideoCaptureDevice> device,
          Pointer<SdlVideoCaptureSpec> spec),
      int Function(Pointer<SdlVideoCaptureDevice> device,
          Pointer<SdlVideoCaptureSpec> spec)>('SDL_GetVideoCaptureSpec');
  return sdlGetVideoCaptureSpecLookupFunction(device, spec);
}

///
/// Get frame format of video capture device.
///
/// The value can be used to fill SDL_VideoCaptureSpec structure.
///
/// \param device opened video capture device
/// \param index format between 0 and num -1
/// \param format pointer output format (SDL_PixelFormatEnum)
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetNumVideoCaptureFormats
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetVideoCaptureFormat(SDL_VideoCaptureDevice *device, int index, Uint32 *format)
/// ```
int sdlGetVideoCaptureFormat(
    Pointer<SdlVideoCaptureDevice> device, int index, Pointer<Uint32> format) {
  final sdlGetVideoCaptureFormatLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlVideoCaptureDevice> device, Int32 index,
          Pointer<Uint32> format),
      int Function(Pointer<SdlVideoCaptureDevice> device, int index,
          Pointer<Uint32> format)>('SDL_GetVideoCaptureFormat');
  return sdlGetVideoCaptureFormatLookupFunction(device, index, format);
}

///
/// Number of available formats for the device
///
/// \param device opened video capture device
/// \returns number of formats or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetVideoCaptureFormat
/// \sa SDL_SetVideoCaptureSpec
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetNumVideoCaptureFormats(SDL_VideoCaptureDevice *device)
/// ```
int sdlGetNumVideoCaptureFormats(Pointer<SdlVideoCaptureDevice> device) {
  final sdlGetNumVideoCaptureFormatsLookupFunction = libSdl3.lookupFunction<
          Int32 Function(Pointer<SdlVideoCaptureDevice> device),
          int Function(Pointer<SdlVideoCaptureDevice> device)>(
      'SDL_GetNumVideoCaptureFormats');
  return sdlGetNumVideoCaptureFormatsLookupFunction(device);
}

///
/// Get frame sizes of the device and the specified input format.
///
/// The value can be used to fill SDL_VideoCaptureSpec structure.
///
/// \param device opened video capture device
/// \param format a format that can be used by the device (SDL_PixelFormatEnum)
/// \param index framesize between 0 and num -1
/// \param width output width
/// \param height output height
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetNumVideoCaptureFrameSizes
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetVideoCaptureFrameSize(SDL_VideoCaptureDevice *device, Uint32 format, int index, int *width, int *height)
/// ```
int sdlGetVideoCaptureFrameSize(Pointer<SdlVideoCaptureDevice> device,
    int format, int index, Pointer<Int32> width, Pointer<Int32> height) {
  final sdlGetVideoCaptureFrameSizeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlVideoCaptureDevice> device, Uint32 format,
          Int32 index, Pointer<Int32> width, Pointer<Int32> height),
      int Function(
          Pointer<SdlVideoCaptureDevice> device,
          int format,
          int index,
          Pointer<Int32> width,
          Pointer<Int32> height)>('SDL_GetVideoCaptureFrameSize');
  return sdlGetVideoCaptureFrameSizeLookupFunction(
      device, format, index, width, height);
}

///
/// Number of different framesizes available for the device and pixel format.
///
/// \param device opened video capture device
/// \param format frame pixel format (SDL_PixelFormatEnum)
/// \returns number of framesizes or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetVideoCaptureFrameSize
/// \sa SDL_SetVideoCaptureSpec
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetNumVideoCaptureFrameSizes(SDL_VideoCaptureDevice *device, Uint32 format)
/// ```
int sdlGetNumVideoCaptureFrameSizes(
    Pointer<SdlVideoCaptureDevice> device, int format) {
  final sdlGetNumVideoCaptureFrameSizesLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlVideoCaptureDevice> device, Uint32 format),
      int Function(Pointer<SdlVideoCaptureDevice> device,
          int format)>('SDL_GetNumVideoCaptureFrameSizes');
  return sdlGetNumVideoCaptureFrameSizesLookupFunction(device, format);
}

///
/// Get video capture status
///
/// \param device opened video capture device
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_VideoCaptureStatus
///
/// ```c
/// extern DECLSPEC SDL_VideoCaptureStatus SDLCALL SDL_GetVideoCaptureStatus(SDL_VideoCaptureDevice *device)
/// ```
int sdlGetVideoCaptureStatus(Pointer<SdlVideoCaptureDevice> device) {
  final sdlGetVideoCaptureStatusLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlVideoCaptureDevice> device),
      int Function(
          Pointer<SdlVideoCaptureDevice> device)>('SDL_GetVideoCaptureStatus');
  return sdlGetVideoCaptureStatusLookupFunction(device);
}

///
/// Start video capture
///
/// \param device opened video capture device
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StopVideoCapture
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_StartVideoCapture(SDL_VideoCaptureDevice *device)
/// ```
int sdlStartVideoCapture(Pointer<SdlVideoCaptureDevice> device) {
  final sdlStartVideoCaptureLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlVideoCaptureDevice> device),
      int Function(
          Pointer<SdlVideoCaptureDevice> device)>('SDL_StartVideoCapture');
  return sdlStartVideoCaptureLookupFunction(device);
}

///
/// Acquire a frame.
///
/// The frame is a memory pointer to the image data, whose size and format are
/// given by the the obtained spec.
///
/// Non blocking API. If there is a frame available, frame->num_planes is non
/// 0. If frame->num_planes is 0 and returned code is 0, there is no frame at
/// that time.
///
/// After used, the frame should be released with SDL_ReleaseVideoCaptureFrame
///
/// \param device opened video capture device
/// \param frame pointer to get the frame
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ReleaseVideoCaptureFrame
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_AcquireVideoCaptureFrame(SDL_VideoCaptureDevice *device, SDL_VideoCaptureFrame *frame)
/// ```
int sdlAcquireVideoCaptureFrame(Pointer<SdlVideoCaptureDevice> device,
    Pointer<SdlVideoCaptureFrame> frame) {
  final sdlAcquireVideoCaptureFrameLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlVideoCaptureDevice> device,
          Pointer<SdlVideoCaptureFrame> frame),
      int Function(Pointer<SdlVideoCaptureDevice> device,
          Pointer<SdlVideoCaptureFrame> frame)>('SDL_AcquireVideoCaptureFrame');
  return sdlAcquireVideoCaptureFrameLookupFunction(device, frame);
}

///
/// Release a frame.
///
/// Let the back-end re-use the internal buffer for video capture.
///
/// All acquired frames should be released before closing the device.
///
/// \param device opened video capture device
/// \param frame frame pointer.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AcquireVideoCaptureFrame
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_ReleaseVideoCaptureFrame(SDL_VideoCaptureDevice *device, SDL_VideoCaptureFrame *frame)
/// ```
int sdlReleaseVideoCaptureFrame(Pointer<SdlVideoCaptureDevice> device,
    Pointer<SdlVideoCaptureFrame> frame) {
  final sdlReleaseVideoCaptureFrameLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlVideoCaptureDevice> device,
          Pointer<SdlVideoCaptureFrame> frame),
      int Function(Pointer<SdlVideoCaptureDevice> device,
          Pointer<SdlVideoCaptureFrame> frame)>('SDL_ReleaseVideoCaptureFrame');
  return sdlReleaseVideoCaptureFrameLookupFunction(device, frame);
}

///
/// Stop Video Capture
///
/// \param device opened video capture device
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StartVideoCapture
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_StopVideoCapture(SDL_VideoCaptureDevice *device)
/// ```
int sdlStopVideoCapture(Pointer<SdlVideoCaptureDevice> device) {
  final sdlStopVideoCaptureLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlVideoCaptureDevice> device),
      int Function(
          Pointer<SdlVideoCaptureDevice> device)>('SDL_StopVideoCapture');
  return sdlStopVideoCaptureLookupFunction(device);
}

///
/// Use this function to shut down video_capture processing and close the
/// video_capture device.
///
/// \param device opened video capture device
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_OpenVideoCaptureWithSpec
/// \sa SDL_OpenVideoCapture
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_CloseVideoCapture(SDL_VideoCaptureDevice *device)
/// ```
void sdlCloseVideoCapture(Pointer<SdlVideoCaptureDevice> device) {
  final sdlCloseVideoCaptureLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlVideoCaptureDevice> device),
      void Function(
          Pointer<SdlVideoCaptureDevice> device)>('SDL_CloseVideoCapture');
  return sdlCloseVideoCaptureLookupFunction(device);
}
