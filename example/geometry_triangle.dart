import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(title: 'geometry', w: 800, h: 600);
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
  final verts = calloc<SdlVertex>(3);
  final vert0 = verts + 0;
  vert0.position.ref.x = 400;
  vert0.position.ref.y = 150;
  vert0.color.ref.r = 1.0;
  vert0.color.ref.g = 0.0;
  vert0.color.ref.b = 0.0;
  vert0.color.ref.a = 1.0;
  //// left
  final vert1 = verts + 1;
  vert1.position.ref.x = 200;
  vert1.position.ref.y = 450;
  vert1.color.ref.r = 0.0;
  vert1.color.ref.g = 0.0;
  vert1.color.ref.b = 1.0;
  vert1.color.ref.a = 1.0;
  //// right
  final vert2 = verts + 2;
  vert2.position.ref.x = 600;
  vert2.position.ref.y = 450;
  vert2.color.ref.r = 0.0;
  vert2.color.ref.g = 1.0;
  vert2.color.ref.b = 0.0;
  vert2.color.ref.a = 1.0;
  final event = calloc<SdlEvent>();
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
        default:
          break;
      }
    }
    renderer
      ..setDrawColor(0, 0, 0, SDL_ALPHA_OPAQUE)
      ..clear()
      ..geometry(nullptr, verts, 3, nullptr, 0)
      ..present();
  }
  event.callocFree();
  verts.callocFree();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
