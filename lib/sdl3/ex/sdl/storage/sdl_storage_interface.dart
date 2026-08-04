part of '../../../sdl.dart';

class SdlxStorageInterface {
  SdlxStorageInterface({
    this.version = 0,
    Pointer<NativeFunction<SdlStorageInterfaceClose>>? close,
    Pointer<NativeFunction<SdlStorageInterfaceReady>>? ready,
    Pointer<NativeFunction<SdlStorageInterfaceEnumerate>>? enumerate,
    Pointer<NativeFunction<SdlStorageInterfaceInfo>>? info,
    Pointer<NativeFunction<SdlStorageInterfaceReadFile>>? readFile,
    Pointer<NativeFunction<SdlStorageInterfaceWriteFile>>? writeFile,
    Pointer<NativeFunction<SdlStorageInterfaceMkdir>>? mkdir,
    Pointer<NativeFunction<SdlStorageInterfaceRemove>>? remove,
    Pointer<NativeFunction<SdlStorageInterfaceRename>>? rename,
    Pointer<NativeFunction<SdlStorageInterfaceCopy>>? copy,
    Pointer<NativeFunction<SdlStorageInterfaceSpaceRemaining>>? spaceRemaining,
  }) {
    this.close = close ?? nullptr;
    this.ready = ready ?? nullptr;
    this.enumerate = enumerate ?? nullptr;
    this.info = info ?? nullptr;
    this.readFile = readFile ?? nullptr;
    this.writeFile = writeFile ?? nullptr;
    this.mkdir = mkdir ?? nullptr;
    this.remove = remove ?? nullptr;
    this.rename = rename ?? nullptr;
    this.copy = copy ?? nullptr;
    this.spaceRemaining = spaceRemaining ?? nullptr;
  }

  int version;
  late Pointer<NativeFunction<SdlStorageInterfaceClose>> close;
  late Pointer<NativeFunction<SdlStorageInterfaceReady>> ready;
  late Pointer<NativeFunction<SdlStorageInterfaceEnumerate>> enumerate;
  late Pointer<NativeFunction<SdlStorageInterfaceInfo>> info;
  late Pointer<NativeFunction<SdlStorageInterfaceReadFile>> readFile;
  late Pointer<NativeFunction<SdlStorageInterfaceWriteFile>> writeFile;
  late Pointer<NativeFunction<SdlStorageInterfaceMkdir>> mkdir;
  late Pointer<NativeFunction<SdlStorageInterfaceRemove>> remove;
  late Pointer<NativeFunction<SdlStorageInterfaceRename>> rename;
  late Pointer<NativeFunction<SdlStorageInterfaceCopy>> copy;
  late Pointer<NativeFunction<SdlStorageInterfaceSpaceRemaining>>
  spaceRemaining;

  Pointer<SdlStorageInterface> calloc() {
    final pointer = ffi.calloc<SdlStorageInterface>();
    pointer.ref.version = version;
    pointer.ref.close = close;
    pointer.ref.ready = ready;
    pointer.ref.enumerate = enumerate;
    pointer.ref.info = info;
    pointer.ref.readFile = readFile;
    pointer.ref.writeFile = writeFile;
    pointer.ref.mkdir = mkdir;
    pointer.ref.remove = remove;
    pointer.ref.rename = rename;
    pointer.ref.copy = copy;
    pointer.ref.spaceRemaining = spaceRemaining;
    return pointer;
  }

  void loadFromPointer(Pointer<SdlStorageInterface> pointer) {
    version = pointer.ref.version;
    close = pointer.ref.close;
    ready = pointer.ref.ready;
    enumerate = pointer.ref.enumerate;
    info = pointer.ref.info;
    readFile = pointer.ref.readFile;
    writeFile = pointer.ref.writeFile;
    mkdir = pointer.ref.mkdir;
    remove = pointer.ref.remove;
    rename = pointer.ref.rename;
    copy = pointer.ref.copy;
    spaceRemaining = pointer.ref.spaceRemaining;
  }
}
