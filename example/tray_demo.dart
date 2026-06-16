import 'dart:ffi';
import 'package:sdl3/sdl3.dart';
import 'package:sdl3/sdl3gfx.dart' as gfx;

void onTrayCallback(Pointer<Void> userdata, Pointer<SdlTrayEntry> entry) {
  final label = sdlGetTrayEntryLabel(entry);
  if (label != null && label.contains('Quit')) {
    print('Bye!');
    sdlxPushEvent(SdlxQuitEvent());
  } else {
    print('Hello!');
  }
}

Future<int> main() async {
  if (!sdlInit(SdlkInit.video)) {
    return -1;
  }
  final iconSurface = sdlCreateSurface(16, 16, SdlkPixelformat.rgba8888);
  if (iconSurface == nullptr) {
    sdlQuit();
    return -1;
  }
  final tray = sdlCreateTray(iconSurface, 'My SDL3 App');
  if (tray == nullptr) {
    sdlDestroySurface(iconSurface);
    sdlQuit();
  }
  final onTrayCall = NativeCallable<SdlTrayCallback>.listener(onTrayCallback);
  final menu = tray.createMenu();
  // hello entry
  final helloEntry = menu.insertEntryAt(-1, 'Hello SDL3', SDL_TRAYENTRY_BUTTON)
    ..setCallback(onTrayCall.nativeFunction, nullptr);
  // quit entry
  menu
      .insertEntryAt(-1, 'Quit App', SDL_TRAYENTRY_BUTTON)
      .setCallback(onTrayCall.nativeFunction, nullptr);
  // hello test
  helloEntry.click();
  var running = true;
  final fps = gfx.FpsManager();
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
    }
    await fps.delay();
  }
  onTrayCall.close();
  tray.destroy();
  iconSurface.destroy();
  sdlQuit();
  return 0;
}
