import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'sdl_stdinc.dart';

part 'sdl/lib_sdl_ex.dart';

part 'generated/const_sdl.dart';
part 'generated/lib_sdl.dart';
part 'generated/struct_sdl.dart';

// lib_sdl_opengl.dart
final class ClContext extends Opaque {}

final class ClEvent extends Opaque {}

// lib_sdl_metal.dart
typedef SdlMetalView = Pointer<Void>;

// lib_sdl_openxr.dart
typedef PfnXrGetInstanceProcAddr = Pointer<NativeFunction<SdlFunctionPointer>>;

// lib_sdl_thread.dart
typedef SdlTlsDeorCallback = Pointer<NativeFunction<SdlFunctionPointer>>;

// lib_sdl_video.dart
typedef SdlEglSurface = Pointer<Void>;

// lib_sdl_vulkan.dart
final class VkInstanceT extends Opaque {}

final class VkPhysicalDeviceT extends Opaque {}

final class VkSurfaceKHRT extends Opaque {}

final class VkAllocationCallbacks extends Opaque {}

typedef VkInstance = Pointer<VkInstanceT>;
typedef VkSurfaceKHR = Pointer<VkSurfaceKHRT>;
typedef VkPhysicalDevice = Pointer<VkPhysicalDeviceT>;
