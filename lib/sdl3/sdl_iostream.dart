import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_stdinc.dart';

part 'iostream/lib_sdl_iostream.dart';
part 'iostream/sdl_iostream.dart';
part 'iostream/sdl_iostream_interface.dart';

part 'generated/lib_sdl_iostream.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
