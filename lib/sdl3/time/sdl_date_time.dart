part of '../sdl_time.dart';

class SdlxDateTime {
  const SdlxDateTime({
    this.year = 0,
    this.month = 0,
    this.day = 0,
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
    this.nanosecond = 0,
    this.dayOfWeek = 0,
    this.utcOffset = 0,
  });

  factory SdlxDateTime.fromPointer(Pointer<SdlDateTime> pointer) =>
      SdlxDateTime(
        year: pointer.ref.year,
        month: pointer.ref.month,
        day: pointer.ref.day,
        hour: pointer.ref.hour,
        minute: pointer.ref.minute,
        second: pointer.ref.second,
        nanosecond: pointer.ref.nanosecond,
        dayOfWeek: pointer.ref.dayOfWeek,
        utcOffset: pointer.ref.utcOffset,
      );

  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int second;
  final int nanosecond;
  final int dayOfWeek;
  final int utcOffset;

  Pointer<SdlDateTime> calloc() {
    final pointer = ffi.calloc<SdlDateTime>();
    pointer.ref.year = year;
    pointer.ref.month = month;
    pointer.ref.day = day;
    pointer.ref.hour = hour;
    pointer.ref.minute = minute;
    pointer.ref.second = second;
    pointer.ref.nanosecond = nanosecond;
    pointer.ref.dayOfWeek = dayOfWeek;
    pointer.ref.utcOffset = utcOffset;
    return pointer;
  }
}
