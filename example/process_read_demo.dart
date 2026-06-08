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
  final result = SdlxDataResult();
  if (process.read(result)) {
    print(utf8.decode(result.data!));
    print('datasize: ${result.datasize}');
    print('exitcode: ${result.exitcode}');
  } else {
    print('error read process, ${sdlGetError()}');
  }
  process.destroy();
  sdlQuit();
  return 0;
}
