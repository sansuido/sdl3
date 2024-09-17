// https://gist.github.com/superzazu/c0f923181a9cdb82c6d84dcf8b61c8c5
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

void sinewave() {
  var audioSpec = calloc<SdlAudioSpec>()
    ..ref.freq = 44100
    ..ref.format = AUDIO_S16
    ..ref.channels = 1;
  var stream = sdlOpenAudioDeviceStream(
      SDL_AUDIO_DEVICE_DEFAULT_OUTPUT, audioSpec, nullptr, nullptr);
  var audioDevice = sdlGetAudioStreamDevice(stream);
  sdlResumeAudioDevice(audioDevice);
  var x = 0.0;
  var sample = calloc<Int16>();
  for (var i = 0; i < audioSpec.ref.freq * 3; i++) {
    x += 0.10;
    sample.value = (math.sin(x * 4) * 5000).toInt();
    // SDL_QueueAudio expects a signed 16-bit value
    // note: "5000" here is just gain so that we will hear something
    sdlPutAudioStreamData(stream, sample, sizeOf<Int16>());
  }
  sample.callocFree();
  sdlPauseAudioDevice(audioDevice);
  sdlDelay(3000);
  sdlCloseAudioDevice(audioDevice);
  audioSpec.callocFree();
}

int main() {
  if (sdlInit(SDL_INIT_AUDIO) == false) {
    return -1;
  }
  sinewave();
  sdlQuit();
  return 0;
}
