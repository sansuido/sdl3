// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';

///
/// Initialize the SDL library.
///
/// SDL_Init() simply forwards to calling SDL_InitSubSystem(). Therefore, the
/// two may be used interchangeably. Though for readability of your code
/// SDL_InitSubSystem() might be preferred.
///
/// The file I/O (for example: SDL_IOFromFile) and threading (SDL_CreateThread)
/// subsystems are initialized by default. Message boxes
/// (SDL_ShowSimpleMessageBox) also attempt to work without initializing the
/// video subsystem, in hopes of being useful in showing an error dialog when
/// SDL_Init fails. You must specifically initialize other subsystems if you
/// use them in your application.
///
/// Logging (such as SDL_Log) works without initialization, too.
///
/// `flags` may be any of the following OR'd together:
///
/// - `SDL_INIT_AUDIO`: audio subsystem; automatically initializes the events
/// subsystem
/// - `SDL_INIT_VIDEO`: video subsystem; automatically initializes the events
/// subsystem, should be initialized on the main thread.
/// - `SDL_INIT_JOYSTICK`: joystick subsystem; automatically initializes the
/// events subsystem
/// - `SDL_INIT_HAPTIC`: haptic (force feedback) subsystem
/// - `SDL_INIT_GAMEPAD`: gamepad subsystem; automatically initializes the
/// joystick subsystem
/// - `SDL_INIT_EVENTS`: events subsystem
/// - `SDL_INIT_SENSOR`: sensor subsystem; automatically initializes the events
/// subsystem
/// - `SDL_INIT_CAMERA`: camera subsystem; automatically initializes the events
/// subsystem
///
/// Subsystem initialization is ref-counted, you must call SDL_QuitSubSystem()
/// for each SDL_InitSubSystem() to correctly shutdown a subsystem manually (or
/// call SDL_Quit() to force shutdown). If a subsystem is already loaded then
/// this call will increase the ref-count and return.
///
/// Consider reporting some basic metadata about your application before
/// calling SDL_Init, using either SDL_SetAppMetadata() or
/// SDL_SetAppMetadataProperty().
///
/// \param flags subsystem initialization flags.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAppMetadata
/// \sa SDL_SetAppMetadataProperty
/// \sa SDL_InitSubSystem
/// \sa SDL_Quit
/// \sa SDL_SetMainReady
/// \sa SDL_WasInit
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_Init(SDL_InitFlags flags)
/// ```
bool sdlInit(int flags) {
  final sdlInitLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(Uint32 flags), int Function(int flags)>(
        'SDL_Init',
      );
  return sdlInitLookupFunction(flags) == 1;
}

///
/// Compatibility function to initialize the SDL library.
///
/// This function and SDL_Init() are interchangeable.
///
/// \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_Init
/// \sa SDL_Quit
/// \sa SDL_QuitSubSystem
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_InitSubSystem(SDL_InitFlags flags)
/// ```
bool sdlInitSubSystem(int flags) {
  final sdlInitSubSystemLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(Uint32 flags), int Function(int flags)>(
        'SDL_InitSubSystem',
      );
  return sdlInitSubSystemLookupFunction(flags) == 1;
}

///
/// Shut down specific SDL subsystems.
///
/// You still need to call SDL_Quit() even if you close all open subsystems
/// with SDL_QuitSubSystem().
///
/// \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_InitSubSystem
/// \sa SDL_Quit
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_QuitSubSystem(SDL_InitFlags flags)
/// ```
void sdlQuitSubSystem(int flags) {
  final sdlQuitSubSystemLookupFunction = libSdl3
      .lookupFunction<Void Function(Uint32 flags), void Function(int flags)>(
        'SDL_QuitSubSystem',
      );
  return sdlQuitSubSystemLookupFunction(flags);
}

///
/// Get a mask of the specified subsystems which are currently initialized.
///
/// \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
/// \returns a mask of all initialized subsystems if `flags` is 0, otherwise it
/// returns the initialization status of the specified subsystems.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_Init
/// \sa SDL_InitSubSystem
///
/// ```c
/// extern SDL_DECLSPEC SDL_InitFlags SDLCALL SDL_WasInit(SDL_InitFlags flags)
/// ```
int sdlWasInit(int flags) {
  final sdlWasInitLookupFunction = libSdl3
      .lookupFunction<Uint32 Function(Uint32 flags), int Function(int flags)>(
        'SDL_WasInit',
      );
  return sdlWasInitLookupFunction(flags);
}

///
/// Clean up all initialized subsystems.
///
/// You should call this function even if you have already shutdown each
/// initialized subsystem with SDL_QuitSubSystem(). It is safe to call this
/// function even in the case of errors in initialization.
///
/// You can use this function with atexit() to ensure that it is run when your
/// application is shutdown, but it is not wise to do this from a library or
/// other dynamically loaded code.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_Init
/// \sa SDL_QuitSubSystem
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_Quit(void)
/// ```
void sdlQuit() {
  final sdlQuitLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_Quit');
  return sdlQuitLookupFunction();
}

///
/// Return whether this is the main thread.
///
/// On Apple platforms, the main thread is the thread that runs your program's
/// main() entry point. On other platforms, the main thread is the one that
/// calls SDL_Init(SDL_INIT_VIDEO), which should usually be the one that runs
/// your program's main() entry point. If you are using the main callbacks,
/// SDL_AppInit(), SDL_AppIterate(), and SDL_AppQuit() are all called on the
/// main thread.
///
/// \returns true if this thread is the main thread, or false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RunOnMainThread
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_IsMainThread(void)
/// ```
bool sdlIsMainThread() {
  final sdlIsMainThreadLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(), int Function()>('SDL_IsMainThread');
  return sdlIsMainThreadLookupFunction() == 1;
}

///
/// Call a function on the main thread during event processing.
///
/// If this is called on the main thread, the callback is executed immediately.
/// If this is called on another thread, this callback is queued for execution
/// on the main thread during event processing.
///
/// Be careful of deadlocks when using this functionality. You should not have
/// the main thread wait for the current thread while this function is being
/// called with `wait_complete` true.
///
/// \param callback the callback to call on the main thread.
/// \param userdata a pointer that is passed to `callback`.
/// \param wait_complete true to wait for the callback to complete, false to
/// return immediately.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_IsMainThread
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RunOnMainThread(SDL_MainThreadCallback callback, void *userdata, bool wait_complete)
/// ```
bool sdlRunOnMainThread(
  Pointer<NativeFunction<SdlMainThreadCallback>> callback,
  Pointer<NativeType> userdata,
  bool waitComplete,
) {
  final sdlRunOnMainThreadLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<NativeFunction<SdlMainThreadCallback>> callback,
          Pointer<NativeType> userdata,
          Uint8 waitComplete,
        ),
        int Function(
          Pointer<NativeFunction<SdlMainThreadCallback>> callback,
          Pointer<NativeType> userdata,
          int waitComplete,
        )
      >('SDL_RunOnMainThread');
  return sdlRunOnMainThreadLookupFunction(
        callback,
        userdata,
        waitComplete ? 1 : 0,
      ) ==
      1;
}

///
/// Specify basic metadata about your app.
///
/// You can optionally provide metadata about your app to SDL. This is not
/// required, but strongly encouraged.
///
/// There are several locations where SDL can make use of metadata (an "About"
/// box in the macOS menu bar, the name of the app can be shown on some audio
/// mixers, etc). Any piece of metadata can be left as NULL, if a specific
/// detail doesn't make sense for the app.
///
/// This function should be called as early as possible, before SDL_Init.
/// Multiple calls to this function are allowed, but various state might not
/// change once it has been set up with a previous call to this function.
///
/// Passing a NULL removes any previous metadata.
///
/// This is a simplified interface for the most important information. You can
/// supply significantly more detailed metadata with
/// SDL_SetAppMetadataProperty().
///
/// \param appname The name of the application ("My Game 2: Bad Guy's
/// Revenge!").
/// \param appversion The version of the application ("1.0.0beta5" or a git
/// hash, or whatever makes sense).
/// \param appidentifier A unique string in reverse-domain format that
/// identifies this app ("com.example.mygame2").
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAppMetadataProperty
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetAppMetadata(const char *appname, const char *appversion, const char *appidentifier)
/// ```
bool sdlSetAppMetadata(
  String? appname,
  String? appversion,
  String? appidentifier,
) {
  final sdlSetAppMetadataLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<Utf8> appname,
          Pointer<Utf8> appversion,
          Pointer<Utf8> appidentifier,
        ),
        int Function(
          Pointer<Utf8> appname,
          Pointer<Utf8> appversion,
          Pointer<Utf8> appidentifier,
        )
      >('SDL_SetAppMetadata');
  final appnamePointer = appname != null ? appname.toNativeUtf8() : nullptr;
  final appversionPointer = appversion != null
      ? appversion.toNativeUtf8()
      : nullptr;
  final appidentifierPointer = appidentifier != null
      ? appidentifier.toNativeUtf8()
      : nullptr;
  final result =
      sdlSetAppMetadataLookupFunction(
        appnamePointer,
        appversionPointer,
        appidentifierPointer,
      ) ==
      1;
  calloc.free(appnamePointer);
  calloc.free(appversionPointer);
  calloc.free(appidentifierPointer);
  return result;
}

///
/// Specify metadata about your app through a set of properties.
///
/// You can optionally provide metadata about your app to SDL. This is not
/// required, but strongly encouraged.
///
/// There are several locations where SDL can make use of metadata (an "About"
/// box in the macOS menu bar, the name of the app can be shown on some audio
/// mixers, etc). Any piece of metadata can be left out, if a specific detail
/// doesn't make sense for the app.
///
/// This function should be called as early as possible, before SDL_Init.
/// Multiple calls to this function are allowed, but various state might not
/// change once it has been set up with a previous call to this function.
///
/// Once set, this metadata can be read using SDL_GetAppMetadataProperty().
///
/// These are the supported properties:
///
/// - `SDL_PROP_APP_METADATA_NAME_STRING`: The human-readable name of the
/// application, like "My Game 2: Bad Guy's Revenge!". This will show up
/// anywhere the OS shows the name of the application separately from window
/// titles, such as volume control applets, etc. This defaults to "SDL
/// Application".
/// - `SDL_PROP_APP_METADATA_VERSION_STRING`: The version of the app that is
/// running; there are no rules on format, so "1.0.3beta2" and "April 22nd,
/// 2024" and a git hash are all valid options. This has no default.
/// - `SDL_PROP_APP_METADATA_IDENTIFIER_STRING`: A unique string that
/// identifies this app. This must be in reverse-domain format, like
/// "com.example.mygame2". This string is used by desktop compositors to
/// identify and group windows together, as well as match applications with
/// associated desktop settings and icons. If you plan to package your
/// application in a container such as Flatpak, the app ID should match the
/// name of your Flatpak container as well. This has no default.
/// - `SDL_PROP_APP_METADATA_CREATOR_STRING`: The human-readable name of the
/// creator/developer/maker of this app, like "MojoWorkshop, LLC"
/// - `SDL_PROP_APP_METADATA_COPYRIGHT_STRING`: The human-readable copyright
/// notice, like "Copyright (c) 2024 MojoWorkshop, LLC" or whatnot. Keep this
/// to one line, don't paste a copy of a whole software license in here. This
/// has no default.
/// - `SDL_PROP_APP_METADATA_URL_STRING`: A URL to the app on the web. Maybe a
/// product page, or a storefront, or even a GitHub repository, for user's
/// further information This has no default.
/// - `SDL_PROP_APP_METADATA_TYPE_STRING`: The type of application this is.
/// Currently this string can be "game" for a video game, "mediaplayer" for a
/// media player, or generically "application" if nothing else applies.
/// Future versions of SDL might add new types. This defaults to
/// "application".
///
/// \param name the name of the metadata property to set.
/// \param value the value of the property, or NULL to remove that property.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetAppMetadataProperty
/// \sa SDL_SetAppMetadata
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetAppMetadataProperty(const char *name, const char *value)
/// ```
bool sdlSetAppMetadataProperty(String? name, String? value) {
  final sdlSetAppMetadataPropertyLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<Utf8> name, Pointer<Utf8> value),
        int Function(Pointer<Utf8> name, Pointer<Utf8> value)
      >('SDL_SetAppMetadataProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final valuePointer = value != null ? value.toNativeUtf8() : nullptr;
  final result =
      sdlSetAppMetadataPropertyLookupFunction(namePointer, valuePointer) == 1;
  calloc.free(namePointer);
  calloc.free(valuePointer);
  return result;
}

///
/// Get metadata about your app.
///
/// This returns metadata previously set using SDL_SetAppMetadata() or
/// SDL_SetAppMetadataProperty(). See SDL_SetAppMetadataProperty() for the list
/// of available properties and their meanings.
///
/// \param name the name of the metadata property to get.
/// \returns the current value of the metadata property, or the default if it
/// is not set, NULL for properties with no default.
///
/// \threadsafety It is safe to call this function from any thread, although
/// the string returned is not protected and could potentially be
/// freed if you call SDL_SetAppMetadataProperty() to set that
/// property from another thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAppMetadata
/// \sa SDL_SetAppMetadataProperty
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetAppMetadataProperty(const char *name)
/// ```
String? sdlGetAppMetadataProperty(String? name) {
  final sdlGetAppMetadataPropertyLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Utf8> Function(Pointer<Utf8> name),
        Pointer<Utf8> Function(Pointer<Utf8> name)
      >('SDL_GetAppMetadataProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetAppMetadataPropertyLookupFunction(namePointer);
  calloc.free(namePointer);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}
