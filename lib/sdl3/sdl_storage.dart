import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_filesystem.dart';
import 'sdl_stdinc.dart';

part 'storage/lib_sdl_storage.dart';
part 'storage/sdl_storage.dart';
part 'storage/sdl_storage_interface.dart';

part 'generated/lib_sdl_storage.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
