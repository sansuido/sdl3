// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../dylib.dart' as dylib;
import 'struct_sdl.dart';

final libSdl3 = dylib.dylibOpen('SDL3');

// typedef SDL_AssertState (SDLCALL *SDL_AssertionHandler)( const SDL_AssertData* data, void* userdata)
typedef SdlAssertionHandlerDart = int Function(
    Pointer<SdlAssertData>, Pointer<NativeType>);
typedef SdlAssertionHandler = Int32 Function(
    Pointer<SdlAssertData>, Pointer<NativeType>);

// typedef void (*SDL_KernelMemoryBarrierFunc)()
typedef SdlKernelMemoryBarrierFuncDart = void Function();
typedef SdlKernelMemoryBarrierFunc = Void Function();

// typedef void (SDLCALL *SDL_AudioStreamCallback)(void *userdata, SDL_AudioStream *stream, int additional_amount, int total_amount)
typedef SdlAudioStreamCallbackDart = void Function(
    Pointer<NativeType>, Pointer<SdlAudioStream>, int, int);
typedef SdlAudioStreamCallback = Void Function(
    Pointer<NativeType>, Pointer<SdlAudioStream>, Int32, Int32);

// typedef void (SDLCALL *SDL_AudioPostmixCallback)(void *userdata, const SDL_AudioSpec *spec, float *buffer, int buflen)
typedef SdlAudioPostmixCallbackDart = void Function(
    Pointer<NativeType>, Pointer<SdlAudioSpec>, Pointer<Float>, int);
typedef SdlAudioPostmixCallback = Void Function(
    Pointer<NativeType>, Pointer<SdlAudioSpec>, Pointer<Float>, Int32);

// typedef const void *(SDLCALL *SDL_ClipboardDataCallback)(void *userdata, const char *mime_type, size_t *size)
typedef SdlClipboardDataCallbackDart = Pointer<NativeType> Function(
    Pointer<NativeType>, Pointer<Utf8>, Pointer<Uint32>);
typedef SdlClipboardDataCallback = Pointer<NativeType> Function(
    Pointer<NativeType>, Pointer<Utf8>, Pointer<Uint32>);

// typedef void (SDLCALL *SDL_ClipboardCleanupCallback)(void *userdata)
typedef SdlClipboardCleanupCallbackDart = void Function(Pointer<NativeType>);
typedef SdlClipboardCleanupCallback = Void Function(Pointer<NativeType>);

// typedef int (SDLCALL *SDL_EventFilter)(void *userdata, SDL_Event *event)
typedef SdlEventFilterDart = int Function(
    Pointer<NativeType>, Pointer<SdlEvent>);
typedef SdlEventFilter = Int32 Function(Pointer<NativeType>, Pointer<SdlEvent>);

// typedef void (SDLCALL *SDL_HintCallback)(void *userdata, const char *name, const char *oldValue, const char *newValue)
typedef SdlHintCallbackDart = void Function(
    Pointer<NativeType>, Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>);
typedef SdlHintCallback = Void Function(
    Pointer<NativeType>, Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>);

// typedef void (SDLCALL *SDL_LogOutputFunction)(void *userdata, int category, SDL_LogPriority priority, const char *message)
typedef SdlLogOutputFunctionDart = void Function(
    Pointer<NativeType>, int, int, Pointer<Utf8>);
typedef SdlLogOutputFunction = Void Function(
    Pointer<NativeType>, Int32, Int32, Pointer<Utf8>);

// typedef int (SDLCALL *SDL_AppInit_func)(int argc, char *argv[])
typedef SdlAppInitFuncDart = int Function(int, Pointer<Pointer<Int8>>);
typedef SdlAppInitFunc = Int32 Function(Int32, Pointer<Pointer<Int8>>);

// typedef int (SDLCALL *SDL_AppIterate_func)(void)
typedef SdlAppIterateFuncDart = int Function();
typedef SdlAppIterateFunc = Int32 Function();

// typedef int (SDLCALL *SDL_AppEvent_func)(const SDL_Event *event)
typedef SdlAppEventFuncDart = int Function(Pointer<SdlEvent>);
typedef SdlAppEventFunc = Int32 Function(Pointer<SdlEvent>);

// typedef void (SDLCALL *SDL_AppQuit_func)(void)
typedef SdlAppQuitFuncDart = void Function();
typedef SdlAppQuitFunc = Void Function();

// typedef int (SDLCALL *SDL_main_func)(int argc, char *argv[])
typedef SdlMainFuncDart = int Function(int, Pointer<Pointer<Int8>>);
typedef SdlMainFunc = Int32 Function(Int32, Pointer<Pointer<Int8>>);

// typedef void (SDLCALL *SDL_EnumeratePropertiesCallback)(void *userdata, SDL_PropertiesID props, const char *name)
typedef SdlEnumeratePropertiesCallbackDart = void Function(
    Pointer<NativeType>, int, Pointer<Utf8>);
typedef SdlEnumeratePropertiesCallback = Void Function(
    Pointer<NativeType>, Uint32, Pointer<Utf8>);

// typedef void *(SDLCALL *SDL_malloc_func)(size_t size)
typedef SdlMallocFuncDart = Pointer<NativeType> Function(int);
typedef SdlMallocFunc = Pointer<NativeType> Function(Uint32);

// typedef void *(SDLCALL *SDL_calloc_func)(size_t nmemb, size_t size)
typedef SdlCallocFuncDart = Pointer<NativeType> Function(int, int);
typedef SdlCallocFunc = Pointer<NativeType> Function(Uint32, Uint32);

// typedef void *(SDLCALL *SDL_realloc_func)(void *mem, size_t size)
typedef SdlReallocFuncDart = Pointer<NativeType> Function(
    Pointer<NativeType>, int);
typedef SdlReallocFunc = Pointer<NativeType> Function(
    Pointer<NativeType>, Uint32);

// typedef void (SDLCALL *SDL_free_func)(void *mem)
typedef SdlFreeFuncDart = void Function(Pointer<NativeType>);
typedef SdlFreeFunc = Void Function(Pointer<NativeType>);

// typedef void (*SDL_FunctionPointer)(void)
typedef SdlFunctionPointerDart = void Function();
typedef SdlFunctionPointer = Void Function();

// typedef int (SDLCALL *SDL_blit) (struct SDL_Surface *src, const SDL_Rect *srcrect, struct SDL_Surface *dst, const SDL_Rect *dstrect)
typedef SdlBlitDart = int Function(Pointer<SdlSurface>, Pointer<SdlRect>,
    Pointer<SdlSurface>, Pointer<SdlRect>);
typedef SdlBlit = Int32 Function(Pointer<SdlSurface>, Pointer<SdlRect>,
    Pointer<SdlSurface>, Pointer<SdlRect>);

// typedef SDL_bool (SDLCALL *SDL_WindowsMessageHook)(void *userdata, MSG *msg)
typedef SdlWindowsMessageHookDart = int Function(
    Pointer<NativeType>, Pointer<MSG>);
typedef SdlWindowsMessageHook = Int32 Function(
    Pointer<NativeType>, Pointer<MSG>);

// typedef SDL_bool (SDLCALL *SDL_X11EventHook)(void *userdata, XEvent *xevent)
typedef SdlX11EventHookDart = int Function(
    Pointer<NativeType>, Pointer<XEvent>);
typedef SdlX11EventHook = Int32 Function(Pointer<NativeType>, Pointer<XEvent>);

// typedef int (SDLCALL * SDL_ThreadFunction) (void *data)
typedef SdlThreadFunctionDart = int Function(Pointer<NativeType>);
typedef SdlThreadFunction = Int32 Function(Pointer<NativeType>);

// typedef uintptr_t (__cdecl * pfnSDL_CurrentBeginThread) (void *, unsigned, unsigned (__stdcall *func)(void *), void * , unsigned, unsigned * )
typedef PfnSdlCurrentBeginThreadDart = Pointer<NativeType> Function(
    Pointer<NativeType>);
typedef PfnSdlCurrentBeginThread = Pointer<NativeType> Function(
    Pointer<NativeType>);

// typedef void (__cdecl * pfnSDL_CurrentEndThread) (unsigned code)
typedef PfnSdlCurrentEndThreadDart = void Function(Pointer<NativeType>);
typedef PfnSdlCurrentEndThread = Void Function(Pointer<NativeType>);

// typedef Uint32 (SDLCALL *SDL_TimerCallback)(Uint32 interval, void *param)
typedef SdlTimerCallbackDart = int Function(int, Pointer<NativeType>);
typedef SdlTimerCallback = Uint32 Function(Uint32, Pointer<NativeType>);

// typedef SDL_EGLAttrib *(SDLCALL *SDL_EGLAttribArrayCallback)(void)
typedef SdlEglAttribArrayCallbackDart = Pointer<Uint64> Function();
typedef SdlEglAttribArrayCallback = Pointer<Uint64> Function();

// typedef SDL_EGLint *(SDLCALL *SDL_EGLIntArrayCallback)(void)
typedef SdlEglIntArrayCallbackDart = Pointer<Int32> Function();
typedef SdlEglIntArrayCallback = Pointer<Int32> Function();

// typedef SDL_HitTestResult (SDLCALL *SDL_HitTest)(SDL_Window *win, const SDL_Point *area, void *data)
typedef SdlHitTestDart = int Function(
    Pointer<SdlWindow>, Pointer<SdlPoint>, Pointer<NativeType>);
typedef SdlHitTest = Int32 Function(
    Pointer<SdlWindow>, Pointer<SdlPoint>, Pointer<NativeType>);
