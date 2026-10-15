part of '../sdl_opengl.dart';

void glxDeleteTextures(List<int> textures) => ffi.using((arena) {
  final texture = arena<Uint32>();
  for (final id in textures) {
    texture.value = id;
    glDeleteTextures(1, texture);
  }
});

void glxDrawElements(int mode, int count, int type, int indices) {
  final indicesPointer = Pointer<Void>.fromAddress(indices);
  glDrawElements(mode, count, type, indicesPointer);
}

List<int> glxGenTextures(int n) => ffi.using((arena) {
  final textures = arena<Uint32>(n);
  glGenTextures(n, textures);
  return [for (var i = 0; i < n; i++) textures[i]];
});

void glxTexImage2D(
  int target,
  int level,
  int internalformat,
  int width,
  int height,
  int border,
  int format,
  Uint8List pixels, {
  bool inverted = true,
}) => ffi.using((arena) {
  if (pixels.isEmpty) {
    return;
  }

  Pointer<Uint8> allocatePixelsPointer() {
    final pixelsPointer = arena<Uint8>(pixels.length);
    final radix = pixels.length ~/ height;
    var index = 0;
    for (var h = 0; h < height; h++) {
      final pos = inverted ? height - h - 1 : h;
      final values = pixels.getRange(pos * radix, (pos + 1) * radix);
      for (final value in values) {
        pixelsPointer[index] = value;
        index++;
      }
    }
    return pixelsPointer;
  }

  final pixelsPointer = allocatePixelsPointer();

  glTexImage2D(
    target,
    level,
    internalformat,
    width,
    height,
    border,
    format,
    GL_UNSIGNED_BYTE,
    pixelsPointer.cast<Void>(),
  );
});

void glxDeleteBuffers(List<int> buffers) => ffi.using((arena) {
  final buffer = arena<Uint32>();
  for (final id in buffers) {
    buffer.value = id;
    glDeleteBuffers(1, buffer);
  }
});

void glxBufferUint16(int target, List<int> list, int usage) =>
    ffi.using((arena) {
      final bufferData = arena<Uint16>(list.length);

      for (var i = 0; i < list.length; i++) {
        bufferData[i] = list[i];
      }

      glBufferData(
        target,
        sizeOf<Uint16>() * list.length,
        bufferData.cast<Void>(),
        usage,
      );
    });

void glxBufferUint32(int target, List<int> list, int usage) =>
    ffi.using((arena) {
      if (list.isEmpty) {
        return;
      }

      final bufferData = arena<Uint32>(list.length);
      for (var i = 0; i < list.length; i++) {
        bufferData[i] = list[i];
      }

      glBufferData(
        target,
        sizeOf<Uint32>() * list.length,
        bufferData.cast<Void>(),
        usage,
      );
    });

void glxBufferFloat(int target, List<double> buffer, int usage) =>
    ffi.using((arena) {
      if (buffer.isEmpty) {
        return;
      }

      final bufferData = arena<Float>(buffer.length);
      for (var i = 0; i < buffer.length; i++) {
        bufferData[i] = buffer[i];
      }

      glBufferData(
        target,
        sizeOf<Float>() * buffer.length,
        bufferData.cast<Void>(),
        usage,
      );
    });

List<int> glxGenBuffers(int n) => ffi.using((arena) {
  if (n <= 0) {
    return [];
  }

  final buffers = arena<Uint32>(n);
  glGenBuffers(n, buffers);

  return [for (var i = 0; i < n; i++) buffers[i]];
});

String glxGetProgramInfoLog(int program, int bufSize) => ffi.using((arena) {
  final infoLog = arena<Int8>(bufSize);
  final length = arena<Int32>();

  glGetProgramInfoLog(program, bufSize, length, infoLog);

  return infoLog.cast<ffi.Utf8>().toDartString();
});

int glxGetProgramiv(int program, int pname) => ffi.using((arena) {
  final paramPtr = arena<Int32>();

  glGetProgramiv(program, pname, paramPtr);

  return paramPtr.value;
});

String glxGetShaderInfoLog(int shader, int bufSize) => ffi.using((arena) {
  final infoLog = arena<Int8>(bufSize);
  final length = arena<Int32>();

  glGetShaderInfoLog(shader, bufSize, length, infoLog);

  return infoLog.cast<ffi.Utf8>().toDartString();
});

int glxGetShaderiv(int shader, int pname) => ffi.using((arena) {
  final params = arena<Int32>();

  glGetShaderiv(shader, pname, params);

  return params.value;
});

void glxShaderSource(int shader, String source) => ffi.using((arena) {
  final sourceNative = source.toNativeUtf8(allocator: arena);

  final string = arena<Pointer<Int8>>()..value = sourceNative.cast<Int8>();

  final length = arena<Int32>()..value = sourceNative.length;

  glShaderSource(shader, 1, string, length);
});

void glxUniform2fv(int location, int count, Float32List value) =>
    ffi.using((arena) {
      if (value.isEmpty) {
        return;
      }

      final valuePointer = arena<Float>(value.length);
      for (var i = 0; i < value.length; i++) {
        valuePointer[i] = value[i];
      }

      glUniform2fv(location, count, valuePointer);
    });

void glxUniform3fv(int location, int count, Float32List value) =>
    ffi.using((arena) {
      if (value.isEmpty) {
        return;
      }

      final valuePointer = arena<Float>(value.length);
      for (var i = 0; i < value.length; i++) {
        valuePointer[i] = value[i];
      }

      glUniform3fv(location, count, valuePointer);
    });

void glxUniform4fv(int location, int count, Float32List value) =>
    ffi.using((arena) {
      if (value.isEmpty) {
        return;
      }

      final valuePointer = arena<Float>(value.length);
      for (var i = 0; i < value.length; i++) {
        valuePointer[i] = value[i];
      }

      glUniform4fv(location, count, valuePointer);
    });

void glxUniformMatrix2fv(
  int location,
  int count,
  int transpose,
  Float32List value,
) => ffi.using((arena) {
  if (value.isEmpty) {
    return;
  }

  final valuePointer = arena<Float>(value.length);
  for (var i = 0; i < value.length; i++) {
    valuePointer[i] = value[i];
  }

  glUniformMatrix2fv(location, count, transpose, valuePointer);
});

void glxUniformMatrix3fv(
  int location,
  int count,
  int transpose,
  Float32List value,
) => ffi.using((arena) {
  if (value.isEmpty) {
    return;
  }

  final valuePointer = arena<Float>(value.length);
  for (var i = 0; i < value.length; i++) {
    valuePointer[i] = value[i];
  }

  glUniformMatrix3fv(location, count, transpose, valuePointer);
});

void glxUniformMatrix4fv(
  int location,
  int count,
  int transpose,
  Float32List value,
) => ffi.using((arena) {
  if (value.isEmpty) {
    return;
  }

  final valuePointer = arena<Float>(value.length);
  for (var i = 0; i < value.length; i++) {
    valuePointer[i] = value[i];
  }

  glUniformMatrix4fv(location, count, transpose, valuePointer);
});

void glxVertexAttribPointer(
  int index,
  int size,
  int type,
  int normalized,
  int stride,
  int pos,
) {
  glVertexAttribPointer(
    index,
    size,
    type,
    normalized,
    stride,
    Pointer<Void>.fromAddress(pos),
  );
}

void glxDeleteVertexArrays(List<int> arrays) => ffi.using((arena) {
  if (arrays.isEmpty) {
    return;
  }

  final arrayPointer = arena<Uint32>(arrays.length);
  for (var i = 0; i < arrays.length; i++) {
    arrayPointer[i] = arrays[i];
  }

  glDeleteVertexArrays(arrays.length, arrayPointer);
});

List<int> glxGenVertexArrays(int n) => ffi.using((arena) {
  if (n <= 0) {
    return [];
  }

  final arrays = arena<Uint32>(n);
  glGenVertexArrays(n, arrays);

  return [for (var i = 0; i < n; i++) arrays[i]];
});
