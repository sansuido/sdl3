part of '../../sdl.dart';

class SdlxVertex {
  SdlxVertex({SdlxFPoint? position, SdlxFColor? color, SdlxFPoint? texCoord}) {
    this.position = position ?? SdlxFPoint(0, 0);
    this.color = color ?? SdlxFColor(0, 0, 0);
    this.texCoord = texCoord ?? SdlxFPoint(0, 0);
  }

  late SdlxFPoint position;
  late SdlxFColor color;
  late SdlxFPoint texCoord;

  Pointer<SdlVertex> calloc() {
    final pointer = ffi.calloc<SdlVertex>();
    pointer.position.ref.x = position.x;
    pointer.position.ref.y = position.y;
    pointer.color.ref.r = color.r;
    pointer.color.ref.g = color.g;
    pointer.color.ref.b = color.b;
    pointer.color.ref.a = color.a;
    pointer.texCoord.ref.x = texCoord.x;
    pointer.texCoord.ref.y = texCoord.y;
    return pointer;
  }
}

extension SdlxVertexListExtension on List<SdlxVertex> {
  Pointer<SdlVertex> calloc() {
    final buffersPointer = ffi.calloc<SdlVertex>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.position.ref.x = this[n].position.x;
      bufferPointer.position.ref.y = this[n].position.y;
      bufferPointer.color.ref.r = this[n].color.r;
      bufferPointer.color.ref.g = this[n].color.g;
      bufferPointer.color.ref.b = this[n].color.b;
      bufferPointer.color.ref.a = this[n].color.a;
      bufferPointer.texCoord.ref.x = this[n].texCoord.x;
      bufferPointer.texCoord.ref.y = this[n].texCoord.y;
    }
    return buffersPointer;
  }
}
