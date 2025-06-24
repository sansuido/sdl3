import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'ex/mixer/mix_chunk.dart';
part 'ex/mixer/mix_music.dart';
part 'generated/const_sdl_mixer.dart';
part 'generated/lib_sdl_mixer.dart';
part 'generated/struct_sdl_mixer.dart';
part 'ex/lib_sdl_mixer_ex.dart';

final DynamicLibrary _libMixer = dylib.SdlDynamicLibraryService().open('mixer');
