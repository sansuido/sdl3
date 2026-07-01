part of '../../../sdl.dart';

class SdlxDialogFileFilter {
  SdlxDialogFileFilter({String? name, String? pattern}) {
    this.name = name ?? '';
    this.pattern = pattern ?? '';
  }
  late String name;
  late String pattern;

  Pointer<SdlDialogFileFilter> calloc() {
    final pointer = ffi.calloc<SdlDialogFileFilter>();
    if (name.isNotEmpty) {
      pointer.ref.name = name.toNativeUtf8();
    }
    if (pattern.isNotEmpty) {
      pointer.ref.pattern = pattern.toNativeUtf8();
    }
    return pointer;
  }
}

extension SdlxDialogFileFilterListExtension on List<SdlxDialogFileFilter> {
  Pointer<SdlDialogFileFilter> calloc() {
    final filtersPointer = ffi.calloc<SdlDialogFileFilter>(length);
    for (var n = 0; n < length; n++) {
      final filterPointer = filtersPointer + n;
      if (this[n].name.isNotEmpty) {
        filterPointer.ref.name = this[n].name.toNativeUtf8();
      }
      if (this[n].pattern.isNotEmpty) {
        filterPointer.ref.pattern = this[n].pattern.toNativeUtf8();
      }
    }
    return filtersPointer;
  }
}

extension SdlDialogFileFilterCallocAllFreeExtension
    on Pointer<SdlDialogFileFilter> {
  void callocAllFree([int length = 1]) {
    for (var n = 0; n < length; n++) {
      final ref = (this + n).ref;
      if (ref.name != nullptr) {
        ref.name.callocFree();
      }
      if (ref.pattern != nullptr) {
        ref.pattern.callocFree();
      }
    }
    callocFree();
  }
}
