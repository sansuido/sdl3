// https://github.com/libsdl-org/SDL_mixer/blob/main/test/testspatialization.c
import 'dart:ffi';
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
  Pointer<Void> userdata,
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

bool appEvent() {
  var running = true;
  SdlxEvent? event;
  while ((event = sdlxPollEvent()) != null) {
    if (event is SdlxQuitEvent) {
      running = false;
    }
    if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
      switch (event.scancode) {
        case SdlkScancode.escape:
          running = false;
        case SdlkScancode.a:
          gAutopilot = true;
      }
    }
    if (event is SdlxMouseButtonEvent) {
      if (event.type == SdlkEvent.mouseButtonDown) {
        if (event.button == 1) {
          gMouseDown = true;
        }
      } else if (event.type == SdlkEvent.mouseButtonUp) {
        if (event.button == 1) {
          gAutopilot = false;
          gMouseDown = false;
        }
      }
    }
    if (event is SdlxMouseMotionEvent) {
      if (gMouseDown) {
        gAutopilot = false;
        gMouseX = event.x;
        gMouseY = event.y;
      }
    }
  }
  return running;
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
  final center = SdlxFPoint(0, 0)
    ..x = 640.0 / 2.0
    ..y = 480.0 / 2.0;
  const radius = 200.0; // size of half the circle (radius, not diameter).
  const boxsize = 30.0;
  final sourcept = SdlxFPoint(0, 0);
  final position = MixxPoint3D()..y = 0; // always horizontal.
  // run in a horizontal circle around the listener (circling on X and Z coordinates).
  if (gAutopilot) {
    position
      ..x = sdlCosf(angle)
      ..z = sdlSinf(angle);
    sourcept
      ..x = center.x + (position.x * radius)
      ..y = center.y + (position.z * radius);
  } else {
    position
      ..x =
          ((gMouseX / 640.0) * 2.0) -
          1.0 // scale to -1.0f to 1.0f
      ..z = ((gMouseY / 480.0) * 2.0) - 1.0;
    sourcept
      ..x = gMouseX
      ..y = gMouseY;
  }
  const scale = 3.0;
  position
    ..x *=
        scale // make distance attenuation noticable.
    ..z *= scale;
  mixxSetTrack3DPosition(gTrack, position);
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
    final sourceRect = SdlxFRect()
      ..x = sourcept.x - boxsize / 2
      ..y = sourcept.y - boxsize / 2
      ..w = boxsize
      ..h = boxsize;
    sdlSetRenderDrawColor(gRenderer, 0, 0, 255, 255);
    sdlxRenderFillRect(gRenderer, sourceRect);
    sdlSetRenderDrawColor(gRenderer, 255, 255, 255, 255);
    sdlRenderDebugText(
      gRenderer,
      sourceRect.x + ((boxsize - 48.0) / 2.0),
      sourceRect.y + boxsize,
      'SOURCE',
    );
  }
  {
    final listenerRect = SdlxFRect()
      ..x = center.x - boxsize / 2
      ..y = center.y - boxsize / 2
      ..w = boxsize
      ..h = boxsize;
    sdlSetRenderDrawColor(gRenderer, 0, 255, 0, 255);
    sdlxRenderFillRect(gRenderer, listenerRect);
    sdlSetRenderDrawColor(gRenderer, 255, 255, 255, 255);
    sdlRenderDebugText(
      gRenderer,
      listenerRect.x + ((boxsize - 64.0) / 2.0),
      listenerRect.y + boxsize,
      'LISTENER',
    );
  }
  sdlRenderPresent(gRenderer);
  return true;
}

void main() async {
  if (appInit()) {
    var running = true;
    while (running) {
      running = appEvent();
      if (!running) {
        break;
      }
      if (running) {
        running = appIterate();
      }
      // Note that when using sdlDelay, you cannot delegate processing to a callback.
      await Future.delayed(const Duration(milliseconds: 16));
    }
  }
  appQuit();
}
