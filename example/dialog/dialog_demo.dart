import 'dart:ffi';
import 'package:ffi/ffi.dart' as ffi;
import 'package:sdl3/sdl3.dart';

void dialogFileCallback(
  Pointer<Void> userdata,
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
  var running = true;
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        switch (event.scancode) {
          case SdlkScancode.escape:
            running = false;
          case SdlkScancode.o:
            sdlxShowOpenFileDialog(
              callback: dialogFileCall.nativeFunction,
              window: window,
              filters: [SdlxDialogFileFilter(name: 'All Files', pattern: '*')],
              allowMany: true,
            );
          case SdlkScancode.s:
            sdlxShowSaveFileDialog(
              callback: dialogFileCall.nativeFunction,
              window: window,
              filters: [SdlxDialogFileFilter(name: 'All Files', pattern: '*')],
              defaultLocation: 'default.txt',
            );
        }
      }
    }
    await Future.delayed(const Duration(milliseconds: 16));
  }
  dialogFileCall.close();
  window.destroy();
  sdlQuit();
}
