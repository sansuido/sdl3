part of '../../sdl.dart';

List<String> _sdlxPropertyEnumCache = [];

void _sdlxPropertyEnumerateCallback(
  Pointer<Void> userdata,
  int props,
  Pointer<Utf8> name,
) {
  if (name != nullptr) {
    _sdlxPropertyEnumCache.add(name.toDartString());
  }
}

///
/// Enumerate the properties contained in a group of properties.
///
/// The callback function is called for each property in the group of
/// properties. The properties are locked during enumeration.
///
/// \param props the properties to query.
/// \param callback the function to call for each property.
/// \param userdata a pointer that is passed to `callback`.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_EnumerateProperties(SDL_PropertiesID props, SDL_EnumeratePropertiesCallback callback, void *userdata)
/// ```
/// {@category properties}
List<String> sdlxGetPropertyNames(int props) {
  _sdlxPropertyEnumCache.clear();
  final callbackPointer =
      Pointer.fromFunction<Void Function(Pointer<Void>, Uint32, Pointer<Utf8>)>(
        _sdlxPropertyEnumerateCallback,
      );
  final success = sdlEnumerateProperties(props, callbackPointer, nullptr);
  if (!success) {
    return [];
  }
  final result = List<String>.from(_sdlxPropertyEnumCache);
  _sdlxPropertyEnumCache.clear();
  return result;
}
