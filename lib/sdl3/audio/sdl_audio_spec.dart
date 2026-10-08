part of '../sdl_audio.dart';

class SdlxAudioSpec {
  const SdlxAudioSpec({this.format = 0, this.channels = 0, this.freq = 0});

  factory SdlxAudioSpec.fromPointer(Pointer<SdlAudioSpec> pointer) =>
      SdlxAudioSpec(
        format: pointer.ref.format,
        channels: pointer.ref.channels,
        freq: pointer.ref.freq,
      );

  final int format;
  final int channels;
  final int freq;

  Pointer<SdlAudioSpec> calloc() {
    final pointer = ffi.calloc<SdlAudioSpec>();
    pointer.ref.format = format;
    pointer.ref.channels = channels;
    pointer.ref.freq = freq;
    return pointer;
  }
}
