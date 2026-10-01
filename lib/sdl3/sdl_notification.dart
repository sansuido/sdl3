import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'notification/lib_sdl_notification.dart';
part 'notification/sdl_notification_action.dart';
part 'notification/sdl_notification_action_button.dart';

part 'generated/lib_sdl_notification.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
