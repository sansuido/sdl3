part of '../../sdl.dart';

extension SdlPointPointerEx on Pointer<SdlPoint> {
  math.Point create() => math.Point(ref.x, ref.y);
}
