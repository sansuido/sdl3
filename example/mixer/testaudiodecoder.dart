// https://github.com/libsdl-org/SDL_mixer/blob/main/test/testaudiodecoder.c
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

const gSound = 'assets/claps-and-snares/clap.ogg';

Pointer<MixAudioDecoder> gAudioDecoder = nullptr;
Pointer<SdlAudioStream> gAudioStream = nullptr;
Pointer<SdlAudioSpec> gAudioSpec = nullptr;
NativeCallable<SdlAudioStreamCallback>? gAudioStreamCall;
var gDone = false;

void audioStreamCallback(
  Pointer<NativeType> userdata,
  Pointer<SdlAudioStream> stream,
  int additionalAmount,
  int totalAmount,
) {
  var additionalAmount0 = additionalAmount;
  final audioDecoder = userdata.cast<MixAudioDecoder>();
  if (additionalAmount0 == 0) {
    return;
  }
  final buffer = calloc<Uint8>(1024);
  while (additionalAmount0 > 0) {
    final needed = math.min(additionalAmount0, 1024);
    final br = mixDecodeAudio(audioDecoder, buffer, needed, gAudioSpec);
    if (br <= 0) {
      gDone = true;
      break;
    }
    sdlPutAudioStreamData(stream, buffer, br);
    additionalAmount0 -= br;
  }
  buffer.callocFree();
}

bool appInit() {
  if (!sdlInit(SdlkInit.audio)) {
    print("Couldn't initialize SDL: ${sdlGetError()}");
    return false;
  }
  if (!mixInit()) {
    print("Couldn't initialize SDL_mixer: ${sdlGetError()}");
    return false;
  }
  gAudioDecoder = mixCreateAudioDecoder(gSound, 0);
  if (gAudioDecoder == nullptr) {
    print("Failed to create audiodecoder for '$gSound': ${sdlGetError()}");
    return false;
  }
  gAudioStreamCall = NativeCallable<SdlAudioStreamCallback>.listener(
    audioStreamCallback,
  );
  gAudioStream = sdlOpenAudioDeviceStream(
    SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK,
    nullptr,
    gAudioStreamCall!.nativeFunction,
    gAudioDecoder,
  );
  if (gAudioStream == nullptr) {
    print('Failed to open audio device: ${sdlGetError()}');
    return false;
  }
  gAudioSpec = calloc<SdlAudioSpec>();
  sdlGetAudioStreamFormat(gAudioStream, gAudioSpec, nullptr);
  sdlResumeAudioStreamDevice(gAudioStream);
  return true;
}

void appQuit() {
  gAudioSpec.callocFree();
  if (gAudioStreamCall != null) {
    gAudioStreamCall!.close();
  }
  gAudioStream.destroy();
  gAudioDecoder.destroy();
  mixQuit();
  sdlQuit();
}

bool appEvent(Pointer<SdlEvent> event) {
  if (event.type == SdlkEvent.quit) {
    return true;
  }
  return false;
}

bool appIterate() => gDone;

void main() async {
  if (appInit()) {
    var quit = false;
    final event = calloc<SdlEvent>();
    while (!quit) {
      while (event.poll()) {
        quit = appEvent(event);
        if (quit) {
          break;
        }
      }
      if (!quit) {
        quit = appIterate();
      }
      // Note that when using sdlDelay, you cannot delegate processing to a callback.
      await Future.delayed(const Duration(milliseconds: 16));
    }
    event.callocFree();
  }
  appQuit();
}
