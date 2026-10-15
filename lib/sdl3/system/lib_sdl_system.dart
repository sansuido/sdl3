part of '../sdl_system.dart';

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
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetDXGIOutputInfo(SDL_DisplayID displayID, int *adapterIndex, int *outputIndex)
/// ```
///
/// See also:
/// - [SDL_GetDXGIOutputInfo - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetDXGIOutputInfo)
///
/// {@category system}
({int adapterIndex, int outputIndex})? sdlxGetDxgiOutputInfo(int displayId) =>
    ffi.using((arena) {
      final adapterIndexPointer = arena<Int32>();
      final outputIndexPointer = arena<Int32>();

      if (!sdlGetDxgiOutputInfo(
        displayId,
        adapterIndexPointer,
        outputIndexPointer,
      )) {
        return null;
      }

      return (
        adapterIndex: adapterIndexPointer.value,
        outputIndex: outputIndexPointer.value,
      );
    });
