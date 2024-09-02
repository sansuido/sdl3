// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

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
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetDateTimeLocalePreferences(SDL_DateFormat *dateFormat, SDL_TimeFormat *timeFormat)
/// ```
bool sdlGetDateTimeLocalePreferences(
    Pointer<Int32> dateFormat, Pointer<Int32> timeFormat) {
  final sdlGetDateTimeLocalePreferencesLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Int32> dateFormat, Pointer<Int32> timeFormat),
      int Function(Pointer<Int32> dateFormat,
          Pointer<Int32> timeFormat)>('SDL_GetDateTimeLocalePreferences');
  return sdlGetDateTimeLocalePreferencesLookupFunction(
          dateFormat, timeFormat) ==
      1;
}

///
/// Gets the current value of the system realtime clock in nanoseconds since
/// Jan 1, 1970 in Universal Coordinated Time (UTC).
///
/// \param ticks the SDL_Time to hold the returned tick count.
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetCurrentTime(SDL_Time *ticks)
/// ```
bool sdlGetCurrentTime(Pointer<Int64> ticks) {
  final sdlGetCurrentTimeLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Int64> ticks),
      int Function(Pointer<Int64> ticks)>('SDL_GetCurrentTime');
  return sdlGetCurrentTimeLookupFunction(ticks) == 1;
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
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_TimeToDateTime(SDL_Time ticks, SDL_DateTime *dt, SDL_bool localTime)
/// ```
bool sdlTimeToDateTime(int ticks, Pointer<SdlDateTime> dt, bool localTime) {
  final sdlTimeToDateTimeLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Int64 ticks, Pointer<SdlDateTime> dt, Uint8 localTime),
      int Function(int ticks, Pointer<SdlDateTime> dt,
          int localTime)>('SDL_TimeToDateTime');
  return sdlTimeToDateTimeLookupFunction(ticks, dt, localTime ? 1 : 0) == 1;
}

///
/// Converts a calendar time to an SDL_Time in nanoseconds since the epoch.
///
/// This function ignores the day_of_week member of the SDL_DateTime struct, so
/// it may remain unset.
///
/// \param dt the source SDL_DateTime.
/// \param ticks the resulting SDL_Time.
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_DateTimeToTime(const SDL_DateTime *dt, SDL_Time *ticks)
/// ```
bool sdlDateTimeToTime(Pointer<SdlDateTime> dt, Pointer<Int64> ticks) {
  final sdlDateTimeToTimeLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlDateTime> dt, Pointer<Int64> ticks),
      int Function(
          Pointer<SdlDateTime> dt, Pointer<Int64> ticks)>('SDL_DateTimeToTime');
  return sdlDateTimeToTimeLookupFunction(dt, ticks) == 1;
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
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_TimeToWindows(SDL_Time ticks, Uint32 *dwLowDateTime, Uint32 *dwHighDateTime)
/// ```
void sdlTimeToWindows(
    int ticks, Pointer<Uint32> dwLowDateTime, Pointer<Uint32> dwHighDateTime) {
  final sdlTimeToWindowsLookupFunction = libSdl3.lookupFunction<
      Void Function(Int64 ticks, Pointer<Uint32> dwLowDateTime,
          Pointer<Uint32> dwHighDateTime),
      void Function(int ticks, Pointer<Uint32> dwLowDateTime,
          Pointer<Uint32> dwHighDateTime)>('SDL_TimeToWindows');
  return sdlTimeToWindowsLookupFunction(ticks, dwLowDateTime, dwHighDateTime);
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
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Time SDLCALL SDL_TimeFromWindows(Uint32 dwLowDateTime, Uint32 dwHighDateTime)
/// ```
int sdlTimeFromWindows(int dwLowDateTime, int dwHighDateTime) {
  final sdlTimeFromWindowsLookupFunction = libSdl3.lookupFunction<
      Int64 Function(Uint32 dwLowDateTime, Uint32 dwHighDateTime),
      int Function(
          int dwLowDateTime, int dwHighDateTime)>('SDL_TimeFromWindows');
  return sdlTimeFromWindowsLookupFunction(dwLowDateTime, dwHighDateTime);
}

///
/// Get the number of days in a month for a given year.
///
/// \param year the year.
/// \param month the month [1-12].
/// \returns the number of days in the requested month or -1 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetDaysInMonth(int year, int month)
/// ```
int sdlGetDaysInMonth(int year, int month) {
  final sdlGetDaysInMonthLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 year, Int32 month),
      int Function(int year, int month)>('SDL_GetDaysInMonth');
  return sdlGetDaysInMonthLookupFunction(year, month);
}

///
/// Get the day of year for a calendar date.
///
/// \param year the year component of the date.
/// \param month the month component of the date.
/// \param day the day component of the date.
/// \returns the day of year [0-365] if the date is valid or -1 on failure;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetDayOfYear(int year, int month, int day)
/// ```
int sdlGetDayOfYear(int year, int month, int day) {
  final sdlGetDayOfYearLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 year, Int32 month, Int32 day),
      int Function(int year, int month, int day)>('SDL_GetDayOfYear');
  return sdlGetDayOfYearLookupFunction(year, month, day);
}

///
/// Get the day of week for a calendar date.
///
/// \param year the year component of the date.
/// \param month the month component of the date.
/// \param day the day component of the date.
/// \returns a value between 0 and 6 (0 being Sunday) if the date is valid or
/// -1 on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetDayOfWeek(int year, int month, int day)
/// ```
int sdlGetDayOfWeek(int year, int month, int day) {
  final sdlGetDayOfWeekLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 year, Int32 month, Int32 day),
      int Function(int year, int month, int day)>('SDL_GetDayOfWeek');
  return sdlGetDayOfWeekLookupFunction(year, month, day);
}
