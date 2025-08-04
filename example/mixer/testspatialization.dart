// https://github.com/libsdl-org/SDL_mixer/blob/main/test/testspatialization.c
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

const gSound = 'assets/waves-at-baltic-sea-shore/waves-at-baltic-sea-shore.wav';

Pointer<SdlWindow> gWindow = nullptr;
Pointer<SdlRenderer> gRenderer = nullptr;
Pointer<MixMixer> gMixer = nullptr;
Pointer<MixAudio> gAudio = nullptr;
Pointer<MixTrack> gTrack = nullptr;
var gAutopilot = true;
var gMouseDown = false;
double gMouseX = 640.0 / 2;
double gMouseY = 480.0 / 2;
List<double> gPcms = [];
NativeCallable<MixTrackMixCallback>? gRawCall;

void rawCallback(
  Pointer<NativeType> userdata,
  Pointer<MixTrack> track,
  Pointer<SdlAudioSpec> spec,
  Pointer<Float> pcm,
  int samples,
) {
  gPcms = [];
  for (var sample = 0; sample < samples; sample++) {
    gPcms.add(pcm[sample]);
  }
}

bool appInit() {
  sdlSetAppMetadata(
    'Test SDL_mixer spatialization',
    '1.0',
    'org.libsdl.testmixerspatialization',
  );
  if (!sdlInit(SdlkInit.video)) {
    print("Couldn't initialize SDL: ${sdlGetError()}");
    return false;
  }
  if (!mixInit()) {
    print("Couldn't initialize SDL_mixer: ${sdlGetError()}");
    return false;
  }
  gWindow = SdlWindowEx.create(title: 'testmixer', w: 640, h: 480);
  if (gWindow == nullptr) {
    print("Couldn't create window: ${sdlGetError()}");
    return false;
  }
  gRenderer = gWindow.createRenderer();
  if (gRenderer == nullptr) {
    print("Couldn't create renderer: ${sdlGetError()}");
    return false;
  }
  gMixer = mixCreateMixerDevice(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, nullptr);
  if (gMixer == nullptr) {
    print("Couldn't create mixer: ${sdlGetError()}");
    return false;
  }
  gAudio = mixLoadAudio(gMixer, gSound, false);
  if (gAudio == nullptr) {
    print("Couldn't create audio: ${sdlGetError()}");
    return false;
  }
  gTrack = mixCreateTrack(gMixer);
  if (gTrack == nullptr) {
    print("Couldn't create track: ${sdlGetError()}");
    return false;
  }
  mixSetTrackAudio(gTrack, gAudio);
  final options = sdlCreateProperties();
  sdlSetNumberProperty(options, MIX_PROP_PLAY_LOOPS_NUMBER, -1);
  mixPlayTrack(gTrack, options);
  sdlDestroyProperties(options);
  gRawCall = NativeCallable<MixTrackMixCallback>.listener(rawCallback);
  if (gRawCall != null) {
    gTrack.setRawCallback(gRawCall!.nativeFunction, nullptr);
  }
  return true;
}

void appQuit() {
  if (gRawCall != null) {
    gRawCall!.close();
  }
  gTrack.destroy();
  gAudio.destroy();
  gMixer.destroy();
  gRenderer.destroy();
  gWindow.destroy();
  mixQuit();
  sdlQuit();
}

bool appEvent(Pointer<SdlEvent> event) {
  switch (event.type) {
    case SdlkEvent.quit:
      return true;
    case SdlkEvent.keyDown:
      switch (event.key.ref.key) {
        case Sdlk.escape:
          return true;
        case Sdlk.a:
          gAutopilot = true;
      }
    case SdlkEvent.mouseButtonDown:
      if (event.button.ref.button == 1) {
        gMouseDown = true;
      }
    case SdlkEvent.mouseButtonUp:
      if (event.button.ref.button == 1) {
        gAutopilot = false;
        gMouseDown = false;
      }
    case SdlkEvent.mouseMotion:
      if (gMouseDown) {
        gAutopilot = false;
        gMouseX = event.motion.ref.x;
        gMouseY = event.motion.ref.y;
      }
  }
  return false;
}

bool appIterate() {
  const period = 5000;
  final moment =
      (sdlGetTicks() % period) /
      period.toDouble(); // moment in the time period, from 0.0f to 1.0f
  final angle =
      moment *
      2.0 *
      SDL_PI_F; // angle on the circle for this moment, in radians.
  final center = calloc<SdlFPoint>()
    ..ref.x = 640.0 / 2.0
    ..ref.y = 480.0 / 2.0;
  const radius = 200.0; // size of half the circle (radius, not diameter).
  const boxsize = 30.0;
  final sourcept = calloc<SdlFPoint>();
  final position = calloc<MixPoint3D>();
  position.ref.y = 0; // always horizontal.
  // run in a horizontal circle around the listener (circling on X and Z coordinates).
  if (gAutopilot) {
    position.ref.x = sdlCosf(angle);
    position.ref.z = sdlSinf(angle);
    sourcept.ref.x = center.ref.x + (position.ref.x * radius);
    sourcept.ref.y = center.ref.y + (position.ref.z * radius);
  } else {
    position.ref.x = ((gMouseX / 640.0) * 2.0) - 1.0; // scale to -1.0f to 1.0f
    position.ref.z = ((gMouseY / 480.0) * 2.0) - 1.0;
    sourcept.ref.x = gMouseX;
    sourcept.ref.y = gMouseY;
  }
  const scale = 3.0;
  position.ref.x *= scale; // make distance attenuation noticable.
  position.ref.z *= scale;
  mixSetTrack3DPosition(gTrack, position);
  sdlSetRenderDrawColor(gRenderer, 0, 0, 0, 255);
  sdlRenderClear(gRenderer);
  if (gTrack.playing() && gPcms.isNotEmpty) {
    sdlSetRenderDrawColor(gRenderer, 255, 255, 255, 255);
    double px = 0;
    double py = 240;
    for (var i = 0; i < gPcms.length; i++) {
      final x = i * 640 / gPcms.length;
      final y = gPcms[i] * 240 + 240;
      sdlRenderLine(gRenderer, px, py, x, y);
      px = x;
      py = y;
    }
  } else {
    sdlSetRenderDrawColor(gRenderer, 255, 255, 255, 255);
    sdlRenderLine(gRenderer, 0, 240, 640, 240);
  }
  {
    final sourceRect = calloc<SdlFRect>()
      ..ref.x = sourcept.ref.x - boxsize / 2
      ..ref.y = sourcept.ref.y - boxsize / 2
      ..ref.w = boxsize
      ..ref.h = boxsize;
    sdlSetRenderDrawColor(gRenderer, 0, 0, 255, 255);
    sdlRenderFillRect(gRenderer, sourceRect);
    sdlSetRenderDrawColor(gRenderer, 255, 255, 255, 255);
    sdlRenderDebugText(
      gRenderer,
      sourceRect.ref.x + ((boxsize - 48.0) / 2.0),
      sourceRect.ref.y + boxsize,
      'SOURCE',
    );
    sourceRect.callocFree();
  }
  {
    final listenerRect = calloc<SdlFRect>()
      ..ref.x = center.ref.x - boxsize / 2
      ..ref.y = center.ref.y - boxsize / 2
      ..ref.w = boxsize
      ..ref.h = boxsize;
    sdlSetRenderDrawColor(gRenderer, 0, 255, 0, 255);
    sdlRenderFillRect(gRenderer, listenerRect);
    sdlSetRenderDrawColor(gRenderer, 255, 255, 255, 255);
    sdlRenderDebugText(
      gRenderer,
      listenerRect.ref.x + ((boxsize - 64.0) / 2.0),
      listenerRect.ref.y + boxsize,
      'LISTENER',
    );
    listenerRect.callocFree();
  }
  sdlRenderPresent(gRenderer);
  center.callocFree();
  sourcept.callocFree();
  position.callocFree();
  return false;
}

void main() async {
  if (appInit()) {
    var quit = false;
    final event = calloc<SdlEvent>();
    while (!quit) {
      while (event.poll()) {
        quit = appEvent(event);
        if (quit) {
          break;
        }
      }
      if (!quit) {
        quit = appIterate();
      }
      // Note that when using sdlDelay, you cannot delegate processing to a callback.
      await Future.delayed(const Duration(milliseconds: 16));
    }
    event.callocFree();
  }
  appQuit();
}
