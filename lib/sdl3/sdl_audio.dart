import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_stdinc.dart';

part 'audio/lib_sdl_audio.dart';
part 'audio/sdl_audio_stream.dart';
part 'audio/sdl_audio_spec.dart';

part 'generated/lib_sdl_audio.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
