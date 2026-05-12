import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

int hitTest(
  Pointer<SdlWindow> window,
  Pointer<SdlPoint> area,
  Pointer<NativeType> data,
) {
  final flags = sdlGetWindowFlags(window);
  final isFullscreen = (flags & SdlkWindow.fullscreen) != 0;
  if (isFullscreen) {
    print('fullscreen');
    return SdlkHittest.normal;
  }
  final size = SdlxPoint(0, 0);
  if (!sdlxGetWindowSize(window, size)) {
    print('Failed to get window size');
    return SdlkHittest.normal;
  }
  final w = size.x;
  final h = size.y;
  final x = area.ref.x;
  final y = area.ref.y;
  const b = 8;

  if (x < b && y < b) return SdlkHittest.resizeTopleft;
  if (x > w - b && y < b) return SdlkHittest.resizeTopright;
  if (x > w - b && y > h - b) return SdlkHittest.resizeBottomright;
  if (x < b && y > h - b) return SdlkHittest.resizeBottomleft;

  if (x < b) return SdlkHittest.resizeLeft;
  if (x > w - b) return SdlkHittest.resizeRight;
  if (y < b) return SdlkHittest.resizeTop;
  if (y > h - b) return SdlkHittest.resizeBottom;

  if (y < 50) {
    return SdlkHittest.draggable;
  }
  return SdlkHittest.normal;
}

Future<void> main() async {
  if (!sdlInit(SdlkInit.video)) {
    return;
  }
  final window = SdlWindowEx.create(
    title: 'HIT test',
    w: 640,
    h: 480,
    flags: SdlkWindow.borderless | SdlkWindow.resizable,
  );
  final renderer = window.createRenderer();
  final hitTestCall = NativeCallable<SdlHitTest>.isolateLocal(
    hitTest,
    exceptionalReturn: SdlkHittest.normal,
  );
  sdlSetWindowHitTest(window, hitTestCall.nativeFunction, nullptr);
  var running = true;
  var fullscreen = false;
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        switch (event.scancode) {
          case SdlkScancode.f11:
            fullscreen = !fullscreen;
            sdlSetWindowFullscreen(window, fullscreen);
          case SdlkScancode.escape:
            running = false;
        }
      }
    }
    final windowSize = SdlxPoint(0, 0);
    if (sdlxGetWindowSize(window, windowSize)) {
      sdlSetRenderDrawColor(renderer, 30, 30, 30, 255);
      sdlRenderClear(renderer);
      sdlSetRenderDrawColor(renderer, 60, 60, 65, 255);
      final titleRect = SdlxFRect()
        ..x = 0
        ..y = 0
        ..w = windowSize.x.toDouble()
        ..h = 50;
      renderer.fillRect(titleRect);
      sdlSetRenderDrawColor(renderer, 100, 100, 100, 255);
      sdlRenderLine(renderer, 0, 49, windowSize.x.toDouble(), 49);
      sdlRenderPresent(renderer);
    }
    await Future.delayed(const Duration(milliseconds: 16));
  }
  hitTestCall.close();
  renderer.destroy();
  window.destroy();
  sdlQuit();
}
