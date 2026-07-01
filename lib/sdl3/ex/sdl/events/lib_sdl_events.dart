part of '../../../sdl.dart';

///
/// Check the event queue for messages and optionally return them.
///
/// `action` may be any of the following:
///
/// - `SDL_ADDEVENT`: up to `numevents` events will be added to the back of the
/// event queue.
/// - `SDL_PEEKEVENT`: `numevents` events at the front of the event queue,
/// within the specified minimum and maximum type, will be returned to the
/// caller and will _not_ be removed from the queue. If you pass NULL for
/// `events`, then `numevents` is ignored and the total number of matching
/// events will be returned.
/// - `SDL_GETEVENT`: up to `numevents` events at the front of the event queue,
/// within the specified minimum and maximum type, will be returned to the
/// caller and will be removed from the queue.
///
/// You may have to call SDL_PumpEvents() before calling this function.
/// Otherwise, the events may not be ready to be filtered when you call
/// SDL_PeepEvents().
///
/// \param events destination buffer for the retrieved events, may be NULL to
/// leave the events in the queue and return the number of events
/// that would have been stored.
/// \param numevents if action is SDL_ADDEVENT, the number of events to add
/// back to the event queue; if action is SDL_PEEKEVENT or
/// SDL_GETEVENT, the maximum number of events to retrieve.
/// \param action action to take; see [Remarks](#remarks) for details.
/// \param minType minimum value of the event type to be considered;
/// SDL_EVENT_FIRST is a safe choice.
/// \param maxType maximum value of the event type to be considered;
/// SDL_EVENT_LAST is a safe choice.
/// \returns the number of events actually stored or -1 on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PollEvent
/// \sa SDL_PumpEvents
/// \sa SDL_PushEvent
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_PeepEvents(SDL_Event *events, int numevents, SDL_EventAction action, Uint32 minType, Uint32 maxType)
/// ```
/// {@category events}
List<SdlxEvent> sdlxPeepEvents(
  int numevents,
  int action,
  int minType,
  int maxType,
) {
  final results = <SdlxEvent>[];
  final pointers = calloc<SdlEvent>(numevents);
  final length = sdlPeepEvents(pointers, numevents, action, minType, maxType);
  if (length > 0) {
    for (var i = 0; i < length; i++) {
      final pointer = pointers + i;
      results.add(SdlxEvent.fromPointer(pointer));
    }
  }
  calloc.free(pointers);
  return results;
}

///
/// Poll for currently pending events.
///
/// If `event` is not NULL, the next event is removed from the queue and stored
/// in the SDL_Event structure pointed to by `event`.
///
/// If `event` is NULL, it simply returns true if there is an event in the
/// queue, but will not remove it from the queue.
///
/// As this function may implicitly call SDL_PumpEvents(), you can only call
/// this function in the thread that initialized the video subsystem.
///
/// SDL_PollEvent() is the favored way of receiving system events since it can
/// be done from the main loop and does not suspend the main loop while waiting
/// on an event to be posted.
///
/// The common practice is to fully process the event queue once every frame,
/// usually as a first step before updating the game's state:
///
/// ```c
/// while (game_is_still_running) {
/// SDL_Event event;
/// while (SDL_PollEvent(&event)) {  // poll until all events are handled!
/// // decide what to do with this event.
/// }
///
/// // update game state, draw the current frame
/// }
/// ```
///
/// Note that Windows (and possibly other platforms) has a quirk about how it
/// handles events while dragging/resizing a window, which can cause this
/// function to block for significant amounts of time. Technical explanations
/// and solutions are discussed on the wiki:
///
/// https://wiki.libsdl.org/SDL3/AppFreezeDuringDrag
///
/// \param event the SDL_Event structure to be filled with the next event from
/// the queue, or NULL.
/// \returns true if this got an event or false if there are none available.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PushEvent
/// \sa SDL_WaitEvent
/// \sa SDL_WaitEventTimeout
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_PollEvent(SDL_Event *event)
/// ```
/// {@category events}
SdlxEvent? sdlxPollEvent() {
  SdlxEvent? result;
  final pointer = calloc<SdlEvent>();
  final bl = sdlPollEvent(pointer);
  if (bl) {
    result = SdlxEvent.fromPointer(pointer);
  }
  calloc.free(pointer);
  return result;
}

///
/// Wait indefinitely for the next available event.
///
/// If `event` is not NULL, the next event is removed from the queue and stored
/// in the SDL_Event structure pointed to by `event`.
///
/// As this function may implicitly call SDL_PumpEvents(), you can only call
/// this function in the thread that initialized the video subsystem.
///
/// \param event the SDL_Event structure to be filled in with the next event
/// from the queue, or NULL.
/// \returns true on success or false if there was an error while waiting for
/// events; call SDL_GetError() for more information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PollEvent
/// \sa SDL_PushEvent
/// \sa SDL_WaitEventTimeout
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WaitEvent(SDL_Event *event)
/// ```
/// {@category events}
SdlxEvent? sdlxWaitEvent() {
  SdlxEvent? result;
  final pointer = calloc<SdlEvent>();
  final bl = sdlWaitEvent(pointer);
  if (bl) {
    result = SdlxEvent.fromPointer(pointer);
  }
  calloc.free(pointer);
  return result;
}

///
/// Wait until the specified timeout (in milliseconds) for the next available
/// event.
///
/// If `event` is not NULL, the next event is removed from the queue and stored
/// in the SDL_Event structure pointed to by `event`.
///
/// As this function may implicitly call SDL_PumpEvents(), you can only call
/// this function in the thread that initialized the video subsystem.
///
/// The timeout is not guaranteed, the actual wait time could be longer due to
/// system scheduling.
///
/// \param event the SDL_Event structure to be filled in with the next event
/// from the queue, or NULL.
/// \param timeoutMS the maximum number of milliseconds to wait for the next
/// available event, or -1 to wait indefinitely.
/// \returns true if this got an event or false if the timeout elapsed without
/// any events available.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PollEvent
/// \sa SDL_PushEvent
/// \sa SDL_WaitEvent
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WaitEventTimeout(SDL_Event *event, Sint32 timeoutMS)
/// ```
/// {@category events}
SdlxEvent? sdlxWaitEventTimeout(int timeout) {
  SdlxEvent? result;
  final pointer = calloc<SdlEvent>();
  final bl = sdlWaitEventTimeout(pointer, timeout);
  if (bl) {
    result = SdlxEvent.fromPointer(pointer);
  }
  calloc.free(pointer);
  return result;
}

///
/// Add an event to the event queue.
///
/// The event queue can actually be used as a two way communication channel.
/// Not only can events be read from the queue, but the user can also push
/// their own events onto it. `event` is a pointer to the event structure you
/// wish to push onto the queue. The event is copied into the queue, and the
/// caller may dispose of the memory pointed to after SDL_PushEvent() returns.
///
/// Note: Pushing device input events onto the queue doesn't modify the state
/// of the device within SDL.
///
/// Note: Events pushed onto the queue with SDL_PushEvent() get passed through
/// the event filter but events added with SDL_PeepEvents() do not.
///
/// For pushing application-specific events, please use SDL_RegisterEvents() to
/// get an event type that does not conflict with other code that also wants
/// its own custom event types.
///
/// \param event the SDL_Event to be added to the queue.
/// \returns true on success, false if the event was filtered or on failure;
/// call SDL_GetError() for more information. A common reason for
/// error is the event queue being full.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PeepEvents
/// \sa SDL_PollEvent
/// \sa SDL_RegisterEvents
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_PushEvent(SDL_Event *event)
/// ```
/// {@category events}
bool sdlxPushEvent(SdlxEvent event) {
  final eventPointer = event.calloc();
  final result = sdlPushEvent(eventPointer);
  eventPointer.callocAllFree();
  return result;
}
