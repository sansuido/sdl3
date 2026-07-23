import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(0)) {
    print('error initializing SDL, ${sdlGetError()}');
    return -1;
  }
  if (sdlHidInit() != 0) {
    print('error initializing HIDAPI, ${sdlGetError()}');
    sdlQuit();
    return -1;
  }
  final devices = sdlHidEnumerate(0, 0);
  if (devices == nullptr) {
    print('devices: ${sdlGetError()}');
  }
  var currentDevice = devices;
  while (currentDevice != nullptr) {
    print(currentDevice.ref.manufacturerString.toDartString());
    currentDevice = currentDevice.ref.next;
  }
  sdlHidFreeEnumeration(devices);
  sdlHidExit();
  sdlQuit();
  return 0;
}
