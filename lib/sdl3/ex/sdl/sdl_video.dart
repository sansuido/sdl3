part of '../../sdl.dart';

///
/// Get the size of a window's client area, in pixels.
///
/// \param window the window from which the drawable size should be queried.
/// \param w a pointer to variable for storing the width in pixels, may be
/// NULL.
/// \param h a pointer to variable for storing the height in pixels, may be
/// NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateWindow
/// \sa SDL_GetWindowSize
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowSizeInPixels(SDL_Window *window, int *w, int *h)
/// ```
/// {@category video}
bool sdlxGetWindowSizeInPixels(Pointer<SdlWindow> window, SdlxPoint size) {
  var result = false;
  final wPointer = calloc<Int32>();
  final hPointer = calloc<Int32>();
  result = sdlGetWindowSizeInPixels(window, wPointer, hPointer);
  size
    ..x = wPointer.value
    ..y = hPointer.value;
  wPointer.callocFree();
  hPointer.callocFree();
  return result;
}
