part of '../sdl_storage.dart';

class SdlxStorageInterface {
  SdlxStorageInterface({
    int? version,
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
  }) : version = version ?? sizeOf<SdlStorageInterface>(),
       close = close ?? nullptr,
       ready = ready ?? nullptr,
       enumerate = enumerate ?? nullptr,
       info = info ?? nullptr,
       readFile = readFile ?? nullptr,
       writeFile = writeFile ?? nullptr,
       mkdir = mkdir ?? nullptr,
       remove = remove ?? nullptr,
       rename = rename ?? nullptr,
       copy = copy ?? nullptr,
       spaceRemaining = spaceRemaining ?? nullptr;

  factory SdlxStorageInterface.fromPointer(
    Pointer<SdlStorageInterface> pointer,
  ) {
    final ref = pointer.ref;
    return SdlxStorageInterface(
      version: ref.version,
      close: ref.close,
      ready: ref.ready,
      enumerate: ref.enumerate,
      info: ref.info,
      readFile: ref.readFile,
      writeFile: ref.writeFile,
      mkdir: ref.mkdir,
      remove: ref.remove,
      rename: ref.rename,
      copy: ref.copy,
      spaceRemaining: ref.spaceRemaining,
    );
  }

  final int version;
  final Pointer<NativeFunction<SdlStorageInterfaceClose>> close;
  final Pointer<NativeFunction<SdlStorageInterfaceReady>> ready;
  final Pointer<NativeFunction<SdlStorageInterfaceEnumerate>> enumerate;
  final Pointer<NativeFunction<SdlStorageInterfaceInfo>> info;
  final Pointer<NativeFunction<SdlStorageInterfaceReadFile>> readFile;
  final Pointer<NativeFunction<SdlStorageInterfaceWriteFile>> writeFile;
  final Pointer<NativeFunction<SdlStorageInterfaceMkdir>> mkdir;
  final Pointer<NativeFunction<SdlStorageInterfaceRemove>> remove;
  final Pointer<NativeFunction<SdlStorageInterfaceRename>> rename;
  final Pointer<NativeFunction<SdlStorageInterfaceCopy>> copy;
  final Pointer<NativeFunction<SdlStorageInterfaceSpaceRemaining>>
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
}
