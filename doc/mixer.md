
# CategorySDLMixer

SDL_mixer is a library to make complicated audio processing tasks easier.

It offers audio file decoding, mixing multiple sounds together, basic 3D
positional audio, and various audio effects.

It can mix sound to multiple audio devices in real time, or generate mixed
audio data to a memory buffer for any other use. It can do both at the same
time!

To use the library, first call MIX_Init(). Then create a mixer with
MIX_CreateMixerDevice() (or MIX_CreateMixer() to render to memory).

Once you have a mixer, you can load sound data with MIX_LoadAudio(),
MIX_LoadAudio_IO(), or MIX_LoadAudioWithProperties(). Data gets loaded once
and can be played over and over.

When loading audio, SDL_mixer can parse out several metadata tag formats,
such as ID3 and APE tags, and exposes this information through the
MIX_GetAudioProperties() function.

To play audio, you create a track with MIX_CreateTrack(). You need one
track for each sound that will be played simultaneously; think of tracks as
individual sliders on a mixer board. You might have loaded hundreds of
audio files, but you probably only have a handful of tracks that you assign
those loaded files to when they are ready to play, and reuse those tracks
with different audio later. Tracks take their input from a MIX_Audio
(static data to be played multiple times) or an SDL_AudioStream (streaming
PCM audio the app supplies, possibly as needed). A third option is to
supply an SDL_IOStream, to load and decode on the fly, which might be more
efficient for background music that is only used once, etc.

Assign input to a MIX_Track with MIX_SetTrackAudio(),
MIX_SetTrackAudioStream(), or MIX_SetTrackIOStream().

Once a track has an input, start it playing with MIX_PlayTrack(). There are
many options to this function to dictate mixing features: looping, fades,
etc.

Tracks can be tagged with arbitrary strings, like "music" or "ingame" or
"ui". These tags can be used to start, stop, and pause a selection of
tracks at the same moment.

All significant portions of the mixing pipeline have callbacks, so that an
app can hook in to the appropriate locations to examine or modify audio
data as it passes through the mixer: a "raw" callback for raw PCM data
decoded from an audio file without any modifications, a "cooked" callback
for that same data after all transformations (fade, positioning, etc) have
been processed, a "stopped" callback for when the track finishes mixing, a
"postmix" callback for the final mixed audio about to be sent to the audio
hardware to play. Additionally, you can use MIX_Group objects to mix a
subset of playing tracks and access the data before it is mixed in with
other tracks. All of this is optional, but allows for powerful access and
control of the mixing process.

SDL_mixer can also be used for decoding audio files without actually
rendering a mix. This is done with MIX_AudioDecoder. Even though SDL_mixer
handles decoding transparently when used as the audio engine for an app,
and probably won't need this interface in that normal scenario, this can be
useful when using a different audio library to access many file formats.

This library offers several features on top of mixing sounds together: a
track can have its own gain, to adjust its volume, in addition to a master
gain applied as well. One can set the "frequency ratio" of a track, to
speed it up or slow it down, which also adjusts its pitch. A channel map
can also be applied per-track, to change what speaker a given channel of
audio is output to.

Almost all timing in SDL_mixer is in _sample frames_. Stereo PCM audio data
in Sint16 format takes 4 bytes per sample frame (2 bytes per sample times 2
channels), for example. This allows everything in SDL_mixer to run at
sample-perfect accuracy, and it lets it run without concern for wall clock
time--you can produce audio faster than real-time, if desired. The problem,
though, is different pieces of audio at different _sample rates_ will
produce a different number of sample frames for the same length of time. To
deal with this, conversion routines are offered: MIX_TrackMSToFrames(),
MIX_TrackFramesToMS(), etc. Functions that operate on multiple tracks at
once will deal with time in milliseconds, so it can do these conversions
internally; be sure to read the documentation for these small quirks!

SDL_mixer offers basic positional audio: a simple 3D positioning API
through MIX_SetTrack3DPosition() and MIX_SetTrackStereo(). The former will
do simple distance attenuation and spatialization--on a stereo setup, you
will hear sounds move from left to right--and on a surround-sound
configuration, individual tracks can move around the user. The latter,
MIX_SetTrackStereo(), will force a sound to the Front Left and Front Right
speakers and let the app pan it left and right as desired. Either effect
can be useful for different situations. SDL_mixer is not meant to be a full
3D audio engine, but rather Good Enough for many purposes; if something
more powerful in terms of 3D audio is needed, consider a proper 3D library
like OpenAL.
