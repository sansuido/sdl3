import 'dart:ffi';
import 'package:sdl3/sdl3.dart';
import 'package:sdl3/sdl3gfx.dart' as gfx;

bool isPointInRect(SdlxFPoint p, SdlxFRect r) =>
    (p.x >= r.x) && (p.x < (r.x + r.w)) && (p.y >= r.y) && (p.y < (r.y + r.h));

Future<int> main() async {
  if (!sdlInit(SdlkInit.video)) {
    return -1;
  }
  if (!ttfInit()) {
    return -1;
  }
  final window = SdlWindowEx.create(
    title: 'SDL3 RENDERER Text Engine',
    w: 640,
    h: 480,
  );
  if (window == nullptr) {
    print(sdlGetError());
    ttfQuit();
    sdlQuit();
    return -1;
  }
  final renderer = window.createRenderer();
  if (renderer == nullptr) {
    print(sdlGetError());
    window.destroy();
    ttfQuit();
    sdlQuit();
    return -1;
  }
  final font = ttfOpenFont('assets/SourceHanCodeJP.ttc', 36);
  if (font == nullptr) {
    print(sdlGetError());
    renderer.destroy();
    window.destroy();
    ttfQuit();
    sdlQuit();
    return -1;
  }
  final engine = ttfCreateRendererTextEngine(renderer);
  if (engine == nullptr) {
    print(sdlGetError());
    font.close();
    renderer.destroy();
    window.destroy();
    ttfQuit();
    sdlQuit();
    return -1;
  }
  const message = 'こんにちは\nTTF_TextEngine!';
  final text = engine.createText(font, message);
  if (text == nullptr) {
    print(sdlGetError());
    font.close();
    renderer.destroy();
    window.destroy();
    ttfQuit();
    sdlQuit();
    return -1;
  }
  SdlxFPoint? holdStartPosition;
  var textColor = SdlxColor(255, 255, 255);
  text.setColor(textColor);
  TtfxSubString? hoverSubString;
  final subStringRanges = text.getSubStringsForRange(0, -1);
  final subStrings = <TtfxSubString>[];
  {
    var subString = text.getSubString(0);
    while (subString != null) {
      if ((subString.flags & TTF_SUBSTRING_TEXT_END) != 0) {
        break;
      }
      subStrings.add(subString);
      subString = text.getNextSubString(subString);
    }
  }
  var renderOffset = SdlxFPoint(100, 200);
  var running = true;
  final fps = gfx.FpsManager();
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        switch (event.scancode) {
          case SdlkScancode.escape:
            running = false;
          case SdlkScancode.w:
            textColor = SdlxColor(255, 255, 255);
          case SdlkScancode.r:
            textColor = SdlxColor(255, 0, 0);
          case SdlkScancode.g:
            textColor = SdlxColor(0, 255, 0);
          case SdlkScancode.b:
            textColor = SdlxColor(0, 0, 255);
        }
        text.setColor(textColor);
      } else if (event is SdlxMouseMotionEvent) {
        final position = (SdlxFPoint(event.x, event.y) - renderOffset).toInt();
        hoverSubString = text.getSubStringForPoint(position.x, position.y);
        if (holdStartPosition != null) {
          renderOffset += SdlxFPoint(event.xrel, event.yrel);
        }
      } else if (event is SdlxMouseButtonEvent) {
        if (event.type == SdlkEvent.mouseButtonDown) {
          for (final subStringRange in subStringRanges) {
            if (isPointInRect(
              SdlxFPoint(event.x, event.y),
              subStringRange.rect.toFloat()..moveBy(renderOffset),
            )) {
              holdStartPosition = SdlxFPoint(event.x, event.y);
            }
          }
        } else if (holdStartPosition != null) {
          holdStartPosition = null;
        }
      }
    }
    renderer
      ..setDrawColor(SdlxColor(20, 30, 50))
      ..clear();
    for (final subString in subStrings) {
      renderer.boxColor(
        subString.rect.toFloat()..moveBy(renderOffset),
        SdlxColor(0, 0, 0),
      );
    }
    if (hoverSubString != null) {
      renderer.boxColor(
        hoverSubString.rect.toFloat()..moveBy(renderOffset),
        SdlxColor(64, 64, 64),
      );
    }
    for (final subStringRange in subStringRanges) {
      renderer.rectangleColor(
        subStringRange.rect.toFloat()..moveBy(renderOffset),
        SdlxColor(255, 0, 0),
      );
    }
    text.drawRenderer(renderOffset.x, renderOffset.y);
    renderer.present();
    await fps.delay();
  }
  text.destroy();
  engine.destroyRenderer();
  font.close();
  renderer.destroy();
  window.destroy();
  ttfQuit();
  sdlQuit();
  return 0;
}
