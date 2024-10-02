// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../dylib.dart' as dylib;
import 'struct_sdl.dart';

final libSdl3 = dylib.dylibOpen('SDL3');

// typedef SDL_AssertState (SDLCALL *SDL_AssertionHandler)( const SDL_AssertData *data, void *userdata)
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

// typedef void (SDLCALL *SDL_DialogFileCallback)(void *userdata, const char * const *filelist, int filter)
typedef SdlDialogFileCallbackDart = void Function(
    Pointer<NativeType> userdata, Pointer<Pointer<Int8>> filelist, int filter);
typedef SdlDialogFileCallback = Void Function(Pointer<NativeType> userdata,
    Pointer<Pointer<Int8>> filelist, Int32 filter);

// typedef bool (SDLCALL *SDL_EventFilter)(void *userdata, SDL_Event *event)
typedef SdlEventFilterDart = int Function(
    Pointer<NativeType> userdata, Pointer<SdlEvent> event);
typedef SdlEventFilter = Uint8 Function(
    Pointer<NativeType> userdata, Pointer<SdlEvent> event);

// typedef SDL_EnumerationResult (SDLCALL *SDL_EnumerateDirectoryCallback)(void *userdata, const char *dirname, const char *fname)
typedef SdlEnumerateDirectoryCallbackDart = int Function(
    Pointer<NativeType> userdata, Pointer<Utf8> dirname, Pointer<Utf8> fname);
typedef SdlEnumerateDirectoryCallback = Int32 Function(
    Pointer<NativeType> userdata, Pointer<Utf8> dirname, Pointer<Utf8> fname);

// typedef void(SDLCALL *SDL_HintCallback)(void *userdata, const char *name, const char *oldValue, const char *newValue)
typedef SdlHintCallbackDart = void Function(Pointer<NativeType> userdata,
    Pointer<Utf8> name, Pointer<Utf8> oldValue, Pointer<Utf8> newValue);
typedef SdlHintCallback = Void Function(Pointer<NativeType> userdata,
    Pointer<Utf8> name, Pointer<Utf8> oldValue, Pointer<Utf8> newValue);

// typedef SDL_AppResult (SDLCALL *SDL_AppInit_func)(void **appstate, int argc, char *argv[])
typedef SdlAppInitFuncDart = int Function(Pointer<Pointer<NativeType>> appstate,
    int argc, Pointer<Pointer<Int8>> argv);
typedef SdlAppInitFunc = Int32 Function(Pointer<Pointer<NativeType>> appstate,
    Int32 argc, Pointer<Pointer<Int8>> argv);

// typedef SDL_AppResult (SDLCALL *SDL_AppIterate_func)(void *appstate)
typedef SdlAppIterateFuncDart = int Function(Pointer<NativeType> appstate);
typedef SdlAppIterateFunc = Int32 Function(Pointer<NativeType> appstate);

// typedef SDL_AppResult (SDLCALL *SDL_AppEvent_func)(void *appstate, SDL_Event *event)
typedef SdlAppEventFuncDart = int Function(
    Pointer<NativeType> appstate, Pointer<SdlEvent> event);
typedef SdlAppEventFunc = Int32 Function(
    Pointer<NativeType> appstate, Pointer<SdlEvent> event);

// typedef void (SDLCALL *SDL_AppQuit_func)(void *appstate)
typedef SdlAppQuitFuncDart = void Function(Pointer<NativeType> appstate);
typedef SdlAppQuitFunc = Void Function(Pointer<NativeType> appstate);

// typedef void (SDLCALL *SDL_LogOutputFunction)(void *userdata, int category, SDL_LogPriority priority, const char *message)
typedef SdlLogOutputFunctionDart = void Function(Pointer<NativeType> userdata,
    int category, int priority, Pointer<Utf8> message);
typedef SdlLogOutputFunction = Void Function(Pointer<NativeType> userdata,
    Int32 category, Int32 priority, Pointer<Utf8> message);

// typedef int (SDLCALL *SDL_main_func)(int argc, char *argv[])
typedef SdlMainFuncDart = int Function(int argc, Pointer<Pointer<Int8>> argv);
typedef SdlMainFunc = Int32 Function(Int32 argc, Pointer<Pointer<Int8>> argv);

// typedef void (SDLCALL *SDL_CleanupPropertyCallback)(void *userdata, void *value)
typedef SdlCleanupPropertyCallbackDart = void Function(
    Pointer<NativeType> userdata, Pointer<NativeType> value);
typedef SdlCleanupPropertyCallback = Void Function(
    Pointer<NativeType> userdata, Pointer<NativeType> value);

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

// typedef int (SDLCALL *SDL_CompareCallback)(const void *a, const void *b)
typedef SdlCompareCallbackDart = int Function(
    Pointer<NativeType> a, Pointer<NativeType> b);
typedef SdlCompareCallback = Int32 Function(
    Pointer<NativeType> a, Pointer<NativeType> b);

// typedef int (SDLCALL *SDL_CompareCallback_r)(void *userdata, const void *a, const void *b)
typedef SdlCompareCallbackRDart = int Function(
    Pointer<NativeType> userdata, Pointer<NativeType> a, Pointer<NativeType> b);
typedef SdlCompareCallbackR = Int32 Function(
    Pointer<NativeType> userdata, Pointer<NativeType> a, Pointer<NativeType> b);

// typedef void (*SDL_FunctionPointer)(void)
typedef SdlFunctionPointerDart = void Function();
typedef SdlFunctionPointer = Void Function();

// typedef bool (SDLCALL *SDL_WindowsMessageHook)(void *userdata, MSG *msg)
typedef SdlWindowsMessageHookDart = int Function(
    Pointer<NativeType> userdata, Pointer<MSG> msg);
typedef SdlWindowsMessageHook = Uint8 Function(
    Pointer<NativeType> userdata, Pointer<MSG> msg);

// typedef bool (SDLCALL *SDL_X11EventHook)(void *userdata, XEvent *xevent)
typedef SdlX11EventHookDart = int Function(
    Pointer<NativeType> userdata, Pointer<XEvent> xevent);
typedef SdlX11EventHook = Uint8 Function(
    Pointer<NativeType> userdata, Pointer<XEvent> xevent);

// typedef void (SDLCALL *SDL_iOSAnimationCallback)(void *userdata)
typedef SdlIOsAnimationCallbackDart = void Function(
    Pointer<NativeType> userdata);
typedef SdlIOsAnimationCallback = Void Function(Pointer<NativeType> userdata);

// typedef void (SDLCALL *SDL_RequestAndroidPermissionCallback)(void *userdata, const char *permission, bool granted)
typedef SdlRequestAndroidPermissionCallbackDart = void Function(
    Pointer<NativeType> userdata, Pointer<Utf8> permission, int granted);
typedef SdlRequestAndroidPermissionCallback = Void Function(
    Pointer<NativeType> userdata, Pointer<Utf8> permission, Uint8 granted);

// typedef int (SDLCALL * SDL_ThreadFunction) (void *data)
typedef SdlThreadFunctionDart = int Function(Pointer<NativeType> data);
typedef SdlThreadFunction = Int32 Function(Pointer<NativeType> data);

// typedef void (SDLCALL *SDL_TLSDestructorCallback)(void *value)
typedef SdlTlsDestructorCallbackDart = void Function(Pointer<NativeType> value);
typedef SdlTlsDestructorCallback = Void Function(Pointer<NativeType> value);

// typedef Uint32 (SDLCALL *SDL_TimerCallback)(void *userdata, SDL_TimerID timerID, Uint32 interval)
typedef SdlTimerCallbackDart = int Function(
    Pointer<NativeType> userdata, int timerId, int interval);
typedef SdlTimerCallback = Uint32 Function(
    Pointer<NativeType> userdata, Uint32 timerId, Uint32 interval);

// typedef Uint64 (SDLCALL *SDL_NSTimerCallback)(void *userdata, SDL_TimerID timerID, Uint64 interval)
typedef SdlNsTimerCallbackDart = int Function(
    Pointer<NativeType> userdata, int timerId, int interval);
typedef SdlNsTimerCallback = Uint64 Function(
    Pointer<NativeType> userdata, Uint32 timerId, Uint64 interval);

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
