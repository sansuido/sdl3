part of '../../../sdl.dart';

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
    pointer.ref.position.x = position.x;
    pointer.ref.position.y = position.y;
    pointer.ref.color.r = color.r;
    pointer.ref.color.g = color.g;
    pointer.ref.color.b = color.b;
    pointer.ref.color.a = color.a;
    pointer.ref.texCoord.x = texCoord.x;
    pointer.ref.texCoord.y = texCoord.y;
    return pointer;
  }
}

extension SdlxVertexListExtension on List<SdlxVertex> {
  Pointer<SdlVertex> calloc() {
    final buffersPointer = ffi.calloc<SdlVertex>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.position.x = this[n].position.x;
      bufferPointer.ref.position.y = this[n].position.y;
      bufferPointer.ref.color.r = this[n].color.r;
      bufferPointer.ref.color.g = this[n].color.g;
      bufferPointer.ref.color.b = this[n].color.b;
      bufferPointer.ref.color.a = this[n].color.a;
      bufferPointer.ref.texCoord.x = this[n].texCoord.x;
      bufferPointer.ref.texCoord.y = this[n].texCoord.y;
    }
    return buffersPointer;
  }
}
