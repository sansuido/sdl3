// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../dylib.dart' as dylib;
import 'struct_sdl.dart';

final libSdl3 = dylib.dylibOpen('SDL3');

// typedef SDL_AssertState (SDLCALL *SDL_AssertionHandler)( const SDL_AssertData* data, void* userdata)
typedef SdlAssertionHandlerDart = int Function(
    Pointer<SdlAssertData> data, Pointer<NativeType> userdata);
typedef SdlAssertionHandler = Int32 Function(
    Pointer<SdlAssertData> data, Pointer<NativeType> userdata);

// typedef void (*SDL_KernelMemoryBarrierFunc)()
typedef SdlKernelMemoryBarrierFuncDart = void Function();
typedef SdlKernelMemoryBarrierFunc = Void Function();

// typedef void (SDLCALL *SDL_AudioStreamCallback)(void *userdata, SDL_AudioStream *stream, int additional_amount, int total_amount)
typedef SdlAudioStreamCallbackDart = void Function(Pointer<NativeType> userdata,
    Pointer<SdlAudioStream> stream, int additionalAmount, int totalAmount);
typedef SdlAudioStreamCallback = Void Function(Pointer<NativeType> userdata,
    Pointer<SdlAudioStream> stream, Int32 additionalAmount, Int32 totalAmount);

// typedef void (SDLCALL *SDL_AudioPostmixCallback)(void *userdata, const SDL_AudioSpec *spec, float *buffer, int buflen)
typedef SdlAudioPostmixCallbackDart = void Function(
    Pointer<NativeType> userdata,
    Pointer<SdlAudioSpec> spec,
    Pointer<Float> buffer,
    int buflen);
typedef SdlAudioPostmixCallback = Void Function(Pointer<NativeType> userdata,
    Pointer<SdlAudioSpec> spec, Pointer<Float> buffer, Int32 buflen);

// typedef const void *(SDLCALL *SDL_ClipboardDataCallback)(void *userdata, const char *mime_type, size_t *size)
typedef SdlClipboardDataCallbackDart = Pointer<NativeType> Function(
    Pointer<NativeType> userdata, Pointer<Utf8> mimeType, Pointer<Uint32> size);
typedef SdlClipboardDataCallback = Pointer<NativeType> Function(
    Pointer<NativeType> userdata, Pointer<Utf8> mimeType, Pointer<Uint32> size);

// typedef void (SDLCALL *SDL_ClipboardCleanupCallback)(void *userdata)
typedef SdlClipboardCleanupCallbackDart = void Function(
    Pointer<NativeType> userdata);
typedef SdlClipboardCleanupCallback = Void Function(
    Pointer<NativeType> userdata);

// typedef void(SDLCALL *SDL_DialogFileCallback)(void *userdata, const char * const *filelist, int filter)
typedef SdlDialogFileCallbackDart = void Function(
    Pointer<NativeType> userdata, Pointer<Pointer<Int8>> filelist, int filter);
typedef SdlDialogFileCallback = Void Function(Pointer<NativeType> userdata,
    Pointer<Pointer<Int8>> filelist, Int32 filter);

// typedef int (SDLCALL *SDL_EventFilter)(void *userdata, SDL_Event *event)
typedef SdlEventFilterDart = int Function(
    Pointer<NativeType> userdata, Pointer<SdlEvent> event);
typedef SdlEventFilter = Int32 Function(
    Pointer<NativeType> userdata, Pointer<SdlEvent> event);

// typedef int (SDLCALL *SDL_EnumerateDirectoryCallback)(void *userdata, const char *dirname, const char *fname)
typedef SdlEnumerateDirectoryCallbackDart = int Function(
    Pointer<NativeType> userdata, Pointer<Utf8> dirname, Pointer<Utf8> fname);
typedef SdlEnumerateDirectoryCallback = Int32 Function(
    Pointer<NativeType> userdata, Pointer<Utf8> dirname, Pointer<Utf8> fname);

// typedef void (SDLCALL *SDL_HintCallback)(void *userdata, const char *name, const char *oldValue, const char *newValue)
typedef SdlHintCallbackDart = void Function(Pointer<NativeType> userdata,
    Pointer<Utf8> name, Pointer<Utf8> oldValue, Pointer<Utf8> newValue);
typedef SdlHintCallback = Void Function(Pointer<NativeType> userdata,
    Pointer<Utf8> name, Pointer<Utf8> oldValue, Pointer<Utf8> newValue);

// typedef void (SDLCALL *SDL_LogOutputFunction)(void *userdata, int category, SDL_LogPriority priority, const char *message)
typedef SdlLogOutputFunctionDart = void Function(Pointer<NativeType> userdata,
    int category, int priority, Pointer<Utf8> message);
typedef SdlLogOutputFunction = Void Function(Pointer<NativeType> userdata,
    Int32 category, Int32 priority, Pointer<Utf8> message);

// typedef int (SDLCALL *SDL_AppInit_func)(int argc, char *argv[])
typedef SdlAppInitFuncDart = int Function(
    int argc, Pointer<Pointer<Int8>> argv);
typedef SdlAppInitFunc = Int32 Function(
    Int32 argc, Pointer<Pointer<Int8>> argv);

// typedef int (SDLCALL *SDL_AppIterate_func)(void)
typedef SdlAppIterateFuncDart = int Function();
typedef SdlAppIterateFunc = Int32 Function();

// typedef int (SDLCALL *SDL_AppEvent_func)(const SDL_Event *event)
typedef SdlAppEventFuncDart = int Function(Pointer<SdlEvent> event);
typedef SdlAppEventFunc = Int32 Function(Pointer<SdlEvent> event);

// typedef void (SDLCALL *SDL_AppQuit_func)(void)
typedef SdlAppQuitFuncDart = void Function();
typedef SdlAppQuitFunc = Void Function();

// typedef int (SDLCALL *SDL_main_func)(int argc, char *argv[])
typedef SdlMainFuncDart = int Function(int argc, Pointer<Pointer<Int8>> argv);
typedef SdlMainFunc = Int32 Function(Int32 argc, Pointer<Pointer<Int8>> argv);

// typedef void (SDLCALL *SDL_EnumeratePropertiesCallback)(void *userdata, SDL_PropertiesID props, const char *name)
typedef SdlEnumeratePropertiesCallbackDart = void Function(
    Pointer<NativeType> userdata, int props, Pointer<Utf8> name);
typedef SdlEnumeratePropertiesCallback = Void Function(
    Pointer<NativeType> userdata, Uint32 props, Pointer<Utf8> name);

// typedef void *(SDLCALL *SDL_malloc_func)(size_t size)
typedef SdlMallocFuncDart = Pointer<NativeType> Function(int size);
typedef SdlMallocFunc = Pointer<NativeType> Function(Uint32 size);

// typedef void *(SDLCALL *SDL_calloc_func)(size_t nmemb, size_t size)
typedef SdlCallocFuncDart = Pointer<NativeType> Function(int nmemb, int size);
typedef SdlCallocFunc = Pointer<NativeType> Function(Uint32 nmemb, Uint32 size);

// typedef void *(SDLCALL *SDL_realloc_func)(void *mem, size_t size)
typedef SdlReallocFuncDart = Pointer<NativeType> Function(
    Pointer<NativeType> mem, int size);
typedef SdlReallocFunc = Pointer<NativeType> Function(
    Pointer<NativeType> mem, Uint32 size);

// typedef void (SDLCALL *SDL_free_func)(void *mem)
typedef SdlFreeFuncDart = void Function(Pointer<NativeType> mem);
typedef SdlFreeFunc = Void Function(Pointer<NativeType> mem);

// typedef void (*SDL_FunctionPointer)(void)
typedef SdlFunctionPointerDart = void Function();
typedef SdlFunctionPointer = Void Function();

// typedef int (SDLCALL *SDL_blit) (struct SDL_Surface *src, const SDL_Rect *srcrect, struct SDL_Surface *dst, const SDL_Rect *dstrect)
typedef SdlBlitDart = int Function(
    Pointer<SdlSurface> src,
    Pointer<SdlRect> srcrect,
    Pointer<SdlSurface> dst,
    Pointer<SdlRect> dstrect);
typedef SdlBlit = Int32 Function(
    Pointer<SdlSurface> src,
    Pointer<SdlRect> srcrect,
    Pointer<SdlSurface> dst,
    Pointer<SdlRect> dstrect);

// typedef SDL_bool (SDLCALL *SDL_WindowsMessageHook)(void *userdata, MSG *msg)
typedef SdlWindowsMessageHookDart = int Function(
    Pointer<NativeType> userdata, Pointer<MSG> msg);
typedef SdlWindowsMessageHook = Int32 Function(
    Pointer<NativeType> userdata, Pointer<MSG> msg);

// typedef SDL_bool (SDLCALL *SDL_X11EventHook)(void *userdata, XEvent *xevent)
typedef SdlX11EventHookDart = int Function(
    Pointer<NativeType> userdata, Pointer<XEvent> xevent);
typedef SdlX11EventHook = Int32 Function(
    Pointer<NativeType> userdata, Pointer<XEvent> xevent);

// typedef void (SDLCALL *SDL_AndroidRequestPermissionCallback)(void *userdata, const char *permission, SDL_bool granted)
typedef SdlAndroidRequestPermissionCallbackDart = void Function(
    Pointer<NativeType> userdata, Pointer<Utf8> permission, int granted);
typedef SdlAndroidRequestPermissionCallback = Void Function(
    Pointer<NativeType> userdata, Pointer<Utf8> permission, Int32 granted);

// typedef int (SDLCALL * SDL_ThreadFunction) (void *data)
typedef SdlThreadFunctionDart = int Function(Pointer<NativeType> data);
typedef SdlThreadFunction = Int32 Function(Pointer<NativeType> data);

// typedef uintptr_t (__cdecl * pfnSDL_CurrentBeginThread) (void *, unsigned, unsigned (__stdcall *func)(void *), void * , unsigned, unsigned * )
typedef PfnSdlCurrentBeginThreadDart = Pointer<NativeType> Function(
    Pointer<NativeType> arg0);
typedef PfnSdlCurrentBeginThread = Pointer<NativeType> Function(
    Pointer<NativeType> arg0);

// typedef void (__cdecl * pfnSDL_CurrentEndThread) (unsigned code)
typedef PfnSdlCurrentEndThreadDart = void Function(Pointer<NativeType> code);
typedef PfnSdlCurrentEndThread = Void Function(Pointer<NativeType> code);

// typedef Uint32 (SDLCALL *SDL_TimerCallback)(Uint32 interval, void *param)
typedef SdlTimerCallbackDart = int Function(
    int interval, Pointer<NativeType> param);
typedef SdlTimerCallback = Uint32 Function(
    Uint32 interval, Pointer<NativeType> param);

// typedef SDL_EGLAttrib *(SDLCALL *SDL_EGLAttribArrayCallback)(void)
typedef SdlEglAttribArrayCallbackDart = Pointer<Uint64> Function();
typedef SdlEglAttribArrayCallback = Pointer<Uint64> Function();

// typedef SDL_EGLint *(SDLCALL *SDL_EGLIntArrayCallback)(void)
typedef SdlEglIntArrayCallbackDart = Pointer<Int32> Function();
typedef SdlEglIntArrayCallback = Pointer<Int32> Function();

// typedef SDL_HitTestResult (SDLCALL *SDL_HitTest)(SDL_Window *win, const SDL_Point *area, void *data)
typedef SdlHitTestDart = int Function(
    Pointer<SdlWindow> win, Pointer<SdlPoint> area, Pointer<NativeType> data);
typedef SdlHitTest = Int32 Function(
    Pointer<SdlWindow> win, Pointer<SdlPoint> area, Pointer<NativeType> data);
