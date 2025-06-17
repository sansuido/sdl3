// https://dxlib.xsrv.jp/dxprogram.html#N6
// 5.サウンドのベル基本
// 5.Sound novel basics
import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

const gTitle = 'DXLIB Tutorial 06';
const gScreenWidth = 640;
const gScreenHeight = 480;
const gFontPath = 'assets/SourceHanCodeJP.ttc';
//const gFontPath = 'C:/Windows/Fonts/msgothic.ttc';
const gFontSize = 24.0;
const gString =
    '　ゲームプログラムとは、いやプログラムとは'
    'ある事柄を実現するプログラムの方法を説明されても理解できないことがある。B'
    '@　なぜならそのプログラム技法も何かの基本的な技法の組み合わせで出来ているからだ。B'
    '@　これはその他の学問も基本がわからないと応用が利かないということと同じ現象で、'
    '別に特に珍しいことでもない。B'
    'C　しかしゲームプログラムとなると覚えなくてはならない基礎が沢山あり、'
    'さらにある程度クオリティの高いソフトを作ろうとすると色々なプログラム技法を'
    '習得しなくてはならない。B'
    '@　しかもある程度レベルが高くなると自分で技法を編み出すか、技術レベルの高い'
    'プログラマーに聞くなどするしか方法がなく大変厄介である。B'
    'というかそのせいでゲームプログラムの敷居は高くなっているといえる。BE';

class Game {
  Pointer<SdlWindow> window = nullptr;
  Pointer<SdlRenderer> renderer = nullptr;
  Pointer<SdlTexture> pressAnyKeyTexture = nullptr;
  var charaTextures = <String, Pointer<SdlTexture>>{};
  var displayString = '';
  var displayPos = 0;
  var running = false;
  var buttonWait = false;
  var tick = 0;

  bool init() {
    if (!sdlInit(SDL_INIT_VIDEO)) {
      return false;
    }
    sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
    if (!ttfInit()) {
      return false;
    }
    window = SdlWindowEx.create(
      title: gTitle,
      w: gScreenWidth,
      h: gScreenHeight,
      flags: SDL_WINDOW_RESIZABLE,
    );
    if (window == nullptr) {
      return false;
    }
    renderer = window.createRenderer();
    if (renderer == nullptr) {
      return false;
    }
    return loadCharaTextures() && loadPressAnyKeyTexture();
  }

  bool loadCharaTextures() {
    final font = TtfFontEx.open(gFontPath, gFontSize);
    if (font == nullptr) {
      return false;
    }
    for (var n = 0; n < gString.length; n++) {
      final chara = gString[n];
      if (!charaTextures.containsKey(chara)) {
        final textColor = calloc<SdlColor>()..setRgba(0, 0, 0, 255);
        final surface = font.renderTextBlended(chara, textColor.ref);
        if (surface != nullptr) {
          final texture = renderer.createTextureFromSurface(surface);
          charaTextures[chara] = texture;
          surface.destroy();
        }
        textColor.callocFree();
      }
    }
    font.close();
    return true;
  }

  bool loadPressAnyKeyTexture() {
    final font = TtfFontEx.open(gFontPath, gFontSize);
    if (font == nullptr) {
      return false;
    }
    final textColor = calloc<SdlColor>()..setRgba(0, 0, 0, 255);
    final alertColor = calloc<SdlColor>()..setRgba(255, 0, 0, 255);

    final surface = font.renderTextShaded(
      '[PRESS ANY KEY]',
      textColor.ref,
      alertColor.ref,
    );
    if (surface != nullptr) {
      pressAnyKeyTexture = renderer.createTextureFromSurface(surface);
      surface.destroy();
    }
    font.close();
    textColor.callocFree();
    alertColor.callocFree();
    return true;
  }

  void handleEvents() {
    final event = calloc<SdlEvent>();
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
        case SDL_EVENT_KEY_DOWN:
          if (buttonWait) {
            buttonWait = false;
          }
        default:
          break;
      }
    }
    event.callocFree();
  }

  void update() {
    if (!buttonWait) {
      if (tick > 2) {
        if (displayPos < gString.length) {
          switch (gString[displayPos]) {
            // ボタン押し待ち
            case 'B':
              buttonWait = true;
            // クリア文字
            case 'C':
              displayString = '';
            // 終了文字
            case 'E':
              running = false;
            // その他
            default:
              displayString += gString[displayPos];
          }
          displayPos++;
        }
        tick = 0;
      }
      tick++;
    }
  }

  void render() {
    renderer
      ..setDrawColor(255, 255, 255, 255)
      ..clear();
    var drawX = 0;
    var drawY = 0;
    var height = 0;
    for (var n = 0; n < displayString.length; n++) {
      final chara = displayString[n];
      switch (chara) {
        // 改行文字
        case '@':
          if (drawX > 0) {
            drawX = 0;
            drawY += height;
            height = 0;
          }
        default:
          final texture = charaTextures[chara];
          if (texture != nullptr) {
            final size = texture!.getSize()!;
            if (chara != '。' &&
                chara != '、' &&
                (drawX + size.x) > window.getSize().x) {
              drawX = 0;
              drawY += height;
              height = 0;
            }
            renderer.texture(
              texture,
              dstrect: Rectangle<double>(
                drawX.toDouble(),
                drawY.toDouble(),
                size.x,
                size.y,
              ),
            );
            drawX += size.x.toInt();
            height = size.y.toInt() > height ? size.y.toInt() : height;
          }
      }
    }
    if (buttonWait) {
      final size = pressAnyKeyTexture.getSize()!;
      drawX = 0;
      drawY += height;
      renderer.texture(
        pressAnyKeyTexture,
        dstrect: Rectangle<double>(
          drawX.toDouble(),
          drawY.toDouble(),
          size.x,
          size.y,
        ),
      );
    }
    renderer.present();
  }

  void run() {
    running = true;
    while (running) {
      handleEvents();
      update();
      render();
    }
  }

  void close() {
    charaTextures.forEach((key, texture) {
      texture.destroy();
    });
    pressAnyKeyTexture.destroy();
    renderer.destroy();
    window.destroy();
    ttfQuit();
    sdlQuit();
  }
}

int main() {
  final game = Game();
  if (game.init()) {
    game.run();
  } else {
    print(sdlGetError());
  }
  game.close();
  return 0;
}
