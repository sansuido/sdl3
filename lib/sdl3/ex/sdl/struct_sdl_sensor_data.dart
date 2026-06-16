part of '../../sdl.dart';

class SdlxSensorData {
  SdlxSensorData({List<double>? data}) {
    this.data = data ?? [];
  }

  late List<double> data;
}
