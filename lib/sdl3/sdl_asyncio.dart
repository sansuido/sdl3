import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'asyncio/lib_sdl_asyncio.dart';
part 'asyncio/sdl_async_io.dart';
part 'asyncio/sdl_async_io_queue.dart';
part 'asyncio/sdl_async_io_outcome.dart';

part 'generated/lib_sdl_asyncio.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
