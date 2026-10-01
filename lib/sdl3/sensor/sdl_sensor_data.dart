part of '../sdl_sensor.dart';

class SdlxSensorData {
  SdlxSensorData({List<double>? data}) {
    this.data = data ?? [];
  }

  late List<double> data;
}
