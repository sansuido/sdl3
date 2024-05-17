// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
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
/// - `SDL_INIT_TIMER`: timer subsystem
/// - `SDL_INIT_AUDIO`: audio subsystem; automatically initializes the events
/// subsystem
/// - `SDL_INIT_VIDEO`: video subsystem; automatically initializes the events
/// subsystem
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
/// \param flags subsystem initialization flags
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_InitSubSystem
/// \sa SDL_Quit
/// \sa SDL_SetMainReady
/// \sa SDL_WasInit
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_Init(SDL_InitFlags flags)
/// ```
int sdlInit(int flags) {
  final sdlInitLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 flags), int Function(int flags)>('SDL_Init');
  return sdlInitLookupFunction(flags);
}

///
/// Compatibility function to initialize the SDL library.
///
/// This function and SDL_Init() are interchangeable.
///
/// \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Init
/// \sa SDL_Quit
/// \sa SDL_QuitSubSystem
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_InitSubSystem(SDL_InitFlags flags)
/// ```
int sdlInitSubSystem(int flags) {
  final sdlInitSubSystemLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 flags),
      int Function(int flags)>('SDL_InitSubSystem');
  return sdlInitSubSystemLookupFunction(flags);
}

///
/// Shut down specific SDL subsystems.
///
/// You still need to call SDL_Quit() even if you close all open subsystems
/// with SDL_QuitSubSystem().
///
/// \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_InitSubSystem
/// \sa SDL_Quit
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_QuitSubSystem(SDL_InitFlags flags)
/// ```
void sdlQuitSubSystem(int flags) {
  final sdlQuitSubSystemLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint32 flags),
      void Function(int flags)>('SDL_QuitSubSystem');
  return sdlQuitSubSystemLookupFunction(flags);
}

///
/// Get a mask of the specified subsystems which are currently initialized.
///
/// \param flags any of the flags used by SDL_Init(); see SDL_Init for details.
/// \returns a mask of all initialized subsystems if `flags` is 0, otherwise it
/// returns the initialization status of the specified subsystems.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Init
/// \sa SDL_InitSubSystem
///
/// ```c
/// extern DECLSPEC SDL_InitFlags SDLCALL SDL_WasInit(SDL_InitFlags flags)
/// ```
int sdlWasInit(int flags) {
  final sdlWasInitLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Uint32 flags), int Function(int flags)>('SDL_WasInit');
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
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Init
/// \sa SDL_QuitSubSystem
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_Quit(void)
/// ```
void sdlQuit() {
  final sdlQuitLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>('SDL_Quit');
  return sdlQuitLookupFunction();
}
