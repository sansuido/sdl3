part of '../../../sdl.dart';

class SdlxLocale {
  SdlxLocale({this.language = '', this.country = ''});

  String language;
  String country;

  void loadFromPointer(Pointer<SdlLocale> pointer) {
    if (pointer.ref.language != nullptr) {
      language = pointer.ref.language.toDartString();
    }
    if (pointer.ref.country != nullptr) {
      country = pointer.ref.country.toDartString();
    }
  }
}
