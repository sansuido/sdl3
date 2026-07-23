// https://gist.github.com/superzazu/f24aaf202248440c6097b85105d0bbae
import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

const gWinWidth = 160;
const gWinHeight = 144;

int main() {
  // SDL init
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print('Unable to initialize SDL: ${sdlGetError()}');
    return 1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  // create SDL window
  final window = SdlWindowEx.create(
    title: 'sdl2_pixelbuffer',
    w: gWinWidth * 4,
    h: gWinHeight * 4,
    flags: SDL_WINDOW_RESIZABLE,
  );
  if (window == nullptr) {
    print('Unable to create window: ${sdlGetError()}');
    sdlQuit();
    return 1;
  }
  // create renderer
  final renderer = window.createRenderer();
  if (renderer == nullptr) {
    print('Unable to create renderer: ${sdlGetError()}');
    window.destroy();
    sdlQuit();
    return 1;
  }

  renderer.setLogicalPresentation(
    SdlxRenderLogicalPresentation()
      ..w = gWinWidth
      ..h = gWinHeight
      ..mode = SDL_LOGICAL_PRESENTATION_STRETCH,
  );
  // create texture
  final texture = renderer.createTexture(
    SDL_PIXELFORMAT_RGBA8888,
    SDL_TEXTUREACCESS_STREAMING,
    gWinWidth,
    gWinHeight,
  );
  if (texture == nullptr) {
    print('Unable to create texture: ${sdlGetError()}');
    renderer.destroy();
    window.destroy();
    sdlQuit();
  }
  // array of pixels
  final texturePixels = calloc<Pointer<Void>>();
  final texturePitch = calloc<Int32>();
  texture.lock(nullptr, texturePixels, texturePitch);
  // update texture with new data
  texturePixels.value.cast<Uint32>().value = ByteData.view(
    Uint8List.fromList([255, 0, 0, 255]).buffer,
  ).getUint32(0);
  (texturePixels.value.cast<Uint32>() +
          gWinWidth * gWinHeight ~/ 2 +
          gWinWidth ~/ 2)
      .value = ByteData.view(
    Uint8List.fromList([0, 255, 0, 255]).buffer,
  ).getUint32(0);
  (texturePixels.value.cast<Uint32>() + gWinWidth * gWinHeight - 1).value =
      ByteData.view(Uint8List.fromList([0, 0, 255, 255]).buffer).getUint32(0);
  texture.unlock();
  // main loop
  var running = true;
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
    // render on screen
    renderer
      ..clear()
      ..texture(texture)
      ..present();
  }
  texture.destroy();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
