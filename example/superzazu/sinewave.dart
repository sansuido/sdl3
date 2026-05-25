// https://gist.github.com/superzazu/c0f923181a9cdb82c6d84dcf8b61c8c5
import 'dart:ffi';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:sdl3/sdl3.dart';

void sinewave() {
  final audioSpec = SdlxAudioSpec()
    ..freq = 44100
    ..format = SDL_AUDIO_S16LE
    ..channels = 1;
  final stream = sdlxOpenAudioDeviceStream(
    SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK,
    audioSpec,
    nullptr,
    nullptr,
  );
  if (stream == nullptr) {
    print(sdlGetError());
    return;
  }
  final bufferSize = audioSpec.freq * 3;
  final buffer = Int16List(bufferSize);
  const targetFreq = 440.0;
  for (var i = 0; i < bufferSize; i++) {
    final t = i / audioSpec.freq;
    buffer[i] = (math.sin(2 * math.pi * targetFreq * t) * 5000).toInt();
  }
  sdlxPutAudioStreamData(stream, buffer);
  sdlResumeAudioStreamDevice(stream);
  sdlDelay(3000);
  sdlDestroyAudioStream(stream);
}

int main() {
  if (!sdlInit(SdlkInit.audio)) {
    print(sdlGetError());
    return -1;
  }
  sinewave();
  sdlQuit();
  return 0;
}
