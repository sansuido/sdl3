import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'tray/lib_sdl_tray.dart';
part 'tray/sdl_tray.dart';
part 'tray/sdl_tray_entry.dart';
part 'tray/sdl_tray_menu.dart';

part 'generated/lib_sdl_tray.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
