// https://discourse.libsdl.org/t/is-possible-to-create-ambient-light-in-sdl2/28381
import 'dart:math' as math;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (sdlInit(SdlkInit.video) == false) {
    print(sdlGetError());
    return -1;
  }
  var window = SdlWindowEx.create(title: '2D Light test', w: 640, h: 480);
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
  // blend mode as SDL_BLENDMODE_ADD, imported from a file or something
  var lightsLayer = renderer.createTexture(
    SdlkPixelformat.rgba8888,
    SdlkTextureaccess.target,
    640,
    480,
  );
  lightsLayer.setBlendMode(SdlkBlendmode.add);
  // blend mode as SDL_BLENDMODE_MOD, should be created with SDL_CreateTexture with SDL_TEXTUREACCESS_TARGET
  var shadowLayer = renderer.createTexture(
    SdlkPixelformat.rgba8888,
    SdlkTextureaccess.target,
    640,
    480,
  );
  shadowLayer.setBlendMode(SdlkBlendmode.mod);
  // "game" graphics rendered
  var bgSurface = imgLoad('assets/jap/gate.png');
  var bgTexture = renderer.createTextureFromSurface(bgSurface);
  bgSurface.destroy();
  // light spot
  var lightSurface = imgLoad('assets/spot.png');
  var lightTexture = renderer.createTextureFromSurface(lightSurface);
  lightSurface.destroy();
  double tintMin = 0.05;
  double tintMax = 0.8;
  double calcValue = 0.001;
  double angle = 0;
  double tint = tintMin;
  double calc = 0;
  var event = calloc<SdlEvent>();
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SdlkEvent.quit:
          running = false;
          break;
        case SdlkEvent.mouseButtonDown:
          // left click event
          if (event.button.ref.button == SdlkButton.left) {
            if (tint <= tintMin) {
              calc = calcValue;
            } else if (tint >= tintMax) {
              calc = -calcValue;
            }
          }
          break;
      }
    }
    // draw light points
    {
      renderer.setTarget(lightsLayer);
      renderer.setDrawColorFloat(0, 0, 0, 0);
      renderer.clear();
      var size = math.Point<double>(200, 200);
      var position = PointEx.getMousePosition();
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
      renderer.setTarget(shadowLayer);
      // put your desired tint , (the alpha value has no effect here)
      renderer.setDrawColorFloat(tint, tint, tint, 1);
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
      renderer.fillRect();
      // your spotlights
      renderer.texture(lightsLayer);
      renderer.setTarget(nullptr);
    }
    // render everythings
    {
      renderer.setDrawColorFloat(0, 0, 0, 0);
      renderer.clear();
      renderer.texture(bgTexture);
      renderer.texture(shadowLayer);
      renderer.present();
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
