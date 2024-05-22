// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/animation.rs
import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

class Chara {
  late Rectangle<double> srcrect;
  late Rectangle<double> dstrect;
  late double angle;
  late int flip;
  Chara(this.srcrect, this.dstrect,
      {this.angle = 0, this.flip = SDL_FLIP_NONE});
}

int main() {
  if (sdlInit(SDL_INIT_VIDEO) < 0) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  var window = SdlWindowEx.create(title: 'SDL3', w: 640, h: 480);
  if (window == nullptr) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  var renderer = window.createRenderer();
  if (renderer == nullptr) {
    print(sdlGetError());
    window.destroy();
    sdlQuit();
    return -1;
  }
  // animation sheet and extras are available from
  // https://opengameart.org/content/a-platformer-in-the-forest
  var texture = renderer.loadTexture('assets/rust/characters.bmp');
  var event = calloc<SdlEvent>();
  var running = true;
  var charas = <Chara>[];
  // Baby - walk animation
  charas.add(Chara(Rectangle(0, 0, 32, 32), Rectangle(0, 0, 32 * 4, 32 * 4)));
  // King - walk animation
  charas.add(Chara(Rectangle(0, 32, 32, 32), Rectangle(0, 0, 32 * 4, 32 * 4),
      flip: SDL_FLIP_HORIZONTAL));
  // Soldier - walk animation
  charas.add(Chara(Rectangle(0, 64, 32, 32), Rectangle(0, 0, 32 * 4, 32 * 4)));
  charas[0].dstrect = charas[0].dstrect.centerOn(Point(-64, 120));
  charas[1].dstrect = charas[1].dstrect.centerOn(Point(0, 240));
  charas[2].dstrect = charas[2].dstrect.centerOn(Point(440, 360));
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
          break;
        case SDL_EVENT_KEY_DOWN:
          if (event.key.keysym.ref.sym == SDLK_ESCAPE) {
            running = false;
          }
          break;
        default:
          break;
      }
    }
    var ticks = sdlGetTicks();
    charas[0].srcrect =
        charas[0].srcrect.setX(32 * ((ticks / 100) % 4).floor().toDouble());
    charas[0].dstrect =
        charas[0].dstrect.setX(1 * ((ticks / 14) % 768).floor() - 128);
    charas[1].srcrect =
        charas[1].srcrect.setX(32 * ((ticks / 100) % 4).floor().toDouble());
    charas[1].dstrect =
        charas[1].dstrect.setX((1 * ((ticks / 12) % 768).floor() - 672) * -1);
    charas[2].srcrect =
        charas[2].srcrect.setX(32 * ((ticks / 100) % 4).floor().toDouble());
    charas[2].dstrect =
        charas[2].dstrect.setX(1 * ((ticks / 10) % 768).floor() - 128);
    renderer
      ..setDrawColor(0, 0, 0, SDL_ALPHA_OPAQUE)
      ..clear();
    // copy the frame to the canvas
    for (var chara in charas) {
      renderer.textureRotated(texture,
          srcrect: chara.srcrect,
          dstrect: chara.dstrect,
          angle: chara.angle,
          flip: chara.flip);
    }
    renderer.present();
  }
  event.callocFree();
  texture.destroy();
  window.destroy();
  renderer.destroy();
  sdlQuit();
  return 0;
}
