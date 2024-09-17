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
/// \returns the D3D9 adapter index on success or -1 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetDirect3D9AdapterIndex(SDL_DisplayID displayID)
/// ```
int sdlGetDirect3D9AdapterIndex(int displayId) {
  final sdlGetDirect3D9AdapterIndexLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 displayId),
      int Function(int displayId)>('SDL_GetDirect3D9AdapterIndex');
  return sdlGetDirect3D9AdapterIndexLookupFunction(displayId);
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
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetDXGIOutputInfo(SDL_DisplayID displayID, int *adapterIndex, int *outputIndex)
/// ```
bool sdlGetDxgiOutputInfo(
    int displayId, Pointer<Int32> adapterIndex, Pointer<Int32> outputIndex) {
  final sdlGetDxgiOutputInfoLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Uint32 displayId, Pointer<Int32> adapterIndex,
          Pointer<Int32> outputIndex),
      int Function(int displayId, Pointer<Int32> adapterIndex,
          Pointer<Int32> outputIndex)>('SDL_GetDXGIOutputInfo');
  return sdlGetDxgiOutputInfoLookupFunction(
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
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_SetLinuxThreadPriority(Sint64 threadID, int priority)
/// ```
bool sdlSetLinuxThreadPriority(int threadId, int priority) {
  final sdlSetLinuxThreadPriorityLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Int64 threadId, Int32 priority),
      int Function(int threadId, int priority)>('SDL_SetLinuxThreadPriority');
  return sdlSetLinuxThreadPriorityLookupFunction(threadId, priority) == 1;
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
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_SetLinuxThreadPriorityAndPolicy(Sint64 threadID, int sdlPriority, int schedPolicy)
/// ```
bool sdlSetLinuxThreadPriorityAndPolicy(
    int threadId, int sdlPriority, int schedPolicy) {
  final sdlSetLinuxThreadPriorityAndPolicyLookupFunction =
      libSdl3.lookupFunction<
          Uint8 Function(Int64 threadId, Int32 sdlPriority, Int32 schedPolicy),
          int Function(int threadId, int sdlPriority,
              int schedPolicy)>('SDL_SetLinuxThreadPriorityAndPolicy');
  return sdlSetLinuxThreadPriorityAndPolicyLookupFunction(
          threadId, sdlPriority, schedPolicy) ==
      1;
}

///
/// Use this function to set the animation callback on Apple iOS.
///
/// The function prototype for `callback` is:
///
/// ```c
/// void callback(void *callbackParam);
/// ```
///
/// Where its parameter, `callbackParam`, is what was passed as `callbackParam`
/// to SDL_SetiOSAnimationCallback().
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
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetiOSEventPump
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_SetiOSAnimationCallback(SDL_Window *window, int interval, SDL_iOSAnimationCallback callback, void *callbackParam)
/// ```
bool sdlSetiOsAnimationCallback(
    Pointer<SdlWindow> window,
    int interval,
    Pointer<NativeFunction<SdlIOsAnimationCallback>> callback,
    Pointer<NativeType> callbackParam) {
  final sdlSetiOsAnimationCallbackLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlWindow> window,
          Int32 interval,
          Pointer<NativeFunction<SdlIOsAnimationCallback>> callback,
          Pointer<NativeType> callbackParam),
      int Function(
          Pointer<SdlWindow> window,
          int interval,
          Pointer<NativeFunction<SdlIOsAnimationCallback>> callback,
          Pointer<NativeType> callbackParam)>('SDL_SetiOSAnimationCallback');
  return sdlSetiOsAnimationCallbackLookupFunction(
          window, interval, callback, callbackParam) ==
      1;
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
/// \sa SDL_SetiOSAnimationCallback
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetiOSEventPump(SDL_bool enabled)
/// ```
void sdlSetiOsEventPump(bool enabled) {
  final sdlSetiOsEventPumpLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint8 enabled),
      void Function(int enabled)>('SDL_SetiOSEventPump');
  return sdlSetiOsEventPumpLookupFunction(enabled ? 1 : 0);
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
/// current thread is attached, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetAndroidActivity
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_GetAndroidJNIEnv(void)
/// ```
Pointer<NativeType> sdlGetAndroidJniEnv() {
  final sdlGetAndroidJniEnvLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(),
      Pointer<NativeType> Function()>('SDL_GetAndroidJNIEnv');
  return sdlGetAndroidJniEnvLookupFunction();
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
/// Android application, or NULL on failure; call SDL_GetError() for
/// more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetAndroidJNIEnv
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_GetAndroidActivity(void)
/// ```
Pointer<NativeType> sdlGetAndroidActivity() {
  final sdlGetAndroidActivityLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(),
      Pointer<NativeType> Function()>('SDL_GetAndroidActivity');
  return sdlGetAndroidActivityLookupFunction();
}

///
/// Query Android API level of the current device.
///
/// - API level 35: Android 15 (VANILLA_ICE_CREAM)
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
      .lookupFunction<Uint8 Function(), int Function()>('SDL_IsAndroidTV');
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
      .lookupFunction<Uint8 Function(), int Function()>('SDL_IsChromebook');
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
      libSdl3.lookupFunction<Uint8 Function(), int Function()>('SDL_IsDeXMode');
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
/// extern SDL_DECLSPEC void SDLCALL SDL_SendAndroidBackButton(void)
/// ```
void sdlSendAndroidBackButton() {
  final sdlSendAndroidBackButtonLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_SendAndroidBackButton');
  return sdlSendAndroidBackButtonLookupFunction();
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
/// \returns the path used for internal storage or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetAndroidExternalStorageState
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetAndroidInternalStoragePath(void)
/// ```
String? sdlGetAndroidInternalStoragePath() {
  final sdlGetAndroidInternalStoragePathLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(),
      Pointer<Utf8> Function()>('SDL_GetAndroidInternalStoragePath');
  final result = sdlGetAndroidInternalStoragePathLookupFunction();
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
/// \returns the current state of external storage, or 0 if external storage is
/// currently unavailable.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetAndroidExternalStoragePath
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_GetAndroidExternalStorageState(void)
/// ```
int sdlGetAndroidExternalStorageState() {
  final sdlGetAndroidExternalStorageStateLookupFunction =
      libSdl3.lookupFunction<Uint32 Function(), int Function()>(
          'SDL_GetAndroidExternalStorageState');
  return sdlGetAndroidExternalStorageStateLookupFunction();
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
/// \returns the path used for external storage for this application on success
/// or NULL on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetAndroidExternalStorageState
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetAndroidExternalStoragePath(void)
/// ```
String? sdlGetAndroidExternalStoragePath() {
  final sdlGetAndroidExternalStoragePathLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(),
      Pointer<Utf8> Function()>('SDL_GetAndroidExternalStoragePath');
  final result = sdlGetAndroidExternalStoragePathLookupFunction();
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
/// \returns the path used for caches for this application on success or NULL
/// on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetAndroidCachePath(void)
/// ```
String? sdlGetAndroidCachePath() {
  final sdlGetAndroidCachePathLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(),
      Pointer<Utf8> Function()>('SDL_GetAndroidCachePath');
  final result = sdlGetAndroidCachePathLookupFunction();
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
/// \returns SDL_TRUE if the request was submitted, SDL_FALSE if there was an
/// error submitting. The result of the request is only ever reported
/// through the callback, not this return value.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_RequestAndroidPermission(const char *permission, SDL_RequestAndroidPermissionCallback cb, void *userdata)
/// ```
bool sdlRequestAndroidPermission(
    String? permission,
    Pointer<NativeFunction<SdlRequestAndroidPermissionCallback>> cb,
    Pointer<NativeType> userdata) {
  final sdlRequestAndroidPermissionLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<Utf8> permission,
          Pointer<NativeFunction<SdlRequestAndroidPermissionCallback>> cb,
          Pointer<NativeType> userdata),
      int Function(
          Pointer<Utf8> permission,
          Pointer<NativeFunction<SdlRequestAndroidPermissionCallback>> cb,
          Pointer<NativeType> userdata)>('SDL_RequestAndroidPermission');
  final permissionPointer =
      permission != null ? permission.toNativeUtf8() : nullptr;
  final result = sdlRequestAndroidPermissionLookupFunction(
          permissionPointer, cb, userdata) ==
      1;
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
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_ShowAndroidToast(const char *message, int duration, int gravity, int xoffset, int yoffset)
/// ```
bool sdlShowAndroidToast(
    String? message, int duration, int gravity, int xoffset, int yoffset) {
  final sdlShowAndroidToastLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Utf8> message, Int32 duration, Int32 gravity,
          Int32 xoffset, Int32 yoffset),
      int Function(Pointer<Utf8> message, int duration, int gravity,
          int xoffset, int yoffset)>('SDL_ShowAndroidToast');
  final messagePointer = message != null ? message.toNativeUtf8() : nullptr;
  final result = sdlShowAndroidToastLookupFunction(
          messagePointer, duration, gravity, xoffset, yoffset) ==
      1;
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
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_SendAndroidMessage(Uint32 command, int param)
/// ```
bool sdlSendAndroidMessage(int command, int param) {
  final sdlSendAndroidMessageLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Uint32 command, Int32 param),
      int Function(int command, int param)>('SDL_SendAndroidMessage');
  return sdlSendAndroidMessageLookupFunction(command, param) == 1;
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
      libSdl3.lookupFunction<Uint8 Function(), int Function()>('SDL_IsTablet');
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
/// extern SDL_DECLSPEC void SDLCALL SDL_OnApplicationWillEnterBackground(void)
/// ```
void sdlOnApplicationWillEnterBackground() {
  final sdlOnApplicationWillEnterBackgroundLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_OnApplicationWillEnterBackground');
  return sdlOnApplicationWillEnterBackgroundLookupFunction();
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
/// extern SDL_DECLSPEC void SDLCALL SDL_OnApplicationDidEnterForeground(void)
/// ```
void sdlOnApplicationDidEnterForeground() {
  final sdlOnApplicationDidEnterForegroundLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_OnApplicationDidEnterForeground');
  return sdlOnApplicationDidEnterForegroundLookupFunction();
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
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetGDKTaskQueue(XTaskQueueHandle *outTaskQueue)
/// ```
bool sdlGetGdkTaskQueue(Pointer<XTaskQueueHandle> outTaskQueue) {
  final sdlGetGdkTaskQueueLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<XTaskQueueHandle> outTaskQueue),
      int Function(
          Pointer<XTaskQueueHandle> outTaskQueue)>('SDL_GetGDKTaskQueue');
  return sdlGetGdkTaskQueueLookupFunction(outTaskQueue) == 1;
}

///
/// Gets a reference to the default user handle for GDK.
///
/// This is effectively a synchronous version of XUserAddAsync, which always
/// prefers the default user and allows a sign-in UI.
///
/// \param outUserHandle a pointer to be filled in with the default user
/// handle.
/// \returns SDL_TRUE if success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetGDKDefaultUser(XUserHandle *outUserHandle)
/// ```
bool sdlGetGdkDefaultUser(Pointer<XUserHandle> outUserHandle) {
  final sdlGetGdkDefaultUserLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<XUserHandle> outUserHandle),
      int Function(
          Pointer<XUserHandle> outUserHandle)>('SDL_GetGDKDefaultUser');
  return sdlGetGdkDefaultUserLookupFunction(outUserHandle) == 1;
}
