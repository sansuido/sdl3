// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Gets the current value of the system realtime clock in nanoseconds since
/// Jan 1, 1970 in Universal Coordinated Time (UTC).
///
/// \param ticks the SDL_Time to hold the returned tick count
/// \returns 0 on success or -1 on error; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetCurrentTime(SDL_Time *ticks)
/// ```
int sdlGetCurrentTime(Pointer<Int64> ticks) {
  final sdlGetCurrentTimeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Int64> ticks),
      int Function(Pointer<Int64> ticks)>('SDL_GetCurrentTime');
  return sdlGetCurrentTimeLookupFunction(ticks);
}

///
/// Converts an SDL_Time in nanoseconds since the epoch to a calendar time in
/// the SDL_DateTime format.
///
/// \param ticks the SDL_Time to be converted
/// \param dt the resulting SDL_DateTime
/// \param localTime the resulting SDL_DateTime will be expressed in local time
/// if true, otherwise it will be in Universal Coordinated
/// Time (UTC)
/// \returns 0 on success or -1 on error; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_TimeToDateTime(SDL_Time ticks, SDL_DateTime *dt, SDL_bool localTime)
/// ```
int sdlTimeToDateTime(int ticks, Pointer<SdlDateTime> dt, bool localTime) {
  final sdlTimeToDateTimeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int64 ticks, Pointer<SdlDateTime> dt, Int32 localTime),
      int Function(int ticks, Pointer<SdlDateTime> dt,
          int localTime)>('SDL_TimeToDateTime');
  return sdlTimeToDateTimeLookupFunction(ticks, dt, localTime ? 1 : 0);
}

///
/// Converts a calendar time to an SDL_Time in nanoseconds since the epoch.
///
/// This function ignores the day_of_week member of the SDL_DateTime struct, so
/// it may remain unset.
///
/// \param dt the source SDL_DateTime
/// \param ticks the resulting SDL_Time
/// \returns 0 on success or -1 on error; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_DateTimeToTime(const SDL_DateTime *dt, SDL_Time *ticks)
/// ```
int sdlDateTimeToTime(Pointer<SdlDateTime> dt, Pointer<Int64> ticks) {
  final sdlDateTimeToTimeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlDateTime> dt, Pointer<Int64> ticks),
      int Function(
          Pointer<SdlDateTime> dt, Pointer<Int64> ticks)>('SDL_DateTimeToTime');
  return sdlDateTimeToTimeLookupFunction(dt, ticks);
}

///
/// Converts an SDL time into a Windows FILETIME (100-nanosecond intervals
/// since January 1, 1601).
///
/// This function fills in the two 32-bit values of the FILETIME structure.
///
/// \param ticks the time to convert
/// \param dwLowDateTime a pointer filled in with the low portion of the
/// Windows FILETIME value
/// \param dwHighDateTime a pointer filled in with the high portion of the
/// Windows FILETIME value
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_TimeToWindows(SDL_Time ticks, Uint32 *dwLowDateTime, Uint32 *dwHighDateTime)
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
/// 1601) to an SDL time
///
/// This function takes the two 32-bit values of the FILETIME structure as
/// parameters.
///
/// \param dwLowDateTime the low portion of the Windows FILETIME value
/// \param dwHighDateTime the high portion of the Windows FILETIME value
/// \returns the converted SDL time
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_Time SDLCALL SDL_TimeFromWindows(Uint32 dwLowDateTime, Uint32 dwHighDateTime)
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
/// \param year the year
/// \param month the month [1-12]
/// \returns the number of days in the requested month, otherwise -1; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetDaysInMonth(int year, int month)
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
/// \param year the year component of the date
/// \param month the month component of the date
/// \param day the day component of the date
/// \returns the day of year [0-365] if the date is valid, otherwise -1; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetDayOfYear(int year, int month, int day)
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
/// \param year the year component of the date
/// \param month the month component of the date
/// \param day the day component of the date
/// \returns a value between 0 and 6 (0 being Sunday) if the date is valid,
/// otherwise -1; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetDayOfWeek(int year, int month, int day)
/// ```
int sdlGetDayOfWeek(int year, int month, int day) {
  final sdlGetDayOfWeekLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 year, Int32 month, Int32 day),
      int Function(int year, int month, int day)>('SDL_GetDayOfWeek');
  return sdlGetDayOfWeekLookupFunction(year, month, day);
}
