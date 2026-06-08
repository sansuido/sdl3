part of '../../sdl.dart';

class SdlxDataResult {
  SdlxDataResult({this.data, this.datasize = 0, this.exitcode = 0});
  Uint8List? data;
  int datasize;
  int exitcode;
}
