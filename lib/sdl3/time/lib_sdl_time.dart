part of '../sdl_time.dart';

///
/// Gets the current preferred date and time format for the system locale.
///
/// This might be a "slow" call that has to query the operating system. It's
/// best to ask for this once and save the results. However, the preferred
/// formats can change, usually because the user has changed a system
/// preference outside of your program.
///
/// \param dateFormat a pointer to the SDL_DateFormat to hold the returned date
/// format, may be NULL.
/// \param timeFormat a pointer to the SDL_TimeFormat to hold the returned time
/// format, may be NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetDateTimeLocalePreferences(SDL_DateFormat *dateFormat, SDL_TimeFormat *timeFormat)
/// ```
///
/// See also:
/// - [SDL_GetDateTimeLocalePreferences - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetDateTimeLocalePreferences)
///
/// {@category time}
({int dateFromat, int timeFormat})? sdlxGetDateTimeLocalePreferences() =>
    ffi.using((arena) {
      final dateFormatPointer = arena<Int32>();
      final timeFormatPointer = arena<Int32>();

      if (!sdlGetDateTimeLocalePreferences(
        dateFormatPointer,
        timeFormatPointer,
      )) {
        return null;
      }

      return (
        dateFromat: dateFormatPointer.value,
        timeFormat: timeFormatPointer.value,
      );
    });

///
/// Gets the current value of the system realtime clock in nanoseconds since
/// Jan 1, 1970 in Universal Coordinated Time (UTC).
///
/// \param ticks the SDL_Time to hold the returned tick count.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetCurrentTime(SDL_Time *ticks)
/// ```
///
/// See also:
/// - [SDL_GetCurrentTime - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetCurrentTime)
///
/// {@category time}
int? sdlxGetCurrentTime() => ffi.using((arena) {
  final ticksPointer = arena<Int64>();
  if (!sdlGetCurrentTime(ticksPointer)) {
    return null;
  }
  return ticksPointer.value;
});

///
/// Converts an SDL_Time in nanoseconds since the epoch to a calendar time in
/// the SDL_DateTime format.
///
/// \param ticks the SDL_Time to be converted.
/// \param dt the resulting SDL_DateTime.
/// \param localTime the resulting SDL_DateTime will be expressed in local time
/// if true, otherwise it will be in Universal Coordinated
/// Time (UTC).
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_TimeToDateTime(SDL_Time ticks, SDL_DateTime *dt, bool localTime)
/// ```
///
/// See also:
/// - [SDL_TimeToDateTime - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_TimeToDateTime)
///
/// {@category time}
SdlxDateTime? sdlxTimeToDateTime(int ticks, {bool localTime = false}) =>
    ffi.using((arena) {
      final dateTimePointer = arena<SdlDateTime>();
      final success = sdlTimeToDateTime(ticks, dateTimePointer, localTime);

      if (!success) return null;

      return SdlxDateTime.fromPointer(dateTimePointer);
    });

///
/// Converts a calendar time to an SDL_Time in nanoseconds since the epoch.
///
/// This function ignores the day_of_week member of the SDL_DateTime struct, so
/// it may remain unset.
///
/// \param dt the source SDL_DateTime.
/// \param ticks the resulting SDL_Time.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_DateTimeToTime(const SDL_DateTime *dt, SDL_Time *ticks)
/// ```
///
/// See also:
/// - [SDL_DateTimeToTime - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_DateTimeToTime)
///
/// {@category time}
int? sdlxDateTimeToTime(SdlxDateTime dateTime) => ffi.using((arena) {
  final dateTimePointer = dateTime.toNative(arena);
  final ticksPointer = arena<Int64>();

  if (sdlDateTimeToTime(dateTimePointer, ticksPointer)) {
    return ticksPointer.value;
  }
  return null;
});

///
/// Converts an SDL time into a Windows FILETIME (100-nanosecond intervals
/// since January 1, 1601).
///
/// This function fills in the two 32-bit values of the FILETIME structure.
///
/// \param ticks the time to convert.
/// \param dwLowDateTime a pointer filled in with the low portion of the
/// Windows FILETIME value.
/// \param dwHighDateTime a pointer filled in with the high portion of the
/// Windows FILETIME value.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_TimeToWindows(SDL_Time ticks, Uint32 *dwLowDateTime, Uint32 *dwHighDateTime)
/// ```
///
/// See also:
/// - [SDL_TimeToWindows - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_TimeToWindows)
///
/// {@category time}
({int dwLowDateTime, int dwHighDateTime}) sdlxTimeToWindows(int ticks) =>
    ffi.using((arena) {
      final dwLowDateTimePointer = arena<Uint32>();
      final dwHighDateTimePointer = arena<Uint32>();

      sdlTimeToWindows(ticks, dwLowDateTimePointer, dwHighDateTimePointer);

      return (
        dwLowDateTime: dwLowDateTimePointer.value,
        dwHighDateTime: dwHighDateTimePointer.value,
      );
    });
