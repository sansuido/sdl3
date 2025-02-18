// https://github.com/ali-bahjati/sdl_gfx_guide/blob/master/wave.c
import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

const gWidth = 1000;
const gHeight = 400;
const gMaxN = 2000;

int main() {
  if (sdlInit(SDL_INIT_VIDEO) == false) {
    print('SDL_Init Error: ${sdlGetError()}');
    return 1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  var window = SdlWindowEx.create(
    title: 'Wave test',
    w: gWidth,
    h: gHeight,
    flags: SDL_WINDOW_OPENGL,
  );
  if (window == nullptr) {
    print('SDL_CreateRenderer Error: ${sdlGetError()}');
    sdlQuit();
    return 2;
  }
  var renderer = window.createRenderer();
  if (renderer == nullptr) {
    print('SDL_CreateRenderer Error: ${sdlGetError()}');
    window.destroy();
    sdlQuit();
    return 3;
  }
  double baseX = 100;
  double baseY = 240;
  var event = calloc<SdlEvent>();
  var points = <Point<double>>[];
  var dx = 3.0;
  var zY = 1 / 10.0;
  var coY = 30;
  var tot = 0;
  var t = 0.0;
  var fun = 5;
  for (var i = 0; i < gMaxN; i++) {
    points.add(Point(0, 0));
  }
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
          break;
        case SDL_EVENT_KEY_DOWN:
          switch (event.key.ref.key) {
            case SDLK_UP:
              coY++;
              break;
            case SDLK_DOWN:
              coY--;
              break;
            case SDLK_LEFT:
              zY -= 0.01;
              break;
            case SDLK_RIGHT:
              zY += 0.01;
              break;
            case SDLK_Z:
              fun++;
              break;
            case SDLK_X:
              fun--;
              if (fun == 0) {
                fun = 1;
              }
              break;
            default:
              break;
          }
          break;
        default:
          break;
      }
    }
    for (var i = 0; i < gMaxN; i++) {
      points[i] = Point(points[i].x + dx, points[i].y);
    }
    for (var i = gMaxN - 1; i > 0; i--) {
      points[i] = Point(points[i - 1].x, points[i - 1].y);
    }
    t += zY;
    points[0] = Point(baseX.toDouble(), baseY + coY * cos(t));
    tot++;
    if (tot > gMaxN) {
      tot--;
    }
    renderer
      ..setDrawColor(0, 0, 0, 0)
      ..clear()
      ..hlineColor(
        0,
        gWidth - 1,
        baseY,
        SdlColorEx.rgbaToU32(0xff, 0xff, 0xff, 0xff),
      )
      ..vlineColor(
        baseX,
        0,
        gHeight - 1,
        SdlColorEx.rgbaToU32(0xff, 0xff, 0xff, 0xff),
      );
    for (var i = 0; (i + fun) < tot; i++) {
      renderer.thickLineColor(
        points[i],
        points[i + fun],
        1,
        SdlColorEx.rgbaToU32(0x00, 0xff, 0x00, 0xff),
      );
    }
    renderer
      ..stringColor(
        Point(10, 10),
        'coY:$coY zY:$zY fun:$fun',
        SdlColorEx.rgbaToU32(0x00, 0xff, 0x00, 0xff),
      )
      ..present();
  }
  event.callocFree();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
