// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';

///
/// Get the global SDL properties
///
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetProperty
/// \sa SDL_SetProperty
///
/// ```c
/// extern DECLSPEC SDL_PropertiesID SDLCALL SDL_GetGlobalProperties(void)
/// ```
int sdlGetGlobalProperties() {
  final sdlGetGlobalPropertiesLookupFunction =
      libSdl3.lookupFunction<Uint32 Function(), int Function()>(
          'SDL_GetGlobalProperties');
  return sdlGetGlobalPropertiesLookupFunction();
}

///
/// Create a set of properties
///
/// All properties are automatically destroyed when SDL_Quit() is called.
///
/// \returns an ID for a new set of properties, or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroyProperties
///
/// ```c
/// extern DECLSPEC SDL_PropertiesID SDLCALL SDL_CreateProperties(void)
/// ```
int sdlCreateProperties() {
  final sdlCreatePropertiesLookupFunction =
      libSdl3.lookupFunction<Uint32 Function(), int Function()>(
          'SDL_CreateProperties');
  return sdlCreatePropertiesLookupFunction();
}

///
/// Copy a set of properties
///
/// Copy all the properties from one set of properties to another, with the
/// exception of properties requiring cleanup (set using
/// SDL_SetPropertyWithCleanup()), which will not be copied. Any property that
/// already exists on `dst` will be overwritten.
///
/// \param src the properties to copy
/// \param dst the destination properties
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_CopyProperties(SDL_PropertiesID src, SDL_PropertiesID dst)
/// ```
int sdlCopyProperties(int src, int dst) {
  final sdlCopyPropertiesLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 src, Uint32 dst),
      int Function(int src, int dst)>('SDL_CopyProperties');
  return sdlCopyPropertiesLookupFunction(src, dst);
}

///
/// Lock a set of properties
///
/// Obtain a multi-threaded lock for these properties. Other threads will wait
/// while trying to lock these properties until they are unlocked. Properties
/// must be unlocked before they are destroyed.
///
/// The lock is automatically taken when setting individual properties, this
/// function is only needed when you want to set several properties atomically
/// or want to guarantee that properties being queried aren't freed in another
/// thread.
///
/// \param props the properties to lock
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_UnlockProperties
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_LockProperties(SDL_PropertiesID props)
/// ```
int sdlLockProperties(int props) {
  final sdlLockPropertiesLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 props),
      int Function(int props)>('SDL_LockProperties');
  return sdlLockPropertiesLookupFunction(props);
}

///
/// Unlock a set of properties
///
/// \param props the properties to unlock
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LockProperties
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_UnlockProperties(SDL_PropertiesID props)
/// ```
void sdlUnlockProperties(int props) {
  final sdlUnlockPropertiesLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint32 props),
      void Function(int props)>('SDL_UnlockProperties');
  return sdlUnlockPropertiesLookupFunction(props);
}

///
/// Set a property on a set of properties with a cleanup function that is
/// called when the property is deleted
///
/// The cleanup function is also called if setting the property fails for any
/// reason.
///
/// \param props the properties to modify
/// \param name the name of the property to modify
/// \param value the new value of the property, or NULL to delete the property
/// \param cleanup the function to call when this property is deleted, or NULL
/// if no cleanup is necessary
/// \param userdata a pointer that is passed to the cleanup function
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetProperty
/// \sa SDL_SetProperty
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetPropertyWithCleanup(SDL_PropertiesID props, const char *name, void *value, void (SDLCALL *cleanup)(void *userdata, void *value), void *userdata)
/// ```
int sdlSetPropertyWithCleanup(
    int props,
    String? name,
    Pointer<NativeType> value,
    Pointer<NativeType> cleanup,
    Pointer<NativeType> userdata) {
  final sdlSetPropertyWithCleanupLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Uint32 props,
          Pointer<Utf8> name,
          Pointer<NativeType> value,
          Pointer<NativeType> cleanup,
          Pointer<NativeType> userdata),
      int Function(
          int props,
          Pointer<Utf8> name,
          Pointer<NativeType> value,
          Pointer<NativeType> cleanup,
          Pointer<NativeType> userdata)>('SDL_SetPropertyWithCleanup');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlSetPropertyWithCleanupLookupFunction(
      props, namePointer, value, cleanup, userdata);
  calloc.free(namePointer);
  return result;
}

///
/// Set a property on a set of properties
///
/// \param props the properties to modify
/// \param name the name of the property to modify
/// \param value the new value of the property, or NULL to delete the property
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetProperty
/// \sa SDL_SetPropertyWithCleanup
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetProperty(SDL_PropertiesID props, const char *name, void *value)
/// ```
int sdlSetProperty(int props, String? name, Pointer<NativeType> value) {
  final sdlSetPropertyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Uint32 props, Pointer<Utf8> name, Pointer<NativeType> value),
      int Function(int props, Pointer<Utf8> name,
          Pointer<NativeType> value)>('SDL_SetProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlSetPropertyLookupFunction(props, namePointer, value);
  calloc.free(namePointer);
  return result;
}

///
/// Set a string property on a set of properties
///
/// \param props the properties to modify
/// \param name the name of the property to modify
/// \param value the new value of the property, or NULL to delete the property
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetStringProperty
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetStringProperty(SDL_PropertiesID props, const char *name, const char *value)
/// ```
int sdlSetStringProperty(int props, String? name, String? value) {
  final sdlSetStringPropertyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 props, Pointer<Utf8> name, Pointer<Utf8> value),
      int Function(int props, Pointer<Utf8> name,
          Pointer<Utf8> value)>('SDL_SetStringProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final valuePointer = value != null ? value.toNativeUtf8() : nullptr;
  final result =
      sdlSetStringPropertyLookupFunction(props, namePointer, valuePointer);
  calloc.free(namePointer);
  calloc.free(valuePointer);
  return result;
}

///
/// Set an integer property on a set of properties
///
/// \param props the properties to modify
/// \param name the name of the property to modify
/// \param value the new value of the property
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetNumberProperty
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetNumberProperty(SDL_PropertiesID props, const char *name, Sint64 value)
/// ```
int sdlSetNumberProperty(int props, String? name, int value) {
  final sdlSetNumberPropertyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 props, Pointer<Utf8> name, Int64 value),
      int Function(
          int props, Pointer<Utf8> name, int value)>('SDL_SetNumberProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlSetNumberPropertyLookupFunction(props, namePointer, value);
  calloc.free(namePointer);
  return result;
}

///
/// Set a floating point property on a set of properties
///
/// \param props the properties to modify
/// \param name the name of the property to modify
/// \param value the new value of the property
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetFloatProperty
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetFloatProperty(SDL_PropertiesID props, const char *name, float value)
/// ```
int sdlSetFloatProperty(int props, String? name, double value) {
  final sdlSetFloatPropertyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 props, Pointer<Utf8> name, Float value),
      int Function(
          int props, Pointer<Utf8> name, double value)>('SDL_SetFloatProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlSetFloatPropertyLookupFunction(props, namePointer, value);
  calloc.free(namePointer);
  return result;
}

///
/// Set a boolean property on a set of properties
///
/// \param props the properties to modify
/// \param name the name of the property to modify
/// \param value the new value of the property
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetBooleanProperty
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetBooleanProperty(SDL_PropertiesID props, const char *name, SDL_bool value)
/// ```
int sdlSetBooleanProperty(int props, String? name, bool value) {
  final sdlSetBooleanPropertyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 props, Pointer<Utf8> name, Int32 value),
      int Function(
          int props, Pointer<Utf8> name, int value)>('SDL_SetBooleanProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlSetBooleanPropertyLookupFunction(props, namePointer, value ? 1 : 0);
  calloc.free(namePointer);
  return result;
}

///
/// Return whether a property exists in a set of properties.
///
/// \param props the properties to query
/// \param name the name of the property to query
/// \returns SDL_TRUE if the property exists, or SDL_FALSE if it doesn't.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPropertyType
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasProperty(SDL_PropertiesID props, const char *name)
/// ```
bool sdlHasProperty(int props, String? name) {
  final sdlHasPropertyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 props, Pointer<Utf8> name),
      int Function(int props, Pointer<Utf8> name)>('SDL_HasProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlHasPropertyLookupFunction(props, namePointer) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Get the type of a property on a set of properties
///
/// \param props the properties to query
/// \param name the name of the property to query
/// \returns the type of the property, or SDL_PROPERTY_TYPE_INVALID if it is
/// not set.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasProperty
///
/// ```c
/// extern DECLSPEC SDL_PropertyType SDLCALL SDL_GetPropertyType(SDL_PropertiesID props, const char *name)
/// ```
int sdlGetPropertyType(int props, String? name) {
  final sdlGetPropertyTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 props, Pointer<Utf8> name),
      int Function(int props, Pointer<Utf8> name)>('SDL_GetPropertyType');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetPropertyTypeLookupFunction(props, namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Get a property on a set of properties
///
/// By convention, the names of properties that SDL exposes on objects will
/// start with "SDL.", and properties that SDL uses internally will start with
/// "SDL.internal.". These should be considered read-only and should not be
/// modified by applications.
///
/// \param props the properties to query
/// \param name the name of the property to query
/// \param default_value the default value of the property
/// \returns the value of the property, or `default_value` if it is not set or
/// not a pointer property.
///
/// \threadsafety It is safe to call this function from any thread, although
/// the data returned is not protected and could potentially be
/// freed if you call SDL_SetProperty() or SDL_ClearProperty() on
/// these properties from another thread. If you need to avoid
/// this, use SDL_LockProperties() and SDL_UnlockProperties().
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPropertyType
/// \sa SDL_HasProperty
/// \sa SDL_SetProperty
///
/// ```c
/// extern DECLSPEC void *SDLCALL SDL_GetProperty(SDL_PropertiesID props, const char *name, void *default_value)
/// ```
Pointer<NativeType> sdlGetProperty(
    int props, String? name, Pointer<NativeType> defaultValue) {
  final sdlGetPropertyLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Uint32 props, Pointer<Utf8> name, Pointer<NativeType> defaultValue),
      Pointer<NativeType> Function(int props, Pointer<Utf8> name,
          Pointer<NativeType> defaultValue)>('SDL_GetProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetPropertyLookupFunction(props, namePointer, defaultValue);
  calloc.free(namePointer);
  return result;
}

///
/// Get a string property on a set of properties
///
/// \param props the properties to query
/// \param name the name of the property to query
/// \param default_value the default value of the property
/// \returns the value of the property, or `default_value` if it is not set or
/// not a string property.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPropertyType
/// \sa SDL_HasProperty
/// \sa SDL_SetStringProperty
///
/// ```c
/// extern DECLSPEC const char *SDLCALL SDL_GetStringProperty(SDL_PropertiesID props, const char *name, const char *default_value)
/// ```
String? sdlGetStringProperty(int props, String? name, String? defaultValue) {
  final sdlGetStringPropertyLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(
          Uint32 props, Pointer<Utf8> name, Pointer<Utf8> defaultValue),
      Pointer<Utf8> Function(int props, Pointer<Utf8> name,
          Pointer<Utf8> defaultValue)>('SDL_GetStringProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final defaultValuePointer =
      defaultValue != null ? defaultValue.toNativeUtf8() : nullptr;
  final result = sdlGetStringPropertyLookupFunction(
      props, namePointer, defaultValuePointer);
  calloc.free(namePointer);
  calloc.free(defaultValuePointer);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get a number property on a set of properties
///
/// You can use SDL_GetPropertyType() to query whether the property exists and
/// is a number property.
///
/// \param props the properties to query
/// \param name the name of the property to query
/// \param default_value the default value of the property
/// \returns the value of the property, or `default_value` if it is not set or
/// not a number property.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPropertyType
/// \sa SDL_HasProperty
/// \sa SDL_SetNumberProperty
///
/// ```c
/// extern DECLSPEC Sint64 SDLCALL SDL_GetNumberProperty(SDL_PropertiesID props, const char *name, Sint64 default_value)
/// ```
int sdlGetNumberProperty(int props, String? name, int defaultValue) {
  final sdlGetNumberPropertyLookupFunction = libSdl3.lookupFunction<
      Int64 Function(Uint32 props, Pointer<Utf8> name, Int64 defaultValue),
      int Function(int props, Pointer<Utf8> name,
          int defaultValue)>('SDL_GetNumberProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlGetNumberPropertyLookupFunction(props, namePointer, defaultValue);
  calloc.free(namePointer);
  return result;
}

///
/// Get a floating point property on a set of properties
///
/// You can use SDL_GetPropertyType() to query whether the property exists and
/// is a floating point property.
///
/// \param props the properties to query
/// \param name the name of the property to query
/// \param default_value the default value of the property
/// \returns the value of the property, or `default_value` if it is not set or
/// not a float property.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPropertyType
/// \sa SDL_HasProperty
/// \sa SDL_SetFloatProperty
///
/// ```c
/// extern DECLSPEC float SDLCALL SDL_GetFloatProperty(SDL_PropertiesID props, const char *name, float default_value)
/// ```
double sdlGetFloatProperty(int props, String? name, double defaultValue) {
  final sdlGetFloatPropertyLookupFunction = libSdl3.lookupFunction<
      Float Function(Uint32 props, Pointer<Utf8> name, Float defaultValue),
      double Function(int props, Pointer<Utf8> name,
          double defaultValue)>('SDL_GetFloatProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlGetFloatPropertyLookupFunction(props, namePointer, defaultValue);
  calloc.free(namePointer);
  return result;
}

///
/// Get a boolean property on a set of properties
///
/// You can use SDL_GetPropertyType() to query whether the property exists and
/// is a boolean property.
///
/// \param props the properties to query
/// \param name the name of the property to query
/// \param default_value the default value of the property
/// \returns the value of the property, or `default_value` if it is not set or
/// not a float property.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPropertyType
/// \sa SDL_HasProperty
/// \sa SDL_SetBooleanProperty
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_GetBooleanProperty(SDL_PropertiesID props, const char *name, SDL_bool default_value)
/// ```
bool sdlGetBooleanProperty(int props, String? name, bool defaultValue) {
  final sdlGetBooleanPropertyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 props, Pointer<Utf8> name, Int32 defaultValue),
      int Function(int props, Pointer<Utf8> name,
          int defaultValue)>('SDL_GetBooleanProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetBooleanPropertyLookupFunction(
          props, namePointer, defaultValue ? 1 : 0) ==
      1;
  calloc.free(namePointer);
  return result;
}

///
/// Clear a property on a set of properties
///
/// \param props the properties to modify
/// \param name the name of the property to clear
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_ClearProperty(SDL_PropertiesID props, const char *name)
/// ```
int sdlClearProperty(int props, String? name) {
  final sdlClearPropertyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 props, Pointer<Utf8> name),
      int Function(int props, Pointer<Utf8> name)>('SDL_ClearProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlClearPropertyLookupFunction(props, namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Enumerate the properties on a set of properties
///
/// The callback function is called for each property on the set of properties.
/// The properties are locked during enumeration.
///
/// \param props the properties to query
/// \param callback the function to call for each property
/// \param userdata a pointer that is passed to `callback`
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_EnumerateProperties(SDL_PropertiesID props, SDL_EnumeratePropertiesCallback callback, void *userdata)
/// ```
int sdlEnumerateProperties(
    int props,
    Pointer<NativeFunction<SdlEnumeratePropertiesCallback>> callback,
    Pointer<NativeType> userdata) {
  final sdlEnumeratePropertiesLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Uint32 props,
          Pointer<NativeFunction<SdlEnumeratePropertiesCallback>> callback,
          Pointer<NativeType> userdata),
      int Function(
          int props,
          Pointer<NativeFunction<SdlEnumeratePropertiesCallback>> callback,
          Pointer<NativeType> userdata)>('SDL_EnumerateProperties');
  return sdlEnumeratePropertiesLookupFunction(props, callback, userdata);
}

///
/// Destroy a set of properties
///
/// All properties are deleted and their cleanup functions will be called, if
/// any.
///
/// \param props the properties to destroy
///
/// \threadsafety This function should not be called while these properties are
/// locked or other threads might be setting or getting values
/// from these properties.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateProperties
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_DestroyProperties(SDL_PropertiesID props)
/// ```
void sdlDestroyProperties(int props) {
  final sdlDestroyPropertiesLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint32 props),
      void Function(int props)>('SDL_DestroyProperties');
  return sdlDestroyPropertiesLookupFunction(props);
}
