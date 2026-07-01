part of '../../../sdl.dart';

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
/// {@category system}
({int adapterIndex, int outputIndex})? sdlxGetDxgiOutputInfo(int displayId) {
  var adapterIndex = 0;
  var outputIndex = 0;
  final adapterIndexPointer = ffi.calloc<Int32>();
  final outputIndexPointer = ffi.calloc<Int32>();
  final bl = sdlGetDxgiOutputInfo(
    displayId,
    adapterIndexPointer,
    outputIndexPointer,
  );
  if (bl) {
    adapterIndex = adapterIndexPointer.value;
    outputIndex = outputIndexPointer.value;
  }
  adapterIndexPointer.callocFree();
  outputIndexPointer.callocFree();
  if (!bl) {
    return null;
  }
  return (adapterIndex: adapterIndex, outputIndex: outputIndex);
}
