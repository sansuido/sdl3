import 'dart:ffi';
import 'package:ffi/ffi.dart' as ffi;
import 'package:sdl3/sdl3.dart';

void dialogFileCallback(
  Pointer<NativeType> userdata,
  Pointer<Pointer<Int8>> filelist,
  int filter,
) {
  if (filelist == nullptr) {
    print('No file selected');
    return;
  }
  for (var i = 0; filelist[i] != nullptr; i++) {
    final file = filelist[i].cast<ffi.Utf8>().toDartString();
    print('Selected file: $file, filter: $filter');
  }
}

Future<void> main() async {
  if (!sdlInit(SdlkInit.video)) {
    return;
  }
  final window = SdlWindowEx.create(
    title: 'Dialog Demo (o=openFileDialog s=saveFileDialog)',
    w: 640,
    h: 480,
  );
  final dialogFileCall = NativeCallable<SdlDialogFileCallback>.listener(
    dialogFileCallback,
  );
  print('${sdlGetError()}');
  final event = ffi.calloc<SdlEvent>();
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SdlkEvent.quit:
          running = false;
        case SdlkEvent.keyDown:
          switch (event.key.ref.key) {
            case Sdlk.escape:
              running = false;
            case Sdlk.o:
              sdlxShowOpenFileDialog(
                callback: dialogFileCall.nativeFunction,
                window: window,
                filters: [
                  SdlxDialogFileFilter(name: 'All Files', pattern: '*'),
                ],
                allowMany: true,
              );
            case Sdlk.s:
              sdlxShowSaveFileDialog(
                callback: dialogFileCall.nativeFunction,
                window: window,
                filters: [
                  SdlxDialogFileFilter(name: 'All Files', pattern: '*'),
                ],
                defaultLocation: 'default.txt',
              );
          }
      }
    }
    await Future.delayed(const Duration(milliseconds: 16));
  }
  dialogFileCall.close();
  event.callocFree();
  window.destroy();
  sdlQuit();
}
