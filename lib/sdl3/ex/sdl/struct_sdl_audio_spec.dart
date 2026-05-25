part of '../../sdl.dart';

class SdlxAudioSpec {
  SdlxAudioSpec({
    this.format = 0,
    this.channels = 0,
    this.freq = 0,
    this.sampleFrames = 0,
  });

  int format;
  int channels;
  int freq;
  // for sdlGetAudioDeviceFormat
  int sampleFrames;

  void loadFromPointer(Pointer<SdlAudioSpec> pointer) {
    format = pointer.ref.format;
    channels = pointer.ref.channels;
    freq = pointer.ref.freq;
  }

  Pointer<SdlAudioSpec> calloc() {
    final pointer = ffi.calloc<SdlAudioSpec>();
    pointer.ref.format = format;
    pointer.ref.channels = channels;
    pointer.ref.freq = freq;
    return pointer;
  }
}
