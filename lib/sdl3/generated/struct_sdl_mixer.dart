// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl_mixer.dart';

// MIX_Mixer
/// {@category mixer}
final class MixMixer extends Opaque {}

// MIX_Audio
/// {@category mixer}
final class MixAudio extends Opaque {}

// MIX_Track
/// {@category mixer}
final class MixTrack extends Opaque {}

// MIX_Group
/// {@category mixer}
final class MixGroup extends Opaque {}

// MIX_StereoGains
/// {@category mixer}
final class MixStereoGains extends Struct {
  // [0]+(4)
  @Float()
  external double left;
  // [4]+(4)
  @Float()
  external double right;
}

// MIX_Point3D
/// {@category mixer}
final class MixPoint3D extends Struct {
  // [0]+(4)
  @Float()
  external double x;
  // [4]+(4)
  @Float()
  external double y;
  // [8]+(4)
  @Float()
  external double z;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// MIX_AudioDecoder
/// {@category mixer}
final class MixAudioDecoder extends Opaque {}
