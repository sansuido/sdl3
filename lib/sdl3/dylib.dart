import 'dart:ffi';
import 'dart:io';

class SdlDynamicLibraryService {
  factory SdlDynamicLibraryService() => _instance;

  SdlDynamicLibraryService._internal() {
    String getDefaultSdlFilename(String key) {
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
      return header + key + extension;
    }

    //    String getDefaultOpenglFilename() {
    //      var filename = '';
    //      switch (Platform.operatingSystem) {
    //        case 'android':
    //        case 'linux':
    //        case 'fuchsia':
    //          filename = 'libGL.so';
    //        case 'ios':
    //        case 'macos':
    //          filename = 'libGL.dylib';
    //        case 'windows':
    //          filename = 'opengl32.dll';
    //      }
    //      return filename;
    //    }

    entries = {};
    entries['sdl'] = getDefaultSdlFilename('SDL3');
    entries['image'] = getDefaultSdlFilename('SDL3_image');
    entries['mixer'] = getDefaultSdlFilename('SDL3_mixer');
    entries['net'] = getDefaultSdlFilename('SDL3_net');
    entries['ttf'] = getDefaultSdlFilename('SDL3_ttf');
    //    entries['opengl'] = getDefaultOpenglFilename();
  }
  late Map<String, String> entries;

  static final _instance = SdlDynamicLibraryService._internal();

  void set(String key, String filename) {
    entries[key] = filename;
  }

  DynamicLibrary open(String key) => DynamicLibrary.open(entries[key]!);
}
