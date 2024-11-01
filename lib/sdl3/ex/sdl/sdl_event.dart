import 'dart:ffi';
import '../../generated/struct_sdl.dart';
import '../../generated/lib_sdl_events.dart';

extension SdlEventEx on SdlEvent {
  // lib_sdl_events.dart

  ///
  /// Pump the event loop, gathering events from the input devices.
  ///
  /// This function updates the event queue and internal input device state.
  ///
  /// SDL_PumpEvents() gathers all the pending input information from devices and
  /// places it in the event queue. Without calls to SDL_PumpEvents() no events
  /// would ever be placed on the queue. Often the need for calls to
  /// SDL_PumpEvents() is hidden from the user since SDL_PollEvent() and
  /// SDL_WaitEvent() implicitly call SDL_PumpEvents(). However, if you are not
  /// polling or waiting for events (e.g. you are filtering them), then you must
  /// call SDL_PumpEvents() to force an event queue update.
  ///
  /// \threadsafety This should only be run in the thread that initialized the
  /// video subsystem, and for extra safety, you should consider
  /// only doing those things on the main thread in any case.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_PollEvent
  /// \sa SDL_WaitEvent
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_PumpEvents(void)
  /// ```
  static void pumps() {
    sdlPumpEvents();
  }

  ///
  /// Check for the existence of a certain event type in the event queue.
  ///
  /// If you need to check for a range of event types, use SDL_HasEvents()
  /// instead.
  ///
  /// \param type the type of event to be queried; see SDL_EventType for details.
  /// \returns true if events matching `type` are present, or false if events
  /// matching `type` are not present.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_HasEvents
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_HasEvent(Uint32 type)
  /// ```
  static bool have(int type) {
    return sdlHasEvent(type);
  }

  ///
  /// Check for the existence of certain event types in the event queue.
  ///
  /// If you need to check for a single event type, use SDL_HasEvent() instead.
  ///
  /// \param minType the low end of event type to be queried, inclusive; see
  /// SDL_EventType for details.
  /// \param maxType the high end of event type to be queried, inclusive; see
  /// SDL_EventType for details.
  /// \returns true if events with type >= `minType` and <= `maxType` are
  /// present, or false if not.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_HasEvents
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_HasEvents(Uint32 minType, Uint32 maxType)
  /// ```
  static bool has(int minType, int maxType) {
    return sdlHasEvents(minType, maxType);
  }

  ///
  /// Clear events of a specific type from the event queue.
  ///
  /// This will unconditionally remove any events from the queue that match
  /// `type`. If you need to remove a range of event types, use SDL_FlushEvents()
  /// instead.
  ///
  /// It's also normal to just ignore events you don't care about in your event
  /// loop without calling this function.
  ///
  /// This function only affects currently queued events. If you want to make
  /// sure that all pending OS events are flushed, you can call SDL_PumpEvents()
  /// on the main thread immediately before the flush call.
  ///
  /// If you have user events with custom data that needs to be freed, you should
  /// use SDL_PeepEvents() to remove and clean up those events before calling
  /// this function.
  ///
  /// \param type the type of event to be cleared; see SDL_EventType for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_FlushEvents
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_FlushEvent(Uint32 type)
  /// ```
  static void flush(int type) {
    sdlFlushEvent(type);
  }

  ///
  /// Clear events of a range of types from the event queue.
  ///
  /// This will unconditionally remove any events from the queue that are in the
  /// range of `minType` to `maxType`, inclusive. If you need to remove a single
  /// event type, use SDL_FlushEvent() instead.
  ///
  /// It's also normal to just ignore events you don't care about in your event
  /// loop without calling this function.
  ///
  /// This function only affects currently queued events. If you want to make
  /// sure that all pending OS events are flushed, you can call SDL_PumpEvents()
  /// on the main thread immediately before the flush call.
  ///
  /// \param minType the low end of event type to be cleared, inclusive; see
  /// SDL_EventType for details.
  /// \param maxType the high end of event type to be cleared, inclusive; see
  /// SDL_EventType for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_FlushEvent
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_FlushEvents(Uint32 minType, Uint32 maxType)
  /// ```
  static void flushs(int minType, int maxType) {
    sdlFlushEvents(minType, maxType);
  }
}

extension SdlEventPointerEx on Pointer<SdlEvent> {
  // lib_sdl_event.dart

  // sdlPumpEvents

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
  /// \param action action to take; see [[#action|Remarks]] for details.
  /// \param minType minimum value of the event type to be considered;
  /// SDL_EVENT_FIRST is a safe choice.
  /// \param maxType maximum value of the event type to be considered;
  /// SDL_EVENT_LAST is a safe choice.
  /// \returns the number of events actually stored or -1 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_PollEvent
  /// \sa SDL_PumpEvents
  /// \sa SDL_PushEvent
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL SDL_PeepEvents(SDL_Event *events, int numevents, SDL_EventAction action, Uint32 minType, Uint32 maxType)
  /// ```
  int peeps(int numevents, int action, int minType, int maxType) {
    return sdlPeepEvents(this, numevents, action, minType, maxType);
  }

  ///
  /// Poll for currently pending events.
  ///
  /// If `event` is not NULL, the next event is removed from the queue and stored
  /// in the SDL_Event structure pointed to by `event`. The 1 returned refers to
  /// this event, immediately stored in the SDL Event structure -- not an event
  /// to follow.
  ///
  /// If `event` is NULL, it simply returns 1 if there is an event in the queue,
  /// but will not remove it from the queue.
  ///
  /// As this function may implicitly call SDL_PumpEvents(), you can only call
  /// this function in the thread that set the video mode.
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
  /// \param event the SDL_Event structure to be filled with the next event from
  /// the queue, or NULL.
  /// \returns true if this got an event or false if there are none available.
  ///
  /// \threadsafety This should only be run in the thread that initialized the
  /// video subsystem, and for extra safety, you should consider
  /// only doing those things on the main thread in any case.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_PushEvent
  /// \sa SDL_WaitEvent
  /// \sa SDL_WaitEventTimeout
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_PollEvent(SDL_Event *event)
  /// ```
  bool poll() {
    return sdlPollEvent(this);
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
  /// \threadsafety This should only be run in the thread that initialized the
  /// video subsystem, and for extra safety, you should consider
  /// only doing those things on the main thread in any case.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_PollEvent
  /// \sa SDL_PushEvent
  /// \sa SDL_WaitEventTimeout
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_WaitEvent(SDL_Event *event)
  /// ```
  bool wait() {
    return sdlWaitEvent(this);
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
  /// available event.
  /// \returns true if this got an event or false if the timeout elapsed without
  /// any events available.
  ///
  /// \threadsafety This should only be run in the thread that initialized the
  /// video subsystem, and for extra safety, you should consider
  /// only doing those things on the main thread in any case.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_PollEvent
  /// \sa SDL_PushEvent
  /// \sa SDL_WaitEvent
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_WaitEventTimeout(SDL_Event *event, Sint32 timeoutMS)
  /// ```
  bool waitTimeout(int timeout) {
    return sdlWaitEventTimeout(this, timeout);
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
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_PeepEvents
  /// \sa SDL_PollEvent
  /// \sa SDL_RegisterEvents
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_PushEvent(SDL_Event *event)
  /// ```
  bool push() {
    return sdlPushEvent(this);
  }

  // sdlSetEventFilter
  // sdlGetEventFilter
  // sdlAddEventWatch
  // sdlDelEventWatch
  // sdlFilterEvents
  // sdlEventState
  // sdlRegisterEvents
}
