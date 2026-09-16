import 'dart:ffi';

import 'package:sdl3/sdl3.dart';
import 'package:sdl3/sdl3gfx.dart' as gfx;

const gScreenWidth = 800;
const gScreenHeight = 600;

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(
    title: 'enclose',
    w: gScreenWidth,
    h: gScreenHeight,
    flags: SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE,
  );
  if (window == nullptr) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  final renderer = window.createRenderer();
  if (renderer == nullptr) {
    print(sdlGetError());
    window.destroy();
    sdlQuit();
    return -1;
  }
  final fpsManager = gfx.FpsManager();
  final clickPoints = <SdlxFPoint>[];
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
        }
      }
      if (event is SdlxMouseButtonEvent &&
          event.type == SdlkEvent.mouseButtonDown) {
        switch (event.button) {
          case SdlkButton.left:
            final mouseState = sdlxGetMouseState();
            clickPoints.add(SdlxFPoint(mouseState.x, mouseState.y));
          case SdlkButton.right:
            if (clickPoints.isNotEmpty) {
              clickPoints.removeLast();
            }
        }
      }
    }
    const marge = 64;
    final windowSize = window.getSize()!;
    final clip = SdlxFRect(
      marge.toDouble(),
      marge.toDouble(),
      windowSize.w.toDouble() - marge * 2,
      windowSize.h.toDouble() - marge * 2,
    );
    renderer
      ..setDrawColor(SdlxColor(0, 0, 0))
      ..clear()
      ..boxColor(clip, SdlxColor(0, 0, 255, 64));
    final resultRect = SdlxRect();
    if (sdlxGetRectEnclosingPoints(
      clickPoints.toInt(),
      clip.toInt(),
      resultRect,
    )) {
      renderer.rectangleColor(resultRect.toFloat(), SdlxColor(255, 255, 255));
    }
    for (var n = 0; n < clickPoints.length; n++) {
      renderer.stringColor(
        clickPoints[n],
        (n + 1).toString(),
        SdlxColor(0, 255, 0),
      );
    }
    renderer.present();
    fpsManager.delaySync();
  }
  gfx.gfxFree();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
