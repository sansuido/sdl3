// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Set an application-defined assertion handler.
///
/// This function allows an application to show its own assertion UI and/or
/// force the response to an assertion failure. If the application doesn't
/// provide this, SDL will try to do the right thing, popping up a
/// system-specific GUI dialog, and probably minimizing any fullscreen windows.
///
/// This callback may fire from any thread, but it runs wrapped in a mutex, so
/// it will only fire from one thread at a time.
///
/// This callback is NOT reset to SDL's internal handler upon SDL_Quit()!
///
/// \param handler the SDL_AssertionHandler function to call when an assertion
/// fails or NULL for the default handler.
/// \param userdata a pointer that is passed to `handler`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetAssertionHandler
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetAssertionHandler( SDL_AssertionHandler handler, void *userdata)
/// ```
void sdlSetAssertionHandler(
  Pointer<NativeFunction<SdlAssertionHandler>> handler,
  Pointer<NativeType> userdata,
) {
  final sdlSetAssertionHandlerLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<NativeFunction<SdlAssertionHandler>> handler,
      Pointer<NativeType> userdata,
    ),
    void Function(
      Pointer<NativeFunction<SdlAssertionHandler>> handler,
      Pointer<NativeType> userdata,
    )
  >('SDL_SetAssertionHandler');
  return sdlSetAssertionHandlerLookupFunction(handler, userdata);
}

///
/// Get the default assertion handler.
///
/// This returns the function pointer that is called by default when an
/// assertion is triggered. This is an internal function provided by SDL, that
/// is used for assertions when SDL_SetAssertionHandler() hasn't been used to
/// provide a different function.
///
/// \returns the default SDL_AssertionHandler that is called when an assert
/// triggers.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetAssertionHandler
///
/// ```c
/// extern SDL_DECLSPEC SDL_AssertionHandler SDLCALL SDL_GetDefaultAssertionHandler(void)
/// ```
Pointer<NativeFunction<SdlAssertionHandler>> sdlGetDefaultAssertionHandler() {
  final sdlGetDefaultAssertionHandlerLookupFunction = libSdl3.lookupFunction<
    Pointer<NativeFunction<SdlAssertionHandler>> Function(),
    Pointer<NativeFunction<SdlAssertionHandler>> Function()
  >('SDL_GetDefaultAssertionHandler');
  return sdlGetDefaultAssertionHandlerLookupFunction();
}

///
/// Get the current assertion handler.
///
/// This returns the function pointer that is called when an assertion is
/// triggered. This is either the value last passed to
/// SDL_SetAssertionHandler(), or if no application-specified function is set,
/// is equivalent to calling SDL_GetDefaultAssertionHandler().
///
/// The parameter `puserdata` is a pointer to a void*, which will store the
/// "userdata" pointer that was passed to SDL_SetAssertionHandler(). This value
/// will always be NULL for the default handler. If you don't care about this
/// data, it is safe to pass a NULL pointer to this function to ignore it.
///
/// \param puserdata pointer which is filled with the "userdata" pointer that
/// was passed to SDL_SetAssertionHandler().
/// \returns the SDL_AssertionHandler that is called when an assert triggers.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAssertionHandler
///
/// ```c
/// extern SDL_DECLSPEC SDL_AssertionHandler SDLCALL SDL_GetAssertionHandler(void **puserdata)
/// ```
Pointer<NativeFunction<SdlAssertionHandler>> sdlGetAssertionHandler(
  Pointer<Pointer<NativeType>> puserdata,
) {
  final sdlGetAssertionHandlerLookupFunction = libSdl3.lookupFunction<
    Pointer<NativeFunction<SdlAssertionHandler>> Function(
      Pointer<Pointer<NativeType>> puserdata,
    ),
    Pointer<NativeFunction<SdlAssertionHandler>> Function(
      Pointer<Pointer<NativeType>> puserdata,
    )
  >('SDL_GetAssertionHandler');
  return sdlGetAssertionHandlerLookupFunction(puserdata);
}

///
/// Get a list of all assertion failures.
///
/// This function gets all assertions triggered since the last call to
/// SDL_ResetAssertionReport(), or the start of the program.
///
/// The proper way to examine this data looks something like this:
///
/// ```c
/// const SDL_AssertData *item = SDL_GetAssertionReport();
/// while (item) {
/// printf("'%s', %s (%s:%d), triggered %u times, always ignore: %s.\\n",
/// item->condition, item->function, item->filename,
/// item->linenum, item->trigger_count,
/// item->always_ignore ? "yes" : "no");
/// item = item->next;
/// }
/// ```
///
/// \returns a list of all failed assertions or NULL if the list is empty. This
/// memory should not be modified or freed by the application. This
/// pointer remains valid until the next call to SDL_Quit() or
/// SDL_ResetAssertionReport().
///
/// \threadsafety This function is not thread safe. Other threads calling
/// SDL_ResetAssertionReport() simultaneously, may render the
/// returned pointer invalid.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ResetAssertionReport
///
/// ```c
/// extern SDL_DECLSPEC const SDL_AssertData * SDLCALL SDL_GetAssertionReport(void)
/// ```
Pointer<SdlAssertData> sdlGetAssertionReport() {
  final sdlGetAssertionReportLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlAssertData> Function(),
    Pointer<SdlAssertData> Function()
  >('SDL_GetAssertionReport');
  return sdlGetAssertionReportLookupFunction();
}

///
/// Clear the list of all assertion failures.
///
/// This function will clear the list of all assertions triggered up to that
/// point. Immediately following this call, SDL_GetAssertionReport will return
/// no items. In addition, any previously-triggered assertions will be reset to
/// a trigger_count of zero, and their always_ignore state will be false.
///
/// \threadsafety This function is not thread safe. Other threads triggering an
/// assertion, or simultaneously calling this function may cause
/// memory leaks or crashes.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetAssertionReport
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ResetAssertionReport(void)
/// ```
void sdlResetAssertionReport() {
  final sdlResetAssertionReportLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>(
        'SDL_ResetAssertionReport',
      );
  return sdlResetAssertionReportLookupFunction();
}
