part of '../../sdl.dart';

class SdlxDateTime {
  SdlxDateTime({
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

  int year;
  int month;
  int day;
  int hour;
  int minute;
  int second;
  int nanosecond;
  int dayOfWeek;
  int utcOffset;

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

  void loadFromPointer(Pointer<SdlDateTime> pointer) {
    year = pointer.ref.year;
    month = pointer.ref.month;
    day = pointer.ref.day;
    hour = pointer.ref.hour;
    minute = pointer.ref.minute;
    second = pointer.ref.second;
    nanosecond = pointer.ref.nanosecond;
    dayOfWeek = pointer.ref.dayOfWeek;
    utcOffset = pointer.ref.utcOffset;
  }

  static SdlxDateTime fromPointer(Pointer<SdlDateTime> pointer) =>
      SdlxDateTime()..loadFromPointer(pointer);
}
