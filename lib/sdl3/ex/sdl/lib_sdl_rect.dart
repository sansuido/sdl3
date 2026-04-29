part of '../../sdl.dart';

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
/// {@category rect}
bool sdlxGetRectIntersection(SdlxRect a, SdlxRect b, SdlxRect result) {
  final aPointer = a.calloc();
  final bPointer = b.calloc();
  final resultPointer = ffi.calloc<SdlRect>();
  final bl = sdlGetRectIntersection(aPointer, bPointer, resultPointer);
  if (bl) {
    result.loadFromPointer(resultPointer);
  }
  aPointer.callocFree();
  bPointer.callocFree();
  resultPointer.callocFree();
  return bl;
}

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
/// {@category rect}
bool sdlxGetRectUnion(SdlxRect a, SdlxRect b, SdlxRect result) {
  final aPointer = a.calloc();
  final bPointer = b.calloc();
  final resultPointer = ffi.calloc<SdlRect>();
  final bl = sdlGetRectUnion(aPointer, bPointer, resultPointer);
  if (bl) {
    result.loadFromPointer(resultPointer);
  }
  aPointer.callocFree();
  bPointer.callocFree();
  resultPointer.callocFree();
  return bl;
}

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
/// {@category rect}
bool sdlxGetRectEnclosingPoints(
  List<SdlxPoint> points,
  SdlxRect? clip,
  SdlxRect result,
) {
  final pointsPointer = points.calloc();
  final resultPointer = ffi.calloc<SdlRect>();
  Pointer<SdlRect> clipPointer = nullptr;
  if (clip != null) {
    clipPointer = clip.calloc();
  }
  final bl = sdlGetRectEnclosingPoints(
    pointsPointer,
    points.length,
    clipPointer,
    resultPointer,
  );
  if (bl) {
    result.loadFromPointer(resultPointer);
  }
  pointsPointer.callocFree();
  resultPointer.callocFree();
  if (clipPointer != nullptr) {
    clipPointer.callocFree();
  }
  return bl;
}

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
/// {@category rect}
bool sdlxGetRectAndLineIntersection(SdlxRect rect, SdlxPoint p1, SdlxPoint p2) {
  final rectPointer = rect.calloc();
  final x1Pointer = ffi.calloc<Int32>();
  final y1Pointer = ffi.calloc<Int32>();
  final x2Pointer = ffi.calloc<Int32>();
  final y2Pointer = ffi.calloc<Int32>();
  x1Pointer.value = p1.x;
  y1Pointer.value = p1.y;
  x2Pointer.value = p2.x;
  y2Pointer.value = p2.y;
  final bl = sdlGetRectAndLineIntersection(
    rectPointer,
    x1Pointer,
    y1Pointer,
    x2Pointer,
    y2Pointer,
  );
  if (bl) {
    p1
      ..x = x1Pointer.value
      ..y = y1Pointer.value;
    p2
      ..x = x2Pointer.value
      ..y = y2Pointer.value;
  }
  rectPointer.callocFree();
  x1Pointer.callocFree();
  y1Pointer.callocFree();
  x2Pointer.callocFree();
  y2Pointer.callocFree();
  return bl;
}

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
/// {@category rect}
bool sdlxGetRectIntersectionFloat(SdlxFRect a, SdlxFRect b, SdlxFRect result) {
  final aPointer = a.calloc();
  final bPointer = b.calloc();
  final resultPointer = ffi.calloc<SdlFRect>();
  final bl = sdlGetRectIntersectionFloat(aPointer, bPointer, resultPointer);
  if (bl) {
    result.loadFromPointer(resultPointer);
  }
  aPointer.callocFree();
  bPointer.callocFree();
  resultPointer.callocFree();
  return bl;
}

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
/// {@category rect}
bool sdlxGetRectUnionFloat(SdlxFRect a, SdlxFRect b, SdlxFRect result) {
  final aPointer = a.calloc();
  final bPointer = b.calloc();
  final resultPointer = ffi.calloc<SdlFRect>();
  final bl = sdlGetRectUnionFloat(aPointer, bPointer, resultPointer);
  if (bl) {
    result.loadFromPointer(resultPointer);
  }
  aPointer.callocFree();
  bPointer.callocFree();
  resultPointer.callocFree();
  return bl;
}

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
/// {@category rect}
bool sdlxGetRectEnclosingPointsFloat(
  List<SdlxFPoint> points,
  SdlxFRect? clip,
  SdlxFRect result,
) {
  final pointsPointer = points.calloc();
  final resultPointer = ffi.calloc<SdlFRect>();
  Pointer<SdlFRect> clipPointer = nullptr;
  if (clip != null) {
    clipPointer = clip.calloc();
  }
  final bl = sdlGetRectEnclosingPointsFloat(
    pointsPointer,
    points.length,
    clipPointer,
    resultPointer,
  );
  if (bl) {
    result.loadFromPointer(resultPointer);
  }
  pointsPointer.callocFree();
  resultPointer.callocFree();
  if (clipPointer != nullptr) {
    clipPointer.callocFree();
  }
  return bl;
}

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
/// {@category rect}
bool sdlxGetRectAndLineIntersectionFloat(
  SdlxFRect rect,
  SdlxFPoint p1,
  SdlxFPoint p2,
) {
  final rectPointer = rect.calloc();
  final x1Pointer = ffi.calloc<Float>();
  final y1Pointer = ffi.calloc<Float>();
  final x2Pointer = ffi.calloc<Float>();
  final y2Pointer = ffi.calloc<Float>();
  x1Pointer.value = p1.x;
  y1Pointer.value = p1.y;
  x2Pointer.value = p2.x;
  y2Pointer.value = p2.y;
  final bl = sdlGetRectAndLineIntersectionFloat(
    rectPointer,
    x1Pointer,
    y1Pointer,
    x2Pointer,
    y2Pointer,
  );
  if (bl) {
    p1
      ..x = x1Pointer.value
      ..y = y1Pointer.value;
    p2
      ..x = x2Pointer.value
      ..y = y2Pointer.value;
  }
  rectPointer.callocFree();
  x1Pointer.callocFree();
  y1Pointer.callocFree();
  x2Pointer.callocFree();
  y2Pointer.callocFree();
  return bl;
}
