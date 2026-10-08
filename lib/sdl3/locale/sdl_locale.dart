part of '../sdl_locale.dart';

class SdlxLocale {
  const SdlxLocale({this.language = '', this.country = ''});

  factory SdlxLocale.fromPointer(Pointer<SdlLocale> pointer) {
    final ref = pointer.ref;

    final language = ref.language != nullptr ? ref.language.toDartString() : '';

    final country = ref.country != nullptr ? ref.country.toDartString() : '';

    return SdlxLocale(language: language, country: country);
  }

  final String language;
  final String country;
}
