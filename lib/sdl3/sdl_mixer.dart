// ignore_for_file: constant_identifier_names

import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_audio.dart';
import 'sdl_dart.dart';
import 'sdl_error.dart';
import 'sdl_stdinc.dart';

part 'generated/const_sdl_mixer.dart';
part 'generated/lib_sdl_mixer.dart';
part 'generated/struct_sdl_mixer.dart';
part 'mixer/mix_audio_decoder.dart';
part 'mixer/mix_audio.dart';
part 'mixer/mix_group.dart';
part 'mixer/mix_mixer.dart';
part 'mixer/mix_track.dart';
part 'mixer/mix_point_3d.dart';
part 'mixer/mix_stereo_gains.dart';
part 'mixer/lib_sdl_mixer.dart';
part 'mixer/lib_sdl_mixer_ex.dart';

const SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK = 0xFFFFFFFF;

final DynamicLibrary _libMixer = dylib.SdlDynamicLibraryService().open('mixer');
