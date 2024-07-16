// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Set a callback for every Windows message, run before TranslateMessage().
///
/// The callback may modify the message, and should return SDL_TRUE if the
/// message should continue to be processed, or SDL_FALSE to prevent further
/// processing.
///
/// \param callback the SDL_WindowsMessageHook function to call.
/// \param userdata a pointer to pass to every iteration of `callback`.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_WindowsMessageHook
/// \sa SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetWindowsMessageHook(SDL_WindowsMessageHook callback, void *userdata)
/// ```
void sdlSetWindowsMessageHook(
    Pointer<NativeFunction<SdlWindowsMessageHook>> callback,
    Pointer<NativeType> userdata) {
  final sdlSetWindowsMessageHookLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeFunction<SdlWindowsMessageHook>> callback,
          Pointer<NativeType> userdata),
      void Function(Pointer<NativeFunction<SdlWindowsMessageHook>> callback,
          Pointer<NativeType> userdata)>('SDL_SetWindowsMessageHook');
  return sdlSetWindowsMessageHookLookupFunction(callback, userdata);
}

///
/// Get the D3D9 adapter index that matches the specified display.
///
/// The returned adapter index can be passed to `IDirect3D9::CreateDevice` and
/// controls on which monitor a full screen application will appear.
///
/// \param displayID the instance of the display to query.
/// \returns the D3D9 adapter index on success or a negative error code on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_Direct3D9GetAdapterIndex(SDL_DisplayID displayID)
/// ```
int sdlDirect3D9GetAdapterIndex(int displayId) {
  final sdlDirect3D9GetAdapterIndexLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 displayId),
      int Function(int displayId)>('SDL_Direct3D9GetAdapterIndex');
  return sdlDirect3D9GetAdapterIndexLookupFunction(displayId);
}

///
/// Get the DXGI Adapter and Output indices for the specified display.
///
/// The DXGI Adapter and Output indices can be passed to `EnumAdapters` and
/// `EnumOutputs` respectively to get the objects required to create a DX10 or
/// DX11 device and swap chain.
///
/// \param displayID the instance of the display to query.
/// \param adapterIndex a pointer to be filled in with the adapter index.
/// \param outputIndex a pointer to be filled in with the output index.
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_DXGIGetOutputInfo(SDL_DisplayID displayID, int *adapterIndex, int *outputIndex)
/// ```
bool sdlDxgiGetOutputInfo(
    int displayId, Pointer<Int32> adapterIndex, Pointer<Int32> outputIndex) {
  final sdlDxgiGetOutputInfoLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 displayId, Pointer<Int32> adapterIndex,
          Pointer<Int32> outputIndex),
      int Function(int displayId, Pointer<Int32> adapterIndex,
          Pointer<Int32> outputIndex)>('SDL_DXGIGetOutputInfo');
  return sdlDxgiGetOutputInfoLookupFunction(
          displayId, adapterIndex, outputIndex) ==
      1;
}

///
/// Set a callback for every X11 event.
///
/// The callback may modify the event, and should return SDL_TRUE if the event
/// should continue to be processed, or SDL_FALSE to prevent further
/// processing.
///
/// \param callback the SDL_X11EventHook function to call.
/// \param userdata a pointer to pass to every iteration of `callback`.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetX11EventHook(SDL_X11EventHook callback, void *userdata)
/// ```
void sdlSetX11EventHook(Pointer<NativeFunction<SdlX11EventHook>> callback,
    Pointer<NativeType> userdata) {
  final sdlSetX11EventHookLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeFunction<SdlX11EventHook>> callback,
          Pointer<NativeType> userdata),
      void Function(Pointer<NativeFunction<SdlX11EventHook>> callback,
          Pointer<NativeType> userdata)>('SDL_SetX11EventHook');
  return sdlSetX11EventHookLookupFunction(callback, userdata);
}

///
/// Sets the UNIX nice value for a thread.
///
/// This uses setpriority() if possible, and RealtimeKit if available.
///
/// \param threadID the Unix thread ID to change priority of.
/// \param priority the new, Unix-specific, priority value.
/// \returns 0 on success, or -1 on error.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_LinuxSetThreadPriority(Sint64 threadID, int priority)
/// ```
int sdlLinuxSetThreadPriority(int threadId, int priority) {
  final sdlLinuxSetThreadPriorityLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int64 threadId, Int32 priority),
      int Function(int threadId, int priority)>('SDL_LinuxSetThreadPriority');
  return sdlLinuxSetThreadPriorityLookupFunction(threadId, priority);
}

///
/// Sets the priority (not nice level) and scheduling policy for a thread.
///
/// This uses setpriority() if possible, and RealtimeKit if available.
///
/// \param threadID the Unix thread ID to change priority of.
/// \param sdlPriority the new SDL_ThreadPriority value.
/// \param schedPolicy the new scheduling policy (SCHED_FIFO, SCHED_RR,
/// SCHED_OTHER, etc...).
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_LinuxSetThreadPriorityAndPolicy(Sint64 threadID, int sdlPriority, int schedPolicy)
/// ```
int sdlLinuxSetThreadPriorityAndPolicy(
    int threadId, int sdlPriority, int schedPolicy) {
  final sdlLinuxSetThreadPriorityAndPolicyLookupFunction =
      libSdl3.lookupFunction<
          Int32 Function(Int64 threadId, Int32 sdlPriority, Int32 schedPolicy),
          int Function(int threadId, int sdlPriority,
              int schedPolicy)>('SDL_LinuxSetThreadPriorityAndPolicy');
  return sdlLinuxSetThreadPriorityAndPolicyLookupFunction(
      threadId, sdlPriority, schedPolicy);
}

///
/// Use this function to set the animation callback on Apple iOS.
///
/// The function prototype for `callback` is:
///
/// ```c
/// void callback(void* callbackParam);
/// ```
///
/// Where its parameter, `callbackParam`, is what was passed as `callbackParam`
/// to SDL_iOSSetAnimationCallback().
///
/// This function is only available on Apple iOS.
///
/// For more information see:
///
/// https://wiki.libsdl.org/SDL3/README/ios
///
/// Note that if you use the "main callbacks" instead of a standard C `main`
/// function, you don't have to use this API, as SDL will manage this for you.
///
/// Details on main callbacks are here:
///
/// https://wiki.libsdl.org/SDL3/README/main-functions
///
/// \param window the window for which the animation callback should be set.
/// \param interval the number of frames after which **callback** will be
/// called.
/// \param callback the function to call for every frame.
/// \param callbackParam a pointer that is passed to `callback`.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_iOSSetEventPump
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_iOSSetAnimationCallback(SDL_Window * window, int interval, SDL_iOSAnimationCallback callback, void *callbackParam)
/// ```
int sdlIOsSetAnimationCallback(
    Pointer<SdlWindow> window,
    int interval,
    Pointer<NativeFunction<SdlIOsAnimationCallback>> callback,
    Pointer<NativeType> callbackParam) {
  final sdlIOsSetAnimationCallbackLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> window,
          Int32 interval,
          Pointer<NativeFunction<SdlIOsAnimationCallback>> callback,
          Pointer<NativeType> callbackParam),
      int Function(
          Pointer<SdlWindow> window,
          int interval,
          Pointer<NativeFunction<SdlIOsAnimationCallback>> callback,
          Pointer<NativeType> callbackParam)>('SDL_iOSSetAnimationCallback');
  return sdlIOsSetAnimationCallbackLookupFunction(
      window, interval, callback, callbackParam);
}

///
/// Use this function to enable or disable the SDL event pump on Apple iOS.
///
/// This function is only available on Apple iOS.
///
/// \param enabled SDL_TRUE to enable the event pump, SDL_FALSE to disable it.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_iOSSetAnimationCallback
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_iOSSetEventPump(SDL_bool enabled)
/// ```
void sdlIOsSetEventPump(bool enabled) {
  final sdlIOsSetEventPumpLookupFunction = libSdl3.lookupFunction<
      Void Function(Int32 enabled),
      void Function(int enabled)>('SDL_iOSSetEventPump');
  return sdlIOsSetEventPumpLookupFunction(enabled ? 1 : 0);
}

///
/// Get the Android Java Native Interface Environment of the current thread.
///
/// This is the JNIEnv one needs to access the Java virtual machine from native
/// code, and is needed for many Android APIs to be usable from C.
///
/// The prototype of the function in SDL's code actually declare a void* return
/// type, even if the implementation returns a pointer to a JNIEnv. The
/// rationale being that the SDL headers can avoid including jni.h.
///
/// \returns a pointer to Java native interface object (JNIEnv) to which the
/// current thread is attached, or 0 on error.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AndroidGetActivity
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_AndroidGetJNIEnv(void)
/// ```
Pointer<NativeType> sdlAndroidGetJniEnv() {
  final sdlAndroidGetJniEnvLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(),
      Pointer<NativeType> Function()>('SDL_AndroidGetJNIEnv');
  return sdlAndroidGetJniEnvLookupFunction();
}

///
/// Retrieve the Java instance of the Android activity class.
///
/// The prototype of the function in SDL's code actually declares a void*
/// return type, even if the implementation returns a jobject. The rationale
/// being that the SDL headers can avoid including jni.h.
///
/// The jobject returned by the function is a local reference and must be
/// released by the caller. See the PushLocalFrame() and PopLocalFrame() or
/// DeleteLocalRef() functions of the Java native interface:
///
/// https://docs.oracle.com/javase/1.5.0/docs/guide/jni/spec/functions.html
///
/// \returns the jobject representing the instance of the Activity class of the
/// Android application, or NULL on error.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AndroidGetJNIEnv
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_AndroidGetActivity(void)
/// ```
Pointer<NativeType> sdlAndroidGetActivity() {
  final sdlAndroidGetActivityLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(),
      Pointer<NativeType> Function()>('SDL_AndroidGetActivity');
  return sdlAndroidGetActivityLookupFunction();
}

///
/// Query Android API level of the current device.
///
/// - API level 34: Android 14 (UPSIDE_DOWN_CAKE)
/// - API level 33: Android 13 (TIRAMISU)
/// - API level 32: Android 12L (S_V2)
/// - API level 31: Android 12 (S)
/// - API level 30: Android 11 (R)
/// - API level 29: Android 10 (Q)
/// - API level 28: Android 9 (P)
/// - API level 27: Android 8.1 (O_MR1)
/// - API level 26: Android 8.0 (O)
/// - API level 25: Android 7.1 (N_MR1)
/// - API level 24: Android 7.0 (N)
/// - API level 23: Android 6.0 (M)
/// - API level 22: Android 5.1 (LOLLIPOP_MR1)
/// - API level 21: Android 5.0 (LOLLIPOP, L)
/// - API level 20: Android 4.4W (KITKAT_WATCH)
/// - API level 19: Android 4.4 (KITKAT)
/// - API level 18: Android 4.3 (JELLY_BEAN_MR2)
/// - API level 17: Android 4.2 (JELLY_BEAN_MR1)
/// - API level 16: Android 4.1 (JELLY_BEAN)
/// - API level 15: Android 4.0.3 (ICE_CREAM_SANDWICH_MR1)
/// - API level 14: Android 4.0 (ICE_CREAM_SANDWICH)
/// - API level 13: Android 3.2 (HONEYCOMB_MR2)
/// - API level 12: Android 3.1 (HONEYCOMB_MR1)
/// - API level 11: Android 3.0 (HONEYCOMB)
/// - API level 10: Android 2.3.3 (GINGERBREAD_MR1)
///
/// \returns the Android API level.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetAndroidSDKVersion(void)
/// ```
int sdlGetAndroidSdkVersion() {
  final sdlGetAndroidSdkVersionLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_GetAndroidSDKVersion');
  return sdlGetAndroidSdkVersionLookupFunction();
}

///
/// Query if the application is running on Android TV.
///
/// \returns SDL_TRUE if this is Android TV, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_IsAndroidTV(void)
/// ```
bool sdlIsAndroidTv() {
  final sdlIsAndroidTvLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_IsAndroidTV');
  return sdlIsAndroidTvLookupFunction() == 1;
}

///
/// Query if the application is running on a Chromebook.
///
/// \returns SDL_TRUE if this is a Chromebook, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_IsChromebook(void)
/// ```
bool sdlIsChromebook() {
  final sdlIsChromebookLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_IsChromebook');
  return sdlIsChromebookLookupFunction() == 1;
}

///
/// Query if the application is running on a Samsung DeX docking station.
///
/// \returns SDL_TRUE if this is a DeX docking station, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_IsDeXMode(void)
/// ```
bool sdlIsDeXMode() {
  final sdlIsDeXModeLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_IsDeXMode');
  return sdlIsDeXModeLookupFunction() == 1;
}

///
/// Trigger the Android system back button behavior.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_AndroidBackButton(void)
/// ```
void sdlAndroidBackButton() {
  final sdlAndroidBackButtonLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_AndroidBackButton');
  return sdlAndroidBackButtonLookupFunction();
}

///
/// Get the path used for internal storage for this Android application.
///
/// This path is unique to your application and cannot be written to by other
/// applications.
///
/// Your internal storage path is typically:
/// `/data/data/your.app.package/files`.
///
/// This is a C wrapper over `android.content.Context.getFilesDir()`:
///
/// https://developer.android.com/reference/android/content/Context#getFilesDir()
///
/// The returned string follows the SDL_GetStringRule.
///
/// \returns the path used for internal storage or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AndroidGetExternalStorageState
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_AndroidGetInternalStoragePath(void)
/// ```
String? sdlAndroidGetInternalStoragePath() {
  final sdlAndroidGetInternalStoragePathLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(),
      Pointer<Utf8> Function()>('SDL_AndroidGetInternalStoragePath');
  final result = sdlAndroidGetInternalStoragePathLookupFunction();
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the current state of external storage for this Android application.
///
/// The current state of external storage, a bitmask of these values:
/// `SDL_ANDROID_EXTERNAL_STORAGE_READ`, `SDL_ANDROID_EXTERNAL_STORAGE_WRITE`.
///
/// If external storage is currently unavailable, this will return 0.
///
/// \param state filled with the current state of external storage. 0 if
/// external storage is currently unavailable.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AndroidGetExternalStoragePath
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_AndroidGetExternalStorageState(Uint32 *state)
/// ```
int sdlAndroidGetExternalStorageState(Pointer<Uint32> state) {
  final sdlAndroidGetExternalStorageStateLookupFunction =
      libSdl3.lookupFunction<
          Int32 Function(Pointer<Uint32> state),
          int Function(
              Pointer<Uint32> state)>('SDL_AndroidGetExternalStorageState');
  return sdlAndroidGetExternalStorageStateLookupFunction(state);
}

///
/// Get the path used for external storage for this Android application.
///
/// This path is unique to your application, but is public and can be written
/// to by other applications.
///
/// Your external storage path is typically:
/// `/storage/sdcard0/Android/data/your.app.package/files`.
///
/// This is a C wrapper over `android.content.Context.getExternalFilesDir()`:
///
/// https://developer.android.com/reference/android/content/Context#getExternalFilesDir()
///
/// The returned string follows the SDL_GetStringRule.
///
/// \returns the path used for external storage for this application on success
/// or NULL on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AndroidGetExternalStorageState
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_AndroidGetExternalStoragePath(void)
/// ```
String? sdlAndroidGetExternalStoragePath() {
  final sdlAndroidGetExternalStoragePathLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(),
      Pointer<Utf8> Function()>('SDL_AndroidGetExternalStoragePath');
  final result = sdlAndroidGetExternalStoragePathLookupFunction();
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the path used for caching data for this Android application.
///
/// This path is unique to your application, but is public and can be written
/// to by other applications.
///
/// Your cache path is typically: `/data/data/your.app.package/cache/`.
///
/// This is a C wrapper over `android.content.Context.getCacheDir()`:
///
/// https://developer.android.com/reference/android/content/Context#getCacheDir()
///
/// The returned string follows the SDL_GetStringRule.
///
/// \returns the path used for caches for this application on success or NULL
/// on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_AndroidGetCachePath(void)
/// ```
String? sdlAndroidGetCachePath() {
  final sdlAndroidGetCachePathLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(),
      Pointer<Utf8> Function()>('SDL_AndroidGetCachePath');
  final result = sdlAndroidGetCachePathLookupFunction();
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Request permissions at runtime, asynchronously.
///
/// You do not need to call this for built-in functionality of SDL; recording
/// from a microphone or reading images from a camera, using standard SDL APIs,
/// will manage permission requests for you.
///
/// This function never blocks. Instead, the app-supplied callback will be
/// called when a decision has been made. This callback may happen on a
/// different thread, and possibly much later, as it might wait on a user to
/// respond to a system dialog. If permission has already been granted for a
/// specific entitlement, the callback will still fire, probably on the current
/// thread and before this function returns.
///
/// If the request submission fails, this function returns -1 and the callback
/// will NOT be called, but this should only happen in catastrophic conditions,
/// like memory running out. Normally there will be a yes or no to the request
/// through the callback.
///
/// \param permission the permission to request.
/// \param cb the callback to trigger when the request has a response.
/// \param userdata an app-controlled pointer that is passed to the callback.
/// \returns zero if the request was submitted, -1 if there was an error
/// submitting. The result of the request is only ever reported
/// through the callback, not this return value.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_AndroidRequestPermission(const char *permission, SDL_AndroidRequestPermissionCallback cb, void *userdata)
/// ```
int sdlAndroidRequestPermission(
    String? permission,
    Pointer<NativeFunction<SdlAndroidRequestPermissionCallback>> cb,
    Pointer<NativeType> userdata) {
  final sdlAndroidRequestPermissionLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<Utf8> permission,
          Pointer<NativeFunction<SdlAndroidRequestPermissionCallback>> cb,
          Pointer<NativeType> userdata),
      int Function(
          Pointer<Utf8> permission,
          Pointer<NativeFunction<SdlAndroidRequestPermissionCallback>> cb,
          Pointer<NativeType> userdata)>('SDL_AndroidRequestPermission');
  final permissionPointer =
      permission != null ? permission.toNativeUtf8() : nullptr;
  final result = sdlAndroidRequestPermissionLookupFunction(
      permissionPointer, cb, userdata);
  calloc.free(permissionPointer);
  return result;
}

///
/// Shows an Android toast notification.
///
/// Toasts are a sort of lightweight notification that are unique to Android.
///
/// https://developer.android.com/guide/topics/ui/notifiers/toasts
///
/// Shows toast in UI thread.
///
/// For the `gravity` parameter, choose a value from here, or -1 if you don't
/// have a preference:
///
/// https://developer.android.com/reference/android/view/Gravity
///
/// \param message text message to be shown.
/// \param duration 0=short, 1=long.
/// \param gravity where the notification should appear on the screen.
/// \param xoffset set this parameter only when gravity >=0.
/// \param yoffset set this parameter only when gravity >=0.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_AndroidShowToast(const char* message, int duration, int gravity, int xoffset, int yoffset)
/// ```
int sdlAndroidShowToast(
    String? message, int duration, int gravity, int xoffset, int yoffset) {
  final sdlAndroidShowToastLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> message, Int32 duration, Int32 gravity,
          Int32 xoffset, Int32 yoffset),
      int Function(Pointer<Utf8> message, int duration, int gravity,
          int xoffset, int yoffset)>('SDL_AndroidShowToast');
  final messagePointer = message != null ? message.toNativeUtf8() : nullptr;
  final result = sdlAndroidShowToastLookupFunction(
      messagePointer, duration, gravity, xoffset, yoffset);
  calloc.free(messagePointer);
  return result;
}

///
/// Send a user command to SDLActivity.
///
/// Override "boolean onUnhandledMessage(Message msg)" to handle the message.
///
/// \param command user command that must be greater or equal to 0x8000.
/// \param param user parameter.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_AndroidSendMessage(Uint32 command, int param)
/// ```
int sdlAndroidSendMessage(int command, int param) {
  final sdlAndroidSendMessageLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 command, Int32 param),
      int Function(int command, int param)>('SDL_AndroidSendMessage');
  return sdlAndroidSendMessageLookupFunction(command, param);
}

///
/// Retrieve a WinRT defined path on the local file system.
///
/// Not all paths are available on all versions of Windows. This is especially
/// true on Windows Phone. Check the documentation for the given SDL_WinRT_Path
/// for more information on which path types are supported where.
///
/// Documentation on most app-specific path types on WinRT can be found on
/// MSDN, at the URL:
///
/// https://msdn.microsoft.com/en-us/library/windows/apps/hh464917.aspx
///
/// The returned string follows the SDL_GetStringRule.
///
/// \param pathType the type of path to retrieve, one of SDL_WinRT_Path.
/// \returns a UTF-8 string (8-bit, multi-byte) containing the path, or NULL if
/// the path is not available for any reason; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_WinRTGetFSPath(SDL_WinRT_Path pathType)
/// ```
String? sdlWinRtGetFsPath(int pathType) {
  final sdlWinRtGetFsPathLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Int32 pathType),
      Pointer<Utf8> Function(int pathType)>('SDL_WinRTGetFSPath');
  final result = sdlWinRtGetFsPathLookupFunction(pathType);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Detects the device family of WinRT platform at runtime.
///
/// \returns a value from the SDL_WinRT_DeviceFamily enum.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_WinRT_DeviceFamily SDLCALL SDL_WinRTGetDeviceFamily()
/// ```
int sdlWinRtGetDeviceFamily() {
  final sdlWinRtGetDeviceFamilyLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_WinRTGetDeviceFamily');
  return sdlWinRtGetDeviceFamilyLookupFunction();
}

///
/// Query if the current device is a tablet.
///
/// If SDL can't determine this, it will return SDL_FALSE.
///
/// \returns SDL_TRUE if the device is a tablet, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_IsTablet(void)
/// ```
bool sdlIsTablet() {
  final sdlIsTabletLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_IsTablet');
  return sdlIsTabletLookupFunction() == 1;
}

///
/// Let iOS apps with external event handling report
/// onApplicationWillTerminate.
///
/// This functions allows iOS apps that have their own event handling to hook
/// into SDL to generate SDL events. This maps directly to an iOS-specific
/// event, but since it doesn't do anything iOS-specific internally, it is
/// available on all platforms, in case it might be useful for some specific
/// paradigm. Most apps do not need to use this directly; SDL's internal event
/// code will handle all this for windows created by SDL_CreateWindow!
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_OnApplicationWillTerminate(void)
/// ```
void sdlOnApplicationWillTerminate() {
  final sdlOnApplicationWillTerminateLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_OnApplicationWillTerminate');
  return sdlOnApplicationWillTerminateLookupFunction();
}

///
/// Let iOS apps with external event handling report
/// onApplicationDidReceiveMemoryWarning.
///
/// This functions allows iOS apps that have their own event handling to hook
/// into SDL to generate SDL events. This maps directly to an iOS-specific
/// event, but since it doesn't do anything iOS-specific internally, it is
/// available on all platforms, in case it might be useful for some specific
/// paradigm. Most apps do not need to use this directly; SDL's internal event
/// code will handle all this for windows created by SDL_CreateWindow!
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_OnApplicationDidReceiveMemoryWarning(void)
/// ```
void sdlOnApplicationDidReceiveMemoryWarning() {
  final sdlOnApplicationDidReceiveMemoryWarningLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_OnApplicationDidReceiveMemoryWarning');
  return sdlOnApplicationDidReceiveMemoryWarningLookupFunction();
}

///
/// Let iOS apps with external event handling report
/// onApplicationWillResignActive.
///
/// This functions allows iOS apps that have their own event handling to hook
/// into SDL to generate SDL events. This maps directly to an iOS-specific
/// event, but since it doesn't do anything iOS-specific internally, it is
/// available on all platforms, in case it might be useful for some specific
/// paradigm. Most apps do not need to use this directly; SDL's internal event
/// code will handle all this for windows created by SDL_CreateWindow!
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_OnApplicationWillResignActive(void)
/// ```
void sdlOnApplicationWillResignActive() {
  final sdlOnApplicationWillResignActiveLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_OnApplicationWillResignActive');
  return sdlOnApplicationWillResignActiveLookupFunction();
}

///
/// Let iOS apps with external event handling report
/// onApplicationDidEnterBackground.
///
/// This functions allows iOS apps that have their own event handling to hook
/// into SDL to generate SDL events. This maps directly to an iOS-specific
/// event, but since it doesn't do anything iOS-specific internally, it is
/// available on all platforms, in case it might be useful for some specific
/// paradigm. Most apps do not need to use this directly; SDL's internal event
/// code will handle all this for windows created by SDL_CreateWindow!
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_OnApplicationDidEnterBackground(void)
/// ```
void sdlOnApplicationDidEnterBackground() {
  final sdlOnApplicationDidEnterBackgroundLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_OnApplicationDidEnterBackground');
  return sdlOnApplicationDidEnterBackgroundLookupFunction();
}

///
/// Let iOS apps with external event handling report
/// onApplicationWillEnterForeground.
///
/// This functions allows iOS apps that have their own event handling to hook
/// into SDL to generate SDL events. This maps directly to an iOS-specific
/// event, but since it doesn't do anything iOS-specific internally, it is
/// available on all platforms, in case it might be useful for some specific
/// paradigm. Most apps do not need to use this directly; SDL's internal event
/// code will handle all this for windows created by SDL_CreateWindow!
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_OnApplicationWillEnterForeground(void)
/// ```
void sdlOnApplicationWillEnterForeground() {
  final sdlOnApplicationWillEnterForegroundLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_OnApplicationWillEnterForeground');
  return sdlOnApplicationWillEnterForegroundLookupFunction();
}

///
/// Let iOS apps with external event handling report
/// onApplicationDidBecomeActive.
///
/// This functions allows iOS apps that have their own event handling to hook
/// into SDL to generate SDL events. This maps directly to an iOS-specific
/// event, but since it doesn't do anything iOS-specific internally, it is
/// available on all platforms, in case it might be useful for some specific
/// paradigm. Most apps do not need to use this directly; SDL's internal event
/// code will handle all this for windows created by SDL_CreateWindow!
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_OnApplicationDidBecomeActive(void)
/// ```
void sdlOnApplicationDidBecomeActive() {
  final sdlOnApplicationDidBecomeActiveLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_OnApplicationDidBecomeActive');
  return sdlOnApplicationDidBecomeActiveLookupFunction();
}

///
/// Let iOS apps with external event handling report
/// onApplicationDidChangeStatusBarOrientation.
///
/// This functions allows iOS apps that have their own event handling to hook
/// into SDL to generate SDL events. This maps directly to an iOS-specific
/// event, but since it doesn't do anything iOS-specific internally, it is
/// available on all platforms, in case it might be useful for some specific
/// paradigm. Most apps do not need to use this directly; SDL's internal event
/// code will handle all this for windows created by SDL_CreateWindow!
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_OnApplicationDidChangeStatusBarOrientation(void)
/// ```
void sdlOnApplicationDidChangeStatusBarOrientation() {
  final sdlOnApplicationDidChangeStatusBarOrientationLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_OnApplicationDidChangeStatusBarOrientation');
  return sdlOnApplicationDidChangeStatusBarOrientationLookupFunction();
}

///
/// Gets a reference to the global async task queue handle for GDK,
/// initializing if needed.
///
/// Once you are done with the task queue, you should call
/// XTaskQueueCloseHandle to reduce the reference count to avoid a resource
/// leak.
///
/// \param outTaskQueue a pointer to be filled in with task queue handle.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GDKGetTaskQueue(XTaskQueueHandle * outTaskQueue)
/// ```
int sdlGdkGetTaskQueue(Pointer<XTaskQueueHandle> outTaskQueue) {
  final sdlGdkGetTaskQueueLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<XTaskQueueHandle> outTaskQueue),
      int Function(
          Pointer<XTaskQueueHandle> outTaskQueue)>('SDL_GDKGetTaskQueue');
  return sdlGdkGetTaskQueueLookupFunction(outTaskQueue);
}

///
/// Gets a reference to the default user handle for GDK.
///
/// This is effectively a synchronous version of XUserAddAsync, which always
/// prefers the default user and allows a sign-in UI.
///
/// \param outUserHandle a pointer to be filled in with the default user
/// handle.
/// \returns 0 if success, -1 if any error occurs.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GDKGetDefaultUser(XUserHandle * outUserHandle)
/// ```
int sdlGdkGetDefaultUser(Pointer<XUserHandle> outUserHandle) {
  final sdlGdkGetDefaultUserLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<XUserHandle> outUserHandle),
      int Function(
          Pointer<XUserHandle> outUserHandle)>('SDL_GDKGetDefaultUser');
  return sdlGdkGetDefaultUserLookupFunction(outUserHandle);
}
