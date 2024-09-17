// https://gist.github.com/superzazu/f24aaf202248440c6097b85105d0bbae
import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

const gWinWidth = 160;
const gWinHeight = 144;

int main() {
  // SDL init
  if (sdlInit(SDL_INIT_VIDEO) == false) {
    print('Unable to initialize SDL: ${sdlGetError()}');
    return 1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  // create SDL window
  var window = SdlWindowEx.create(
      title: 'sdl2_pixelbuffer',
      w: gWinWidth * 4,
      h: gWinHeight * 4,
      flags: SDL_WINDOW_RESIZABLE);
  if (window == nullptr) {
    print("Unable to create window: ${sdlGetError()}");
    sdlQuit();
    return 1;
  }
  // create renderer
  var renderer = window.createRenderer();
  if (renderer == nullptr) {
    print("Unable to create renderer: ${sdlGetError()}");
    window.destroy();
    sdlQuit();
    return 1;
  }

  renderer.setLogicalPresentation(gWinWidth, gWinHeight,
      SDL_LOGICAL_PRESENTATION_STRETCH, SDL_SCALEMODE_NEAREST);
  // create texture
  var texture = renderer.createTexture(SDL_PIXELFORMAT_RGBA8888,
      SDL_TEXTUREACCESS_STREAMING, gWinWidth, gWinHeight);
  if (texture == nullptr) {
    print('Unable to create texture: ${sdlGetError()}');
    renderer.destroy();
    window.destroy();
    sdlQuit();
  }
  // array of pixels
  var texturePixels = calloc<Pointer<Uint32>>();
  var texturePitch = calloc<Int32>();
  texture.lock(nullptr, texturePixels, texturePitch);
  // update texture with new data
  texturePixels.value.value =
      ByteData.view(Uint8List.fromList([255, 0, 0, 255]).buffer).getUint32(0);
  (texturePixels.value + gWinWidth * gWinHeight ~/ 2 + gWinWidth ~/ 2).value =
      ByteData.view(Uint8List.fromList([0, 255, 0, 255]).buffer).getUint32(0);
  (texturePixels.value + gWinWidth * gWinHeight - 1).value =
      ByteData.view(Uint8List.fromList([0, 0, 255, 255]).buffer).getUint32(0);
  texture.unlock();
  // main loop
  var event = calloc<SdlEvent>();
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
          break;
        default:
          break;
      }
      // render on screen
      renderer
        ..clear()
        ..texture(texture)
        ..present();
    }
  }
  event.callocFree();
  texture.destroy();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
