part of '../../../sdl.dart';

extension SdlCameraEx on SdlCamera {
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
  /// {@category camera}
  static Pointer<SdlCamera> open(int instanceId, SdlxCameraSpec spec) =>
      sdlxOpenCamera(instanceId, spec);
}

extension SdlCameraPointerEx on Pointer<SdlCamera> {
  ///
  /// Query if camera access has been approved by the user.
  ///
  /// Cameras will not function between when the device is opened by the app and
  /// when the user permits access to the hardware. On some platforms, this
  /// presents as a popup dialog where the user has to explicitly approve access;
  /// on others the approval might be implicit and not alert the user at all.
  ///
  /// This function can be used to check the status of that approval. It will
  /// return SDL_CAMERA_PERMISSION_STATE_PENDING if waiting for user response,
  /// SDL_CAMERA_PERMISSION_STATE_APPROVED if the camera is approved for use, and
  /// SDL_CAMERA_PERMISSION_STATE_DENIED if the user denied access.
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
  /// \returns an SDL_CameraPermissionState value indicating if access is
  /// granted, or `SDL_CAMERA_PERMISSION_STATE_PENDING` if the decision
  /// is still pending.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_OpenCamera
  /// \sa SDL_CloseCamera
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_CameraPermissionState SDLCALL SDL_GetCameraPermissionState(SDL_Camera *camera)
  /// ```
  /// {@category camera}
  int getPermissionState() => sdlGetCameraPermissionState(this);

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
  /// {@category camera}
  int getId() => sdlGetCameraId(this);

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
  /// {@category camera}
  int getProperties(Pointer<SdlCamera> camera) => sdlGetCameraProperties(this);

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
  /// {@category camera}
  bool getFormat(SdlxCameraSpec spec) => sdlxGetCameraFormat(this, spec);

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
  /// {@category camera}
  ({Pointer<SdlSurface> surface, int timestampNs})? acquireFrame() =>
      sdlxAcquireCameraFrame(this);

  ///
  /// Release a frame of video acquired from a camera.
  ///
  /// Let the back-end reuse the internal buffer for camera.
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
  /// {@category camera}
  void releaseFrame(Pointer<SdlSurface> frame) =>
      sdlReleaseCameraFrame(this, frame);

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
  /// {@category camera}
  void close() => sdlCloseCamera(this);
}
