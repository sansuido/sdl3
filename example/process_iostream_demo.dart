import 'dart:convert';
import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(0)) {
    print('error initializing SDL, ${sdlGetError()}');
    return -1;
  }
  final process = sdlxCreateProcess(['cmd', '/c', 'dir'], pipeStdio: true);
  if (process == nullptr) {
    print('error creating process, ${sdlGetError()}');
    sdlQuit();
    return -1;
  }
  final allBytes = <int>[];
  final stream = process.getOutput();
  if (stream != nullptr) {
    while (true) {
      final byte = stream.readUint8();
      if (byte != null) {
        allBytes.add(byte);
      }
      final status = stream.getStatus();
      if (status == SDL_IO_STATUS_EOF || status == SDL_IO_STATUS_ERROR) {
        break;
      }
    }
  }
  print(utf8.decode(allBytes));
  process.destroy();
  sdlQuit();
  return 0;
}
