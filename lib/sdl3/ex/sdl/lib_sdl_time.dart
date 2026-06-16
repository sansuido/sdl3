part of '../../sdl.dart';

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
/// {@category time}
bool sdlxGetDateTimeLocalePreferences(SdlxDateTimeLocale dateTime) {
  final dateFormatPointer = ffi.calloc<Int32>();
  final timeFormatPointer = ffi.calloc<Int32>();
  final result = sdlGetDateTimeLocalePreferences(
    dateFormatPointer,
    timeFormatPointer,
  );
  if (result) {
    dateTime
      ..dateFormat = dateFormatPointer.value
      ..timeFormat = timeFormatPointer.value;
  }
  dateFormatPointer.callocFree();
  timeFormatPointer.callocFree();
  return result;
}

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
/// {@category time}
int? sdlxGetCurrentTime() {
  int? result;
  final ticksPointer = ffi.calloc<Int64>();
  final bl = sdlGetCurrentTime(ticksPointer);
  if (bl) {
    result = ticksPointer.value;
  }
  ticksPointer.callocFree();
  return result;
}

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
/// {@category time}
bool sdlxTimeToDateTime(
  int ticks,
  SdlxDateTime dateTime, {
  bool localTime = false,
}) {
  final dateTimePointer = dateTime.calloc();
  final result = sdlTimeToDateTime(ticks, dateTimePointer, localTime);
  if (result) {
    dateTime.loadFromPointer(dateTimePointer);
  }
  dateTimePointer.callocFree();
  return result;
}

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
/// {@category time}
int? sdlxDateTimeToTime(SdlxDateTime dateTime) {
  int? result;
  final dateTimePointer = dateTime.calloc();
  final ticksPointer = ffi.calloc<Int64>();
  final bl = sdlDateTimeToTime(dateTimePointer, ticksPointer);
  if (bl) {
    result = ticksPointer.value;
  }
  dateTimePointer.callocFree();
  ticksPointer.callocFree();
  return result;
}

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
/// {@category time}
void sdlxTimeToWindows(int ticks, SdlxDateTimeWindows dateTime) {
  final dwLowDateTimePointer = ffi.calloc<Uint32>();
  final dwHighDateTimePointer = ffi.calloc<Uint32>();
  sdlTimeToWindows(ticks, dwLowDateTimePointer, dwHighDateTimePointer);
  dateTime
    ..dwLowDateTime = dwLowDateTimePointer.value
    ..dwHighDateTime = dwHighDateTimePointer.value;
  dwLowDateTimePointer.callocFree();
  dwHighDateTimePointer.callocFree();
}

///
/// Converts a Windows FILETIME (100-nanosecond intervals since January 1,
/// 1601) to an SDL time.
///
/// This function takes the two 32-bit values of the FILETIME structure as
/// parameters.
///
/// \param dwLowDateTime the low portion of the Windows FILETIME value.
/// \param dwHighDateTime the high portion of the Windows FILETIME value.
/// \returns the converted SDL time.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Time SDLCALL SDL_TimeFromWindows(Uint32 dwLowDateTime, Uint32 dwHighDateTime)
/// ```
/// {@category time}
int sdlxTimeFromWindows(SdlxDateTimeWindows dateTime) =>
    sdlTimeFromWindows(dateTime.dwLowDateTime, dateTime.dwHighDateTime);
