// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';

///
/// Circumvent failure of SDL_Init() when not using SDL_main() as an entry
/// point.
///
/// This function is defined in SDL_main.h, along with the preprocessor rule to
/// redefine main() as SDL_main(). Thus to ensure that your main() function
/// will not be changed it is necessary to define SDL_MAIN_HANDLED before
/// including SDL.h.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_Init
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetMainReady(void)
/// ```
void sdlSetMainReady() {
  final sdlSetMainReadyLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_SetMainReady');
  return sdlSetMainReadyLookupFunction();
}

///
/// Initializes and launches an SDL application, by doing platform-specific
/// initialization before calling your mainFunction and cleanups after it
/// returns, if that is needed for a specific platform, otherwise it just calls
/// mainFunction.
///
/// You can use this if you want to use your own main() implementation without
/// using SDL_main (like when using SDL_MAIN_HANDLED). When using this, you do
/// *not* need SDL_SetMainReady().
///
/// \param argc the argc parameter from the application's main() function, or 0
/// if the platform's main-equivalent has no argc.
/// \param argv the argv parameter from the application's main() function, or
/// NULL if the platform's main-equivalent has no argv.
/// \param mainFunction your SDL app's C-style main(). NOT the function you're
/// calling this from! Its name doesn't matter; it doesn't
/// literally have to be `main`.
/// \param reserved should be NULL (reserved for future use, will probably be
/// platform-specific then).
/// \returns the return value from mainFunction: 0 on success, otherwise
/// failure; SDL_GetError() might have more information on the
/// failure.
///
/// \threadsafety Generally this is called once, near startup, from the
/// process's initial thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_RunApp(int argc, char *argv[], SDL_main_func mainFunction, void *reserved)
/// ```
int sdlRunApp(
  int argc,
  Pointer<Pointer<Int8>> argv,
  Pointer<NativeFunction<SdlMainFunc>> mainFunction,
  Pointer<NativeType> reserved,
) {
  final sdlRunAppLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(
          Int32 argc,
          Pointer<Pointer<Int8>> argv,
          Pointer<NativeFunction<SdlMainFunc>> mainFunction,
          Pointer<NativeType> reserved,
        ),
        int Function(
          int argc,
          Pointer<Pointer<Int8>> argv,
          Pointer<NativeFunction<SdlMainFunc>> mainFunction,
          Pointer<NativeType> reserved,
        )
      >('SDL_RunApp');
  return sdlRunAppLookupFunction(argc, argv, mainFunction, reserved);
}

///
/// An entry point for SDL's use in SDL_MAIN_USE_CALLBACKS.
///
/// Generally, you should not call this function directly. This only exists to
/// hand off work into SDL as soon as possible, where it has a lot more control
/// and functionality available, and make the inline code in SDL_main.h as
/// small as possible.
///
/// Not all platforms use this, it's actual use is hidden in a magic
/// header-only library, and you should not call this directly unless you
/// _really_ know what you're doing.
///
/// \param argc standard Unix main argc.
/// \param argv standard Unix main argv.
/// \param appinit the application's SDL_AppInit function.
/// \param appiter the application's SDL_AppIterate function.
/// \param appevent the application's SDL_AppEvent function.
/// \param appquit the application's SDL_AppQuit function.
/// \returns standard Unix main return value.
///
/// \threadsafety It is not safe to call this anywhere except as the only
/// function call in SDL_main.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_EnterAppMainCallbacks(int argc, char *argv[], SDL_AppInit_func appinit, SDL_AppIterate_func appiter, SDL_AppEvent_func appevent, SDL_AppQuit_func appquit)
/// ```
int sdlEnterAppMainCallbacks(
  int argc,
  Pointer<Pointer<Int8>> argv,
  Pointer<NativeFunction<SdlAppInitFunc>> appinit,
  Pointer<NativeFunction<SdlAppIterateFunc>> appiter,
  Pointer<NativeFunction<SdlAppEventFunc>> appevent,
  Pointer<NativeFunction<SdlAppQuitFunc>> appquit,
) {
  final sdlEnterAppMainCallbacksLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(
          Int32 argc,
          Pointer<Pointer<Int8>> argv,
          Pointer<NativeFunction<SdlAppInitFunc>> appinit,
          Pointer<NativeFunction<SdlAppIterateFunc>> appiter,
          Pointer<NativeFunction<SdlAppEventFunc>> appevent,
          Pointer<NativeFunction<SdlAppQuitFunc>> appquit,
        ),
        int Function(
          int argc,
          Pointer<Pointer<Int8>> argv,
          Pointer<NativeFunction<SdlAppInitFunc>> appinit,
          Pointer<NativeFunction<SdlAppIterateFunc>> appiter,
          Pointer<NativeFunction<SdlAppEventFunc>> appevent,
          Pointer<NativeFunction<SdlAppQuitFunc>> appquit,
        )
      >('SDL_EnterAppMainCallbacks');
  return sdlEnterAppMainCallbacksLookupFunction(
    argc,
    argv,
    appinit,
    appiter,
    appevent,
    appquit,
  );
}

///
/// Register a win32 window class for SDL's use.
///
/// This can be called to set the application window class at startup. It is
/// safe to call this multiple times, as long as every call is eventually
/// paired with a call to SDL_UnregisterApp, but a second registration attempt
/// while a previous registration is still active will be ignored, other than
/// to increment a counter.
///
/// Most applications do not need to, and should not, call this directly; SDL
/// will call it when initializing the video subsystem.
///
/// \param name the window class name, in UTF-8 encoding. If NULL, SDL
/// currently uses "SDL_app" but this isn't guaranteed.
/// \param style the value to use in WNDCLASSEX::style. If `name` is NULL, SDL
/// currently uses `(CS_BYTEALIGNCLIENT \| CS_OWNDC)` regardless
/// of what is specified here.
/// \param hInst the HINSTANCE to use in WNDCLASSEX::hInstance. If zero, SDL
/// will use `GetModuleHandle(NULL)` instead.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RegisterApp(const char *name, Uint32 style, void *hInst)
/// ```
bool sdlRegisterApp(String? name, int style, Pointer<NativeType> hInst) {
  final sdlRegisterAppLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<Utf8> name,
          Uint32 style,
          Pointer<NativeType> hInst,
        ),
        int Function(Pointer<Utf8> name, int style, Pointer<NativeType> hInst)
      >('SDL_RegisterApp');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlRegisterAppLookupFunction(namePointer, style, hInst) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Deregister the win32 window class from an SDL_RegisterApp call.
///
/// This can be called to undo the effects of SDL_RegisterApp.
///
/// Most applications do not need to, and should not, call this directly; SDL
/// will call it when deinitializing the video subsystem.
///
/// It is safe to call this multiple times, as long as every call is eventually
/// paired with a prior call to SDL_RegisterApp. The window class will only be
/// deregistered when the registration counter in SDL_RegisterApp decrements to
/// zero through calls to this function.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnregisterApp(void)
/// ```
void sdlUnregisterApp() {
  final sdlUnregisterAppLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_UnregisterApp');
  return sdlUnregisterAppLookupFunction();
}

///
/// Callback from the application to let the suspend continue.
///
/// This function is only needed for Xbox GDK support; all other platforms will
/// do nothing and set an "unsupported" error message.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GDKSuspendComplete(void)
/// ```
void sdlGdkSuspendComplete() {
  final sdlGdkSuspendCompleteLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>(
        'SDL_GDKSuspendComplete',
      );
  return sdlGdkSuspendCompleteLookupFunction();
}
