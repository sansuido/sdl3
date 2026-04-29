import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
  final event = calloc<SdlEvent>();
  final clickPoints = <SdlxFPoint>[];
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
        case SDL_EVENT_KEY_DOWN:
          switch (event.key.ref.key) {
            case SDLK_ESCAPE:
              running = false;
          }
        case SDL_EVENT_MOUSE_BUTTON_DOWN:
          switch (event.button.ref.button) {
            case SDL_BUTTON_LEFT:
              final position = SdlxFPoint(0, 0);
              sdlxGetMouseState(position);
              clickPoints.add(position);
            //clickPoints.add(PointEx.getMousePosition());
            case SDL_BUTTON_RIGHT:
              if (clickPoints.isNotEmpty) {
                clickPoints.removeLast();
              }
            default:
              break;
          }
        default:
          break;
      }
    }
    const marge = 64;
    final windowPosition = SdlxPoint(0, 0);
    window.getSize(windowPosition);
    final clip = SdlxFRect(
      x: marge.toDouble(),
      y: marge.toDouble(),
      w: windowPosition.x - marge * 2,
      h: windowPosition.y - marge * 2,
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
    fpsManager.delay();
  }
  gfx.gfxFree();
  event.callocFree();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
