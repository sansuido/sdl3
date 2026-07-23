// https://github.com/aminosbh/sdl2-ttf-sample/blob/master/src/main.c
/*
 * Copyright (c) 2018, 2019 Amine Ben Hassouna <amine.benhassouna@gmail.com>
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any
 * person obtaining a copy of this software and associated
 * documentation files (the "Software"), to deal in the
 * Software without restriction, including without
 * limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software
 * is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice
 * shall be included in all copies or substantial portions
 * of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
 * ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 * TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
 * SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
 * IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 */
import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

// Define screen dimensions
const gScreenWidth = 800;
const gScreenHeight = 600;

const gFontPath = 'assets/SourceHanCodeJP.ttc';
//const gFontPath = 'C:/Windows/Fonts/msgothic.ttc';

int main() {
  // Initialize SDL3
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(
      'SDL3 could not be initialized!\n'
      'SDL3 s: ${sdlGetError()}\n',
    );
    return 0;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  // Initialize SDL3_ttf
  ttfInit();
  // Create window
  final window = SdlWindowEx.create(
    title: 'SDL3_ttf sample',
    w: gScreenWidth,
    h: gScreenHeight,
  );
  if (window == nullptr) {
    print(
      'Window could not be created!\n'
      'SDL_Error: ${sdlGetError()}\n',
    );
  } else {
    // Create renderer
    final renderer = window.createRenderer();
    if (renderer == nullptr) {
      print(
        'Renderer could not be created!\n'
        'SDL_Error: ${sdlGetError()}\n',
      );
    } else {
      // Declare rect of square
      // Square dimensions: Half of the min(gScreenWidth, gScreenHeight)
      // Square position: In the middle of the screen
      final squareRect = SdlxFRect(
        x: gScreenWidth / 2 - gScreenHeight / 2 / 2,
        y: gScreenHeight / 2 - gScreenHeight / 2 / 2,
        w: gScreenHeight / 2,
        h: gScreenHeight / 2,
      );
      Pointer<TtfFont> font = nullptr;
      font = TtfFontEx.open(gFontPath, 40);
      //var font = ttfOpenFont(gFontPath, 40);
      if (font == nullptr) {
        print(
          "Unable to load font: '$gFontPath'!\n"
          'SDL3_ttf Error: ${ttfGetError()}\n',
        );
        return 0;
      }
      final textColor = SdlxColor(0, 0, 0);
      final backgroundColor = SdlxColor(255, 255, 255);
      Pointer<SdlTexture> text = nullptr;
      late SdlxFRect textRect;
      final textSurface = font.renderTextShaded(
        '赤い四角/Red square',
        textColor,
        backgroundColor,
      );
      font.close();
      if (textSurface == nullptr) {
        print(
          'Unable to render text surface!\n'
          'SDL3_ttf Error: ${ttfGetError()}\n',
        );
      } else {
        // Create texture from surface pixels
        text = renderer.createTextureFromSurface(textSurface);
        if (text == nullptr) {
          print(
            'Unable to create texture from rendered text!\n'
            'SDL3 Error: ${sdlGetError()}\n',
          );
          return 0;
        }
        // Get text dimensions
        textRect = SdlxFRect(
          x: (gScreenWidth - textSurface.ref.w) / 2,
          y: squareRect.y - textSurface.ref.h - 10,
          w: textSurface.ref.w.toDouble(),
          h: textSurface.ref.h.toDouble(),
        );
        textSurface.destroy();
      }
      // Event loop exit flag
      var running = true;
      // Event loop
      while (running) {
        SdlxEvent? event;
        if ((event = sdlxWaitEvent()) != null) {
          if (event is SdlxQuitEvent) {
            running = false;
          }
          if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
            if (event.scancode == SdlkScancode.escape) {
              running = false;
            }
          }
        }
        // Initialize renderer color white for the background
        renderer
          ..setDrawColor(SdlxColor(0xff, 0xff, 0xff))
          // Clear screen
          ..clear()
          // Set renderer color red to draw the square
          ..setDrawColor(SdlxColor(0xff, 0, 0))
          // Draw filled square
          ..fillRect(squareRect)
          // Draw text
          ..texture(text, dstrect: textRect)
          // Update screen
          ..present();
      }
      // Destroy renderer
      renderer.destroy();
    }
    // Destroy window
    window.destroy();
  }
  // Quit SDL3_ttf
  ttfQuit();
  // Quit SDL
  sdlQuit();
  return 0;
}
