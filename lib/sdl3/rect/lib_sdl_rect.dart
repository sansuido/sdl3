part of '../sdl_rect.dart';

///
/// Determine whether two rectangles intersect.
///
/// If either pointer is NULL the function will return false.
///
/// \param A an SDL_Rect structure representing the first rectangle.
/// \param B an SDL_Rect structure representing the second rectangle.
/// \returns true if there is an intersection, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRectIntersection
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasRectIntersection(const SDL_Rect *A, const SDL_Rect *B)
/// ```
///
/// See also:
/// - [SDL_HasRectIntersection - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_HasRectIntersection)
///
/// {@category rect}
bool sdlxHasRectIntersection(SdlxRect a, SdlxRect b) {
  final aPointer = a.calloc();
  final bPointer = b.calloc();
  final bl = sdlHasRectIntersection(aPointer, bPointer);
  aPointer.callocFree();
  bPointer.callocFree();
  return bl;
}

///
/// Calculate the intersection of two rectangles.
///
/// If `result` is NULL then this function will return false.
///
/// \param A an SDL_Rect structure representing the first rectangle.
/// \param B an SDL_Rect structure representing the second rectangle.
/// \param result an SDL_Rect structure filled in with the intersection of
/// rectangles `A` and `B`.
/// \returns true if there is an intersection, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasRectIntersection
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectIntersection(const SDL_Rect *A, const SDL_Rect *B, SDL_Rect *result)
/// ```
///
/// See also:
/// - [SDL_GetRectIntersection - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRectIntersection)
///
/// {@category rect}
SdlxRect? sdlxGetRectIntersection(SdlxRect a, SdlxRect b) => ffi.using((arena) {
  final aPointer = arena<SdlRect>()
    ..ref.x = a.x
    ..ref.y = a.y
    ..ref.w = a.w
    ..ref.h = a.h;

  final bPointer = arena<SdlRect>()
    ..ref.x = b.x
    ..ref.y = b.y
    ..ref.w = b.w
    ..ref.h = b.h;

  final resultPointer = arena<SdlRect>();

  final intersects = sdlGetRectIntersection(aPointer, bPointer, resultPointer);

  if (!intersects) {
    return null;
  }

  return SdlxRect.fromPointer(resultPointer);
});

///
/// Calculate the union of two rectangles.
///
/// \param A an SDL_Rect structure representing the first rectangle.
/// \param B an SDL_Rect structure representing the second rectangle.
/// \param result an SDL_Rect structure filled in with the union of rectangles
/// `A` and `B`.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectUnion(const SDL_Rect *A, const SDL_Rect *B, SDL_Rect *result)
/// ```
///
/// See also:
/// - [SDL_GetRectUnion - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRectUnion)
///
/// {@category rect}
SdlxRect? sdlxGetRectUnion(SdlxRect a, SdlxRect b) => ffi.using((arena) {
  final aPointer = arena<SdlRect>()
    ..ref.x = a.x
    ..ref.y = a.y
    ..ref.w = a.w
    ..ref.h = a.h;

  final bPointer = arena<SdlRect>()
    ..ref.x = b.x
    ..ref.y = b.y
    ..ref.w = b.w
    ..ref.h = b.h;

  final resultPointer = arena<SdlRect>();

  final result = sdlGetRectUnion(aPointer, bPointer, resultPointer);

  if (!result) {
    return null;
  }

  return SdlxRect.fromPointer(resultPointer);
});

///
/// Calculate a minimal rectangle enclosing a set of points.
///
/// If `clip` is not NULL then only points inside of the clipping rectangle are
/// considered.
///
/// \param points an array of SDL_Point structures representing points to be
/// enclosed.
/// \param count the number of structures in the `points` array.
/// \param clip an SDL_Rect used for clipping or NULL to enclose all points.
/// \param result an SDL_Rect structure filled in with the minimal enclosing
/// rectangle.
/// \returns true if any points were enclosed or false if all the points were
/// outside of the clipping rectangle.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectEnclosingPoints(const SDL_Point *points, int count, const SDL_Rect *clip, SDL_Rect *result)
/// ```
///
/// See also:
/// - [SDL_GetRectEnclosingPoints - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRectEnclosingPoints)
///
/// {@category rect}
SdlxRect? sdlxGetRectEnclosingPoints(
  List<SdlxPoint> points, {
  SdlxRect? clip,
}) => ffi.using((arena) {
  final pointsPointer = arena<SdlPoint>(points.length);
  for (var i = 0; i < points.length; i++) {
    final point = pointsPointer + i;
    point.ref.x = points[i].x;
    point.ref.y = points[i].y;
  }

  Pointer<SdlRect> clipPointer = nullptr;
  if (clip != null) {
    clipPointer = arena<SdlRect>()
      ..ref.x = clip.x
      ..ref.y = clip.y
      ..ref.w = clip.w
      ..ref.h = clip.h;
  }

  final resultPointer = arena<SdlRect>();

  final result = sdlGetRectEnclosingPoints(
    pointsPointer,
    points.length,
    clipPointer,
    resultPointer,
  );

  if (!result) {
    return null;
  }

  return SdlxRect.fromPointer(resultPointer);
});

///
/// Calculate the intersection of a rectangle and line segment.
///
/// This function is used to clip a line segment to a rectangle. A line segment
/// contained entirely within the rectangle or that does not intersect will
/// remain unchanged. A line segment that crosses the rectangle at either or
/// both ends will be clipped to the boundary of the rectangle and the new
/// coordinates saved in `X1`, `Y1`, `X2`, and/or `Y2` as necessary.
///
/// \param rect an SDL_Rect structure representing the rectangle to intersect.
/// \param X1 a pointer to the starting X-coordinate of the line.
/// \param Y1 a pointer to the starting Y-coordinate of the line.
/// \param X2 a pointer to the ending X-coordinate of the line.
/// \param Y2 a pointer to the ending Y-coordinate of the line.
/// \returns true if there is an intersection, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectAndLineIntersection(const SDL_Rect *rect, int *X1, int *Y1, int *X2, int *Y2)
/// ```
///
/// See also:
/// - [SDL_GetRectAndLineIntersection - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRectAndLineIntersection)
///
/// {@category rect}
({SdlxPoint p1, SdlxPoint p2})? sdlxGetRectAndLineIntersection(
  SdlxRect rect,
  SdlxPoint p1,
  SdlxPoint p2,
) => ffi.using((arena) {
  final rectPointer = arena<SdlRect>()
    ..ref.x = rect.x
    ..ref.y = rect.y
    ..ref.w = rect.w
    ..ref.h = rect.h;

  final x1Pointer = arena<Int32>()..value = p1.x;
  final y1Pointer = arena<Int32>()..value = p1.y;
  final x2Pointer = arena<Int32>()..value = p2.x;
  final y2Pointer = arena<Int32>()..value = p2.y;

  final intersects = sdlGetRectAndLineIntersection(
    rectPointer,
    x1Pointer,
    y1Pointer,
    x2Pointer,
    y2Pointer,
  );
  if (!intersects) {
    return null;
  }
  return (
    p1: SdlxPoint(x1Pointer.value, y1Pointer.value),
    p2: SdlxPoint(x2Pointer.value, y2Pointer.value),
  );
});

///
/// Determine whether two rectangles intersect with float precision.
///
/// If either pointer is NULL the function will return false.
///
/// \param A an SDL_FRect structure representing the first rectangle.
/// \param B an SDL_FRect structure representing the second rectangle.
/// \returns true if there is an intersection, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRectIntersectionFloat
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasRectIntersectionFloat(const SDL_FRect *A, const SDL_FRect *B)
/// ```
///
/// See also:
/// - [SDL_HasRectIntersectionFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_HasRectIntersectionFloat)
///
/// {@category rect}
bool sdlxHasRectIntersectionFloat(SdlxFRect a, SdlxFRect b) {
  final aPointer = a.calloc();
  final bPointer = b.calloc();
  final bl = sdlHasRectIntersectionFloat(aPointer, bPointer);
  aPointer.callocFree();
  bPointer.callocFree();
  return bl;
}

///
/// Calculate the intersection of two rectangles with float precision.
///
/// If `result` is NULL then this function will return false.
///
/// \param A an SDL_FRect structure representing the first rectangle.
/// \param B an SDL_FRect structure representing the second rectangle.
/// \param result an SDL_FRect structure filled in with the intersection of
/// rectangles `A` and `B`.
/// \returns true if there is an intersection, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasRectIntersectionFloat
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectIntersectionFloat(const SDL_FRect *A, const SDL_FRect *B, SDL_FRect *result)
/// ```
///
/// See also:
/// - [SDL_GetRectIntersectionFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRectIntersectionFloat)
///
/// {@category rect}
SdlxFRect? sdlxGetRectIntersectionFloat(SdlxFRect a, SdlxFRect b) =>
    ffi.using((arena) {
      final aPointer = arena<SdlFRect>()
        ..ref.x = a.x
        ..ref.y = a.y
        ..ref.w = a.w
        ..ref.h = a.h;

      final bPointer = arena<SdlFRect>()
        ..ref.x = b.x
        ..ref.y = b.y
        ..ref.w = b.w
        ..ref.h = b.h;

      final resultPointer = arena<SdlFRect>();

      final intersects = sdlGetRectIntersectionFloat(
        aPointer,
        bPointer,
        resultPointer,
      );

      if (!intersects) {
        return null;
      }

      return SdlxFRect.fromPointer(resultPointer);
    });

///
/// Calculate the union of two rectangles with float precision.
///
/// \param A an SDL_FRect structure representing the first rectangle.
/// \param B an SDL_FRect structure representing the second rectangle.
/// \param result an SDL_FRect structure filled in with the union of rectangles
/// `A` and `B`.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectUnionFloat(const SDL_FRect *A, const SDL_FRect *B, SDL_FRect *result)
/// ```
///
/// See also:
/// - [SDL_GetRectUnionFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRectUnionFloat)
///
/// {@category rect}
SdlxFRect? sdlxGetRectUnionFloat(SdlxFRect a, SdlxFRect b) =>
    ffi.using((arena) {
      final aPointer = arena<SdlFRect>()
        ..ref.x = a.x
        ..ref.y = a.y
        ..ref.w = a.w
        ..ref.h = a.h;

      final bPointer = arena<SdlFRect>()
        ..ref.x = b.x
        ..ref.y = b.y
        ..ref.w = b.w
        ..ref.h = b.h;

      final resultPointer = arena<SdlFRect>();

      final result = sdlGetRectUnionFloat(aPointer, bPointer, resultPointer);

      if (!result) {
        return null;
      }

      return SdlxFRect.fromPointer(resultPointer);
    });

///
/// Calculate a minimal rectangle enclosing a set of points with float
/// precision.
///
/// If `clip` is not NULL then only points inside of the clipping rectangle are
/// considered.
///
/// \param points an array of SDL_FPoint structures representing points to be
/// enclosed.
/// \param count the number of structures in the `points` array.
/// \param clip an SDL_FRect used for clipping or NULL to enclose all points.
/// \param result an SDL_FRect structure filled in with the minimal enclosing
/// rectangle.
/// \returns true if any points were enclosed or false if all the points were
/// outside of the clipping rectangle.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectEnclosingPointsFloat(const SDL_FPoint *points, int count, const SDL_FRect *clip, SDL_FRect *result)
/// ```
///
/// See also:
/// - [SDL_GetRectEnclosingPointsFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRectEnclosingPointsFloat)
///
/// {@category rect}
SdlxFRect? sdlxGetRectEnclosingPointsFloat(
  List<SdlxFPoint> points, {
  SdlxFRect? clip,
}) => ffi.using((arena) {
  final pointsPointer = arena<SdlFPoint>(points.length);
  for (var i = 0; i < points.length; i++) {
    final point = pointsPointer + i;
    point.ref.x = points[i].x;
    point.ref.y = points[i].y;
  }
  Pointer<SdlFRect> clipPointer = nullptr;
  if (clip != null) {
    clipPointer = arena<SdlFRect>()
      ..ref.x = clip.x
      ..ref.y = clip.y
      ..ref.w = clip.w
      ..ref.h = clip.h;
  }

  final resultPointer = arena<SdlFRect>();

  final result = sdlGetRectEnclosingPointsFloat(
    pointsPointer,
    points.length,
    clipPointer,
    resultPointer,
  );

  if (!result) {
    return null;
  }

  return SdlxFRect.fromPointer(resultPointer);
});

///
/// Calculate the intersection of a rectangle and line segment with float
/// precision.
///
/// This function is used to clip a line segment to a rectangle. A line segment
/// contained entirely within the rectangle or that does not intersect will
/// remain unchanged. A line segment that crosses the rectangle at either or
/// both ends will be clipped to the boundary of the rectangle and the new
/// coordinates saved in `X1`, `Y1`, `X2`, and/or `Y2` as necessary.
///
/// \param rect an SDL_FRect structure representing the rectangle to intersect.
/// \param X1 a pointer to the starting X-coordinate of the line.
/// \param Y1 a pointer to the starting Y-coordinate of the line.
/// \param X2 a pointer to the ending X-coordinate of the line.
/// \param Y2 a pointer to the ending Y-coordinate of the line.
/// \returns true if there is an intersection, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectAndLineIntersectionFloat(const SDL_FRect *rect, float *X1, float *Y1, float *X2, float *Y2)
/// ```
///
/// See also:
/// - [SDL_GetRectAndLineIntersectionFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRectAndLineIntersectionFloat)
///
/// {@category rect}
({SdlxFPoint p1, SdlxFPoint p2})? sdlxGetRectAndLineIntersectionFloat(
  SdlxFRect rect,
  SdlxFPoint p1,
  SdlxFPoint p2,
) => ffi.using((arena) {
  // SdlFRect æ§é ä½ãã¤ã³ã¿ã®ç¢ºä¿ã¨å¤ã®ã»ãã
  final rectPointer = arena<SdlFRect>()
    ..ref.x = rect.x
    ..ref.y = rect.y
    ..ref.w = rect.w
    ..ref.h = rect.h;

  // Out ãã©ã¡ã¼ã¿å¼ Initial Value ãã¤ã³ã¿ã®ç¢ºä¿
  final x1Pointer = arena<Float>()..value = p1.x;
  final y1Pointer = arena<Float>()..value = p1.y;
  final x2Pointer = arena<Float>()..value = p2.x;
  final y2Pointer = arena<Float>()..value = p2.y;

  final intersects = sdlGetRectAndLineIntersectionFloat(
    rectPointer,
    x1Pointer,
    y1Pointer,
    x2Pointer,
    y2Pointer,
  );

  if (!intersects) {
    return null;
  }

  // ã¯ãªããï¼åæ­ï¼ãããæ°ããäº¤ç¹2ã¤ã Record ã§è¿å´
  return (
    p1: SdlxFPoint(x1Pointer.value, y1Pointer.value),
    p2: SdlxFPoint(x2Pointer.value, y2Pointer.value),
  );
});
