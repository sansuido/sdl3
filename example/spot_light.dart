// https://discourse.libsdl.org/t/is-possible-to-create-ambient-light-in-sdl2/28381
import 'dart:ffi';
import 'dart:math' as math;

import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SdlkInit.video)) {
    print(sdlGetError());
    return -1;
  }
  final window = SdlWindowEx.create(title: '2D Light test', w: 640, h: 480);
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
  // blend mode as SDL_BLENDMODE_ADD, imported from a file or something
  final lightsLayer = renderer.createTexture(
    SdlkPixelformat.rgba8888,
    SdlkTextureaccess.target,
    640,
    480,
  )..setBlendMode(SdlkBlendmode.add);
  // blend mode as SDL_BLENDMODE_MOD, should be created with SDL_CreateTexture with SDL_TEXTUREACCESS_TARGET
  final shadowLayer = renderer.createTexture(
    SdlkPixelformat.rgba8888,
    SdlkTextureaccess.target,
    640,
    480,
  )..setBlendMode(SdlkBlendmode.mod);
  // "game" graphics rendered
  final bgSurface = imgLoad('assets/jap/gate.png');
  final bgTexture = renderer.createTextureFromSurface(bgSurface);
  bgSurface.destroy();
  // light spot
  final lightSurface = imgLoad('assets/spot.png');
  final lightTexture = renderer.createTextureFromSurface(lightSurface);
  lightSurface.destroy();
  const tintMin = 0.05;
  const tintMax = 0.8;
  const calcValue = 0.001;
  double angle = 0;
  var tint = tintMin;
  double calc = 0;
  final event = calloc<SdlEvent>();
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SdlkEvent.quit:
          running = false;
        case SdlkEvent.mouseButtonDown:
          // left click event
          if (event.button.ref.button == SdlkButton.left) {
            if (tint <= tintMin) {
              calc = calcValue;
            } else if (tint >= tintMax) {
              calc = -calcValue;
            }
          }
      }
    }
    // draw light points
    {
      renderer
        ..setTarget(lightsLayer)
        ..setDrawColorFloat(0, 0, 0, 1)
        ..clear();
      const size = math.Point<double>(200, 200);
      final position = PointEx.getMousePosition();
      renderer.textureRotated(
        lightTexture,
        dstrect: RectangleEx.fromCenter(position, size),
        angle: angle,
      );
      angle += 0.1;
      renderer.setTarget(nullptr);
    }
    // rendering the shadow & lights
    {
      renderer
        ..setTarget(shadowLayer)
        // put your desired tint , (the alpha value has no effect here)
        ..setDrawColorFloat(tint, tint, tint, 1);
      if (calc != 0) {
        tint += calc;
        if (tint <= tintMin) {
          tint = tintMin;
          calc = 0;
        } else if (tint >= tintMax) {
          tint = tintMax;
          calc = 0;
        }
      }
      // draw the color to the entire shadow
      renderer
        ..fillRect()
        // your spotlights
        ..texture(lightsLayer)
        ..setTarget(nullptr);
    }
    // render everythings
    {
      renderer
        ..setDrawColorFloat(0, 0, 0, 0)
        ..clear()
        ..texture(bgTexture)
        ..texture(shadowLayer)
        ..present();
    }
  }
  event.callocFree();
  bgTexture.destroy();
  lightTexture.destroy();
  lightsLayer.destroy();
  shadowLayer.destroy();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
