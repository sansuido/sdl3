// https://github.com/aminosbh/sdl2-audio-sample/blob/master/src/main.c
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
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

const gScreenWidth = 800;
const gScreenHeight = 600;
const gWavesSound =
    'assets/waves-at-baltic-sea-shore/waves-at-baltic-sea-shore.wav';

class WavExample {
  Pointer<SdlAudioStream> stream = nullptr;

  int get device => sdlGetAudioStreamDevice(stream);

  bool load(String filename) {
    int stat = 0;
    var rwops = sdlIoFromFile(filename, 'rb');
    if (rwops != nullptr) {
      var wavSpec = calloc<SdlAudioSpec>();
      var wavLength = calloc<Uint32>();
      var wavBuffer = calloc<Pointer<Uint8>>();
      stat = sdlLoadWavIo(rwops, true, wavSpec, wavBuffer, wavLength);
      if (stat == 0) {
        stream = sdlOpenAudioDeviceStream(
            SDL_AUDIO_DEVICE_DEFAULT_OUTPUT, wavSpec, nullptr, nullptr);
        if (stream != nullptr) {
          stat =
              sdlPutAudioStreamData(stream, wavBuffer.value, wavLength.value);
        } else {
          stat = -1;
        }
        sdlFree(wavBuffer.value);
      }
      wavBuffer.callocFree();
      wavLength.callocFree();
      wavSpec.callocFree();
    } else {
      stat = -1;
    }
    return stat == 0;
  }

  bool paused() {
    return sdlAudioDevicePaused(device);
  }

  int resume() {
    return sdlResumeAudioDevice(device);
  }

  int pause() {
    return sdlPauseAudioDevice(device);
  }

  void destroy() {
    if (paused() == false) {
      pause();
    }
    sdlCloseAudioDevice(device);
    if (stream != nullptr) {
      sdlDestroyAudioStream(stream);
    }
  }
}

int main() {
  // Initialize SDL
  if (sdlInit(SDL_INIT_VIDEO | SDL_INIT_AUDIO) < 0) {
    print('SDL could not be initialized!\n'
        'SDL_Error: ${sdlGetError()}%s\n');
    return 0;
  }
  // Create window
  var window = SdlWindowEx.create(
      title: 'SDL2 audio sample (Press SPACE to pause/play)',
      w: gScreenWidth,
      h: gScreenHeight);
  if (window == nullptr) {
    print('Window could not be created!\n'
        'SDL_Error: ${sdlGetError()}\n');
    sdlQuit();
    return 0;
  }
  // Create renderer
  var renderer = window.createRenderer(SDL_RENDERER_PRESENTVSYNC);
  if (renderer == nullptr) {
    print('Renderer could not be created!\n'
        'SDL_Error: ${sdlGetError()}\n');
    window.destroy();
    sdlQuit();
    return 0;
  }
  // Load .WAV sound
  var wav = WavExample();
  if (wav.load(gWavesSound) == false) {
    print('.WAV sound \'$gWavesSound\' could not be loaded!\n'
        'SDL_Error: ${sdlGetError()}\n');
  } else {
    wav.resume();
    var bar = math.min(gScreenWidth, gScreenHeight) / 2;
    var squareRect = math.Rectangle<double>(
        gScreenWidth / 2 - bar / 2, gScreenHeight / 2 - bar / 2, bar, bar);
    var pauseRect1 = math.Rectangle<double>(
        squareRect.left + (squareRect.width - 40 * 3) / 2,
        squareRect.top + squareRect.height / 4,
        40,
        squareRect.height / 2);
    var pauseRect2 = pauseRect1.shift(math.Point(40 * 2, 0));
    var event = calloc<SdlEvent>();
    var running = true;
    while (running) {
      while (event.poll()) {
        switch (event.type) {
          case SDL_EVENT_QUIT:
            running = false;
            break;
          case SDL_EVENT_KEY_DOWN:
            if (event.key.keysym.ref.sym == SDLK_ESCAPE) {
              running = false;
            } else if (event.key.keysym.ref.sym == SDLK_SPACE) {
              if (wav.paused()) {
                wav.resume();
              } else {
                wav.pause();
              }
            }
            break;
          default:
            break;
        }
      }
      renderer
        ..setDrawColor(0xff, 0xff, 0xff, SDL_ALPHA_OPAQUE)
        ..clear()
        ..setDrawColor(0x19, 0x71, 0xa9, SDL_ALPHA_OPAQUE)
        ..fillRect(squareRect);
      if (wav.paused()) {
        renderer
          ..setDrawColor(0xff, 0xff, 0xff, SDL_ALPHA_OPAQUE)
          ..fillRect(pauseRect1)
          ..fillRect(pauseRect2);
      }
      renderer.present();
    }
    event.callocFree();
    wav.destroy();
  }
  // Destroy renderer
  renderer.destroy();
  // Destroy window
  window.destroy();
  // Quit SDL
  sdlQuit();
  return 0;
}
