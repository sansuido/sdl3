// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

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
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PollEvent
/// \sa SDL_WaitEvent
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_PumpEvents(void)
/// ```
void sdlPumpEvents() {
  final sdlPumpEventsLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_PumpEvents');
  return sdlPumpEventsLookupFunction();
}

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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PollEvent
/// \sa SDL_PumpEvents
/// \sa SDL_PushEvent
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_PeepEvents(SDL_Event *events, int numevents, SDL_EventAction action, Uint32 minType, Uint32 maxType)
/// ```
int sdlPeepEvents(Pointer<SdlEvent> events, int numevents, int action,
    int minType, int maxType) {
  final sdlPeepEventsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlEvent> events, Int32 numevents, Int32 action,
          Uint32 minType, Uint32 maxType),
      int Function(Pointer<SdlEvent> events, int numevents, int action,
          int minType, int maxType)>('SDL_PeepEvents');
  return sdlPeepEventsLookupFunction(
      events, numevents, action, minType, maxType);
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasEvents
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasEvent(Uint32 type)
/// ```
bool sdlHasEvent(int type) {
  final sdlHasEventLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Uint32 type), int Function(int type)>('SDL_HasEvent');
  return sdlHasEventLookupFunction(type) == 1;
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasEvents
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasEvents(Uint32 minType, Uint32 maxType)
/// ```
bool sdlHasEvents(int minType, int maxType) {
  final sdlHasEventsLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Uint32 minType, Uint32 maxType),
      int Function(int minType, int maxType)>('SDL_HasEvents');
  return sdlHasEventsLookupFunction(minType, maxType) == 1;
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_FlushEvents
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_FlushEvent(Uint32 type)
/// ```
void sdlFlushEvent(int type) {
  final sdlFlushEventLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint32 type), void Function(int type)>('SDL_FlushEvent');
  return sdlFlushEventLookupFunction(type);
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_FlushEvent
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_FlushEvents(Uint32 minType, Uint32 maxType)
/// ```
void sdlFlushEvents(int minType, int maxType) {
  final sdlFlushEventsLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint32 minType, Uint32 maxType),
      void Function(int minType, int maxType)>('SDL_FlushEvents');
  return sdlFlushEventsLookupFunction(minType, maxType);
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
bool sdlPollEvent(Pointer<SdlEvent> event) {
  final sdlPollEventLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlEvent> event),
      int Function(Pointer<SdlEvent> event)>('SDL_PollEvent');
  return sdlPollEventLookupFunction(event) == 1;
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
bool sdlWaitEvent(Pointer<SdlEvent> event) {
  final sdlWaitEventLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlEvent> event),
      int Function(Pointer<SdlEvent> event)>('SDL_WaitEvent');
  return sdlWaitEventLookupFunction(event) == 1;
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
bool sdlWaitEventTimeout(Pointer<SdlEvent> event, int timeoutMs) {
  final sdlWaitEventTimeoutLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlEvent> event, Int32 timeoutMs),
      int Function(
          Pointer<SdlEvent> event, int timeoutMs)>('SDL_WaitEventTimeout');
  return sdlWaitEventTimeoutLookupFunction(event, timeoutMs) == 1;
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
bool sdlPushEvent(Pointer<SdlEvent> event) {
  final sdlPushEventLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlEvent> event),
      int Function(Pointer<SdlEvent> event)>('SDL_PushEvent');
  return sdlPushEventLookupFunction(event) == 1;
}

///
/// Set up a filter to process all events before they are added to the internal
/// event queue.
///
/// If you just want to see events without modifying them or preventing them
/// from being queued, you should use SDL_AddEventWatch() instead.
///
/// If the filter function returns true when called, then the event will be
/// added to the internal queue. If it returns false, then the event will be
/// dropped from the queue, but the internal state will still be updated. This
/// allows selective filtering of dynamically arriving events.
///
/// **WARNING**: Be very careful of what you do in the event filter function,
/// as it may run in a different thread!
///
/// On platforms that support it, if the quit event is generated by an
/// interrupt signal (e.g. pressing Ctrl-C), it will be delivered to the
/// application at the next event poll.
///
/// Note: Disabled events never make it to the event filter function; see
/// SDL_SetEventEnabled().
///
/// Note: Events pushed onto the queue with SDL_PushEvent() get passed through
/// the event filter, but events pushed onto the queue with SDL_PeepEvents() do
/// not.
///
/// \param filter an SDL_EventFilter function to call when an event happens.
/// \param userdata a pointer that is passed to `filter`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AddEventWatch
/// \sa SDL_SetEventEnabled
/// \sa SDL_GetEventFilter
/// \sa SDL_PeepEvents
/// \sa SDL_PushEvent
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetEventFilter(SDL_EventFilter filter, void *userdata)
/// ```
void sdlSetEventFilter(Pointer<NativeFunction<SdlEventFilter>> filter,
    Pointer<NativeType> userdata) {
  final sdlSetEventFilterLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeFunction<SdlEventFilter>> filter,
          Pointer<NativeType> userdata),
      void Function(Pointer<NativeFunction<SdlEventFilter>> filter,
          Pointer<NativeType> userdata)>('SDL_SetEventFilter');
  return sdlSetEventFilterLookupFunction(filter, userdata);
}

///
/// Query the current event filter.
///
/// This function can be used to "chain" filters, by saving the existing filter
/// before replacing it with a function that will call that saved filter.
///
/// \param filter the current callback function will be stored here.
/// \param userdata the pointer that is passed to the current event filter will
/// be stored here.
/// \returns true on success or false if there is no event filter set.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetEventFilter
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetEventFilter(SDL_EventFilter *filter, void **userdata)
/// ```
bool sdlGetEventFilter(Pointer<Pointer<NativeFunction<SdlEventFilter>>> filter,
    Pointer<Pointer<NativeType>> userdata) {
  final sdlGetEventFilterLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Pointer<NativeFunction<SdlEventFilter>>> filter,
          Pointer<Pointer<NativeType>> userdata),
      int Function(Pointer<Pointer<NativeFunction<SdlEventFilter>>> filter,
          Pointer<Pointer<NativeType>> userdata)>('SDL_GetEventFilter');
  return sdlGetEventFilterLookupFunction(filter, userdata) == 1;
}

///
/// Add a callback to be triggered when an event is added to the event queue.
///
/// `filter` will be called when an event happens, and its return value is
/// ignored.
///
/// **WARNING**: Be very careful of what you do in the event filter function,
/// as it may run in a different thread!
///
/// If the quit event is generated by a signal (e.g. SIGINT), it will bypass
/// the internal queue and be delivered to the watch callback immediately, and
/// arrive at the next event poll.
///
/// Note: the callback is called for events posted by the user through
/// SDL_PushEvent(), but not for disabled events, nor for events by a filter
/// callback set with SDL_SetEventFilter(), nor for events posted by the user
/// through SDL_PeepEvents().
///
/// \param filter an SDL_EventFilter function to call when an event happens.
/// \param userdata a pointer that is passed to `filter`.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RemoveEventWatch
/// \sa SDL_SetEventFilter
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_AddEventWatch(SDL_EventFilter filter, void *userdata)
/// ```
bool sdlAddEventWatch(Pointer<NativeFunction<SdlEventFilter>> filter,
    Pointer<NativeType> userdata) {
  final sdlAddEventWatchLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<NativeFunction<SdlEventFilter>> filter,
          Pointer<NativeType> userdata),
      int Function(Pointer<NativeFunction<SdlEventFilter>> filter,
          Pointer<NativeType> userdata)>('SDL_AddEventWatch');
  return sdlAddEventWatchLookupFunction(filter, userdata) == 1;
}

///
/// Remove an event watch callback added with SDL_AddEventWatch().
///
/// This function takes the same input as SDL_AddEventWatch() to identify and
/// delete the corresponding callback.
///
/// \param filter the function originally passed to SDL_AddEventWatch().
/// \param userdata the pointer originally passed to SDL_AddEventWatch().
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AddEventWatch
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_RemoveEventWatch(SDL_EventFilter filter, void *userdata)
/// ```
void sdlRemoveEventWatch(Pointer<NativeFunction<SdlEventFilter>> filter,
    Pointer<NativeType> userdata) {
  final sdlRemoveEventWatchLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeFunction<SdlEventFilter>> filter,
          Pointer<NativeType> userdata),
      void Function(Pointer<NativeFunction<SdlEventFilter>> filter,
          Pointer<NativeType> userdata)>('SDL_RemoveEventWatch');
  return sdlRemoveEventWatchLookupFunction(filter, userdata);
}

///
/// Run a specific filter function on the current event queue, removing any
/// events for which the filter returns false.
///
/// See SDL_SetEventFilter() for more information. Unlike SDL_SetEventFilter(),
/// this function does not change the filter permanently, it only uses the
/// supplied filter until this function returns.
///
/// \param filter the SDL_EventFilter function to call when an event happens.
/// \param userdata a pointer that is passed to `filter`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetEventFilter
/// \sa SDL_SetEventFilter
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_FilterEvents(SDL_EventFilter filter, void *userdata)
/// ```
void sdlFilterEvents(Pointer<NativeFunction<SdlEventFilter>> filter,
    Pointer<NativeType> userdata) {
  final sdlFilterEventsLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeFunction<SdlEventFilter>> filter,
          Pointer<NativeType> userdata),
      void Function(Pointer<NativeFunction<SdlEventFilter>> filter,
          Pointer<NativeType> userdata)>('SDL_FilterEvents');
  return sdlFilterEventsLookupFunction(filter, userdata);
}

///
/// Set the state of processing events by type.
///
/// \param type the type of event; see SDL_EventType for details.
/// \param enabled whether to process the event or not.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_EventEnabled
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetEventEnabled(Uint32 type, bool enabled)
/// ```
void sdlSetEventEnabled(int type, bool enabled) {
  final sdlSetEventEnabledLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint32 type, Uint8 enabled),
      void Function(int type, int enabled)>('SDL_SetEventEnabled');
  return sdlSetEventEnabledLookupFunction(type, enabled ? 1 : 0);
}

///
/// Query the state of processing events by type.
///
/// \param type the type of event; see SDL_EventType for details.
/// \returns true if the event is being processed, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetEventEnabled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_EventEnabled(Uint32 type)
/// ```
bool sdlEventEnabled(int type) {
  final sdlEventEnabledLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Uint32 type), int Function(int type)>('SDL_EventEnabled');
  return sdlEventEnabledLookupFunction(type) == 1;
}

///
/// Allocate a set of user-defined events, and return the beginning event
/// number for that set of events.
///
/// \param numevents the number of events to be allocated.
/// \returns the beginning event number, or 0 if numevents is invalid or if
/// there are not enough user-defined events left.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PushEvent
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_RegisterEvents(int numevents)
/// ```
int sdlRegisterEvents(int numevents) {
  final sdlRegisterEventsLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Int32 numevents),
      int Function(int numevents)>('SDL_RegisterEvents');
  return sdlRegisterEventsLookupFunction(numevents);
}

///
/// Get window associated with an event.
///
/// \param event an event containing a `windowID`.
/// \returns the associated window on success or NULL if there is none.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PollEvent
/// \sa SDL_WaitEvent
/// \sa SDL_WaitEventTimeout
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window * SDLCALL SDL_GetWindowFromEvent(const SDL_Event *event)
/// ```
Pointer<SdlWindow> sdlGetWindowFromEvent(Pointer<SdlEvent> event) {
  final sdlGetWindowFromEventLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(Pointer<SdlEvent> event),
      Pointer<SdlWindow> Function(
          Pointer<SdlEvent> event)>('SDL_GetWindowFromEvent');
  return sdlGetWindowFromEventLookupFunction(event);
}
