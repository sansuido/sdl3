// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/animation.rs
import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

class Chara {
  Chara(
    this.srcrect,
    this.dstrect, {
    this.angle = 0,
    this.flip = SDL_FLIP_NONE,
  });
  late SdlxFRect srcrect;
  late SdlxFRect dstrect;
  late double angle;
  late int flip;
}

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(title: 'SDL3', w: 640, h: 480);
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
  // animation sheet and extras are available from
  // https://opengameart.org/content/a-platformer-in-the-forest
  final texture = renderer.loadTexture('assets/rust/characters.bmp');
  var running = true;
  // Baby - walk animation
  // King - walk animation
  // Soldier - walk animation
  final charas = <Chara>[
    Chara(SdlxFRect(w: 32, h: 32), SdlxFRect(w: 32 * 4, h: 32 * 4)),
    Chara(
      SdlxFRect(y: 32, w: 32, h: 32),
      SdlxFRect(w: 32 * 4, h: 32 * 4),
      flip: SDL_FLIP_HORIZONTAL,
    ),
    Chara(SdlxFRect(y: 64, w: 32, h: 32), SdlxFRect(w: 32 * 4, h: 32 * 4)),
  ];
  charas[0].dstrect.center = SdlxFPoint(-64, 120);
  charas[1].dstrect.center = SdlxFPoint(0, 240);
  charas[2].dstrect.center = SdlxFPoint(440, 360);
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        if (event.scancode == SdlkScancode.escape) {
          running = false;
        }
      }
    }
    final ticks = sdlGetTicks();
    charas[0].srcrect.x = 32 * ((ticks / 100) % 4).floor().toDouble();
    charas[0].dstrect.x = 1 * ((ticks / 14) % 768).floor() - 128;
    charas[1].srcrect.x = 32 * ((ticks / 100) % 4).floor().toDouble();
    charas[1].dstrect.x = (1 * ((ticks / 12) % 768).floor() - 672) * -1;
    charas[2].srcrect.x = 32 * ((ticks / 100) % 4).floor().toDouble();
    charas[2].dstrect.x = 1 * ((ticks / 10) % 768).floor() - 128;
    renderer
      ..setDrawColor(SdlxColor(0, 0, 0))
      ..clear();
    // copy the frame to the canvas
    for (final chara in charas) {
      renderer.textureRotated(
        texture,
        srcrect: chara.srcrect,
        dstrect: chara.dstrect,
        angle: chara.angle,
        flip: chara.flip,
      );
    }
    renderer.present();
  }
  texture.destroy();
  window.destroy();
  renderer.destroy();
  sdlQuit();
  return 0;
}
