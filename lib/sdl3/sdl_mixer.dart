// ignore_for_file: constant_identifier_names

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'ex/mixer/mix_audio_decoder.dart';
part 'ex/mixer/mix_audio.dart';
part 'ex/mixer/mix_group.dart';
part 'ex/mixer/mix_mixer.dart';
part 'ex/mixer/mix_track.dart';
part 'generated/const_sdl_mixer.dart';
part 'generated/lib_sdl_mixer.dart';
part 'generated/struct_sdl_mixer.dart';
part 'ex/lib_sdl_mixer_ex.dart';

const SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK = 0xFFFFFFFF;

final DynamicLibrary _libMixer = dylib.SdlDynamicLibraryService().open('mixer');
