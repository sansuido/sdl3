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

    entries = {};
    entries['sdl'] = getDefaultSdlFilename('SDL3');
    entries['image'] = getDefaultSdlFilename('SDL3_image');
    entries['mixer'] = getDefaultSdlFilename('SDL3_mixer');
    entries['net'] = getDefaultSdlFilename('SDL3_net');
    entries['ttf'] = getDefaultSdlFilename('SDL3_ttf');
    entries['shadercross'] = getDefaultSdlFilename('SDL3_shadercross');
  }
  late Map<String, String> entries;

  static final _instance = SdlDynamicLibraryService._internal();

  void set(String key, String filename) {
    entries[key] = filename;
  }

  DynamicLibrary open(String key) => DynamicLibrary.open(entries[key]!);
}
