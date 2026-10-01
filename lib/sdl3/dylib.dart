import 'dart:ffi';
import 'dart:io';

class SdlDynamicLibraryService {
  factory SdlDynamicLibraryService() => _instance;

  SdlDynamicLibraryService._internal() {
    _filenames['sdl'] = _getDefaultSdlFilename('SDL3');
    _filenames['image'] = _getDefaultSdlFilename('SDL3_image');
    _filenames['mixer'] = _getDefaultSdlFilename('SDL3_mixer');
    _filenames['net'] = _getDefaultSdlFilename('SDL3_net');
    _filenames['ttf'] = _getDefaultSdlFilename('SDL3_ttf');
    _filenames['shadercross'] = _getDefaultSdlFilename('SDL3_shadercross');
  }

  static final _instance = SdlDynamicLibraryService._internal();

  final Map<String, String> _filenames = {};

  final Map<String, DynamicLibrary> _loadedLibraries = {};

  void set(String key, String filename) {
    _filenames[key] = filename;
    _loadedLibraries.remove(key);
  }

  DynamicLibrary open(String key) {
    if (_loadedLibraries.containsKey(key)) {
      return _loadedLibraries[key]!;
    }

    final filename = _filenames[key];
    if (filename == null) {
      throw ArgumentError('Unknown library key: $key');
    }
    final lib = DynamicLibrary.open(filename);
    _loadedLibraries[key] = lib;

    return lib;
  }

  String _getDefaultSdlFilename(String key) {
    var header = '';
    var extension = '';
    switch (Platform.operatingSystem) {
      case 'android':
      case 'fuchsia':
        header = 'lib';
        extension = '.so';
      case 'linux':
        header = 'lib';
        extension = '.so.0';
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
}
