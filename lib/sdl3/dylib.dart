import 'dart:ffi';
import 'dart:io';

class SdlDynamicLibraryService {
  factory SdlDynamicLibraryService() => _instance;

  SdlDynamicLibraryService._internal() {
    entries = {};
  }
  late Map<String, DynamicLibrary> entries;

  static final _instance = SdlDynamicLibraryService._internal();

  void add(String key, DynamicLibrary lib) {
    entries[key] = lib;
  }

  static DynamicLibrary _openByPlatform(String key) {
    var header = '';
    var extension = '';
    switch (Platform.operatingSystem) {
      case 'android':
      case 'linux':
      case 'fuchsia':
        header = 'lib';
        extension = '.so';
      case 'ios':
      case 'macos':
        header = 'lib';
        extension = '.dylib';
      case 'windows':
        header = '';
        extension = '.dll';
    }
    return DynamicLibrary.open(header + key + extension);
  }

  DynamicLibrary open(String key) {
    if (!entries.containsKey(key)) {
      entries[key] = _openByPlatform(key);
    }
    return entries[key]!;
  }
}

///// @nodoc
//DynamicLibrary dylibOpen(String mark) {
//  var header = '';
//  var extension = '';
//  switch (Platform.operatingSystem) {
//    case 'android':
//    case 'linux':
//    case 'fuchsia':
//      header = 'lib';
//      extension = '.so';
//      break;
//    case 'ios':
//    case 'macos':
//      header = 'lib';
//      extension = '.dylib';
//      break;
//    case 'windows':
//      header = '';
//      extension = '.dll';
//      break;
//  }
//  return DynamicLibrary.open(header + mark + extension);
//}
