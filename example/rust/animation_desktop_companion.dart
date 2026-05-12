// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/animation.rs
import 'dart:ffi';
import 'dart:io';
import 'package:sdl3/sdl3.dart';

typedef GetWindowLongPtrNative = Int64 Function(IntPtr hWnd, Int32 nIndex);
typedef GetWindowLongPtrDart = int Function(int hWnd, int nIndex);

typedef SetWindowLongPtrNative =
    Int64 Function(IntPtr hWnd, Int32 nIndex, Int64 dwNewLong);
typedef SetWindowLongPtrDart =
    int Function(int hWnd, int nIndex, int dwNewLong);

void makeWindowClickThrough(int hwnd) {
  final user32 = DynamicLibrary.open('user32.dll');

  final getWindowLongPtr = user32
      .lookupFunction<GetWindowLongPtrNative, GetWindowLongPtrDart>(
        'GetWindowLongPtrW',
      );
  final setWindowLongPtr = user32
      .lookupFunction<SetWindowLongPtrNative, SetWindowLongPtrDart>(
        'SetWindowLongPtrW',
      );

  const gwlExstyle = -20;
  const wsExLayered = 0x00080000;
  const wsExTransparent = 0x00000020;
  final currentStyle = getWindowLongPtr(hwnd, gwlExstyle);
  final newStyle = currentStyle | wsExLayered | wsExTransparent;
  setWindowLongPtr(hwnd, gwlExstyle, newStyle);
}

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
  final window = SdlWindowEx.create(
    title: 'SDL3',
    w: 640,
    h: 480,
    flags:
        SdlkWindow.transparent |
        SdlkWindow.borderless |
        SdlkWindow.hidden |
        SdlkWindow.alwaysOnTop,
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
  final displayId = window.getDisplayFor();
  final usable = SdlxRect();
  sdlxGetDisplayUsableBounds(displayId, usable);
  window
    ..setSize(usable.w, 480)
    ..setPosition(0, usable.h - 480)
    ..show();
  if (Platform.isWindows) {
    final hwnd = sdlGetPointerProperty(
      sdlGetWindowProperties(window),
      SDL_PROP_WINDOW_WIN32_HWND_POINTER,
      nullptr,
    );
    makeWindowClickThrough(hwnd.address);
  }
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
    charas[0].dstrect.x = 1 * ((ticks / 14) % (usable.w + 128)).floor() - 128;
    charas[1].srcrect.x = 32 * ((ticks / 100) % 4).floor().toDouble();
    charas[1].dstrect.x =
        (1 * ((ticks / 12) % (usable.w + 128)).floor() - (usable.w + 32)) * -1;
    charas[2].srcrect.x = 32 * ((ticks / 100) % 4).floor().toDouble();
    charas[2].dstrect.x = 1 * ((ticks / 10) % (usable.w + 128)).floor() - 128;
    renderer
      ..setDrawColor(SdlxColor(0, 0, 0, 0))
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
