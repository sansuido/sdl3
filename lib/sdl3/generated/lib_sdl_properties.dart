// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';

///
/// Get the global SDL properties.
///
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetGlobalProperties(void)
/// ```
int sdlGetGlobalProperties() {
  final sdlGetGlobalPropertiesLookupFunction = libSdl3
      .lookupFunction<Uint32 Function(), int Function()>(
        'SDL_GetGlobalProperties',
      );
  return sdlGetGlobalPropertiesLookupFunction();
}

///
/// Create a group of properties.
///
/// All properties are automatically destroyed when SDL_Quit() is called.
///
/// \returns an ID for a new group of properties, or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_DestroyProperties
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_CreateProperties(void)
/// ```
int sdlCreateProperties() {
  final sdlCreatePropertiesLookupFunction = libSdl3
      .lookupFunction<Uint32 Function(), int Function()>(
        'SDL_CreateProperties',
      );
  return sdlCreatePropertiesLookupFunction();
}

///
/// Copy a group of properties.
///
/// Copy all the properties from one group of properties to another, with the
/// exception of properties requiring cleanup (set using
/// SDL_SetPointerPropertyWithCleanup()), which will not be copied. Any
/// property that already exists on `dst` will be overwritten.
///
/// \param src the properties to copy.
/// \param dst the destination properties.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CopyProperties(SDL_PropertiesID src, SDL_PropertiesID dst)
/// ```
bool sdlCopyProperties(int src, int dst) {
  final sdlCopyPropertiesLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Uint32 src, Uint32 dst),
    int Function(int src, int dst)
  >('SDL_CopyProperties');
  return sdlCopyPropertiesLookupFunction(src, dst) == 1;
}

///
/// Lock a group of properties.
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
/// \param props the properties to lock.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_UnlockProperties
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_LockProperties(SDL_PropertiesID props)
/// ```
bool sdlLockProperties(int props) {
  final sdlLockPropertiesLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(Uint32 props), int Function(int props)>(
        'SDL_LockProperties',
      );
  return sdlLockPropertiesLookupFunction(props) == 1;
}

///
/// Unlock a group of properties.
///
/// \param props the properties to unlock.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LockProperties
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnlockProperties(SDL_PropertiesID props)
/// ```
void sdlUnlockProperties(int props) {
  final sdlUnlockPropertiesLookupFunction = libSdl3
      .lookupFunction<Void Function(Uint32 props), void Function(int props)>(
        'SDL_UnlockProperties',
      );
  return sdlUnlockPropertiesLookupFunction(props);
}

///
/// Set a pointer property in a group of properties with a cleanup function
/// that is called when the property is deleted.
///
/// The cleanup function is also called if setting the property fails for any
/// reason.
///
/// For simply setting basic data types, like numbers, bools, or strings, use
/// SDL_SetNumberProperty, SDL_SetBooleanProperty, or SDL_SetStringProperty
/// instead, as those functions will handle cleanup on your behalf. This
/// function is only for more complex, custom data.
///
/// \param props the properties to modify.
/// \param name the name of the property to modify.
/// \param value the new value of the property, or NULL to delete the property.
/// \param cleanup the function to call when this property is deleted, or NULL
/// if no cleanup is necessary.
/// \param userdata a pointer that is passed to the cleanup function.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPointerProperty
/// \sa SDL_SetPointerProperty
/// \sa SDL_CleanupPropertyCallback
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetPointerPropertyWithCleanup(SDL_PropertiesID props, const char *name, void *value, SDL_CleanupPropertyCallback cleanup, void *userdata)
/// ```
bool sdlSetPointerPropertyWithCleanup(
  int props,
  String? name,
  Pointer<NativeType> value,
  Pointer<NativeFunction<SdlCleanupPropertyCallback>> cleanup,
  Pointer<NativeType> userdata,
) {
  final sdlSetPointerPropertyWithCleanupLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(
      Uint32 props,
      Pointer<Utf8> name,
      Pointer<NativeType> value,
      Pointer<NativeFunction<SdlCleanupPropertyCallback>> cleanup,
      Pointer<NativeType> userdata,
    ),
    int Function(
      int props,
      Pointer<Utf8> name,
      Pointer<NativeType> value,
      Pointer<NativeFunction<SdlCleanupPropertyCallback>> cleanup,
      Pointer<NativeType> userdata,
    )
  >('SDL_SetPointerPropertyWithCleanup');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlSetPointerPropertyWithCleanupLookupFunction(
        props,
        namePointer,
        value,
        cleanup,
        userdata,
      ) ==
      1;
  calloc.free(namePointer);
  return result;
}

///
/// Set a pointer property in a group of properties.
///
/// \param props the properties to modify.
/// \param name the name of the property to modify.
/// \param value the new value of the property, or NULL to delete the property.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPointerProperty
/// \sa SDL_HasProperty
/// \sa SDL_SetBooleanProperty
/// \sa SDL_SetFloatProperty
/// \sa SDL_SetNumberProperty
/// \sa SDL_SetPointerPropertyWithCleanup
/// \sa SDL_SetStringProperty
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetPointerProperty(SDL_PropertiesID props, const char *name, void *value)
/// ```
bool sdlSetPointerProperty(int props, String? name, Pointer<NativeType> value) {
  final sdlSetPointerPropertyLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Uint32 props, Pointer<Utf8> name, Pointer<NativeType> value),
    int Function(int props, Pointer<Utf8> name, Pointer<NativeType> value)
  >('SDL_SetPointerProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlSetPointerPropertyLookupFunction(props, namePointer, value) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Set a string property in a group of properties.
///
/// This function makes a copy of the string; the caller does not have to
/// preserve the data after this call completes.
///
/// \param props the properties to modify.
/// \param name the name of the property to modify.
/// \param value the new value of the property, or NULL to delete the property.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetStringProperty
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetStringProperty(SDL_PropertiesID props, const char *name, const char *value)
/// ```
bool sdlSetStringProperty(int props, String? name, String? value) {
  final sdlSetStringPropertyLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Uint32 props, Pointer<Utf8> name, Pointer<Utf8> value),
    int Function(int props, Pointer<Utf8> name, Pointer<Utf8> value)
  >('SDL_SetStringProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final valuePointer = value != null ? value.toNativeUtf8() : nullptr;
  final result =
      sdlSetStringPropertyLookupFunction(props, namePointer, valuePointer) == 1;
  calloc.free(namePointer);
  calloc.free(valuePointer);
  return result;
}

///
/// Set an integer property in a group of properties.
///
/// \param props the properties to modify.
/// \param name the name of the property to modify.
/// \param value the new value of the property.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetNumberProperty
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetNumberProperty(SDL_PropertiesID props, const char *name, Sint64 value)
/// ```
bool sdlSetNumberProperty(int props, String? name, int value) {
  final sdlSetNumberPropertyLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Uint32 props, Pointer<Utf8> name, Int64 value),
    int Function(int props, Pointer<Utf8> name, int value)
  >('SDL_SetNumberProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlSetNumberPropertyLookupFunction(props, namePointer, value) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Set a floating point property in a group of properties.
///
/// \param props the properties to modify.
/// \param name the name of the property to modify.
/// \param value the new value of the property.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetFloatProperty
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetFloatProperty(SDL_PropertiesID props, const char *name, float value)
/// ```
bool sdlSetFloatProperty(int props, String? name, double value) {
  final sdlSetFloatPropertyLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Uint32 props, Pointer<Utf8> name, Float value),
    int Function(int props, Pointer<Utf8> name, double value)
  >('SDL_SetFloatProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlSetFloatPropertyLookupFunction(props, namePointer, value) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Set a boolean property in a group of properties.
///
/// \param props the properties to modify.
/// \param name the name of the property to modify.
/// \param value the new value of the property.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetBooleanProperty
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetBooleanProperty(SDL_PropertiesID props, const char *name, bool value)
/// ```
bool sdlSetBooleanProperty(int props, String? name, bool value) {
  final sdlSetBooleanPropertyLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Uint32 props, Pointer<Utf8> name, Uint8 value),
    int Function(int props, Pointer<Utf8> name, int value)
  >('SDL_SetBooleanProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlSetBooleanPropertyLookupFunction(props, namePointer, value ? 1 : 0) ==
      1;
  calloc.free(namePointer);
  return result;
}

///
/// Return whether a property exists in a group of properties.
///
/// \param props the properties to query.
/// \param name the name of the property to query.
/// \returns true if the property exists, or false if it doesn't.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPropertyType
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasProperty(SDL_PropertiesID props, const char *name)
/// ```
bool sdlHasProperty(int props, String? name) {
  final sdlHasPropertyLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Uint32 props, Pointer<Utf8> name),
    int Function(int props, Pointer<Utf8> name)
  >('SDL_HasProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlHasPropertyLookupFunction(props, namePointer) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Get the type of a property in a group of properties.
///
/// \param props the properties to query.
/// \param name the name of the property to query.
/// \returns the type of the property, or SDL_PROPERTY_TYPE_INVALID if it is
/// not set.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasProperty
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertyType SDLCALL SDL_GetPropertyType(SDL_PropertiesID props, const char *name)
/// ```
int sdlGetPropertyType(int props, String? name) {
  final sdlGetPropertyTypeLookupFunction = libSdl3.lookupFunction<
    Int32 Function(Uint32 props, Pointer<Utf8> name),
    int Function(int props, Pointer<Utf8> name)
  >('SDL_GetPropertyType');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetPropertyTypeLookupFunction(props, namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Get a pointer property from a group of properties.
///
/// By convention, the names of properties that SDL exposes on objects will
/// start with "SDL.", and properties that SDL uses internally will start with
/// "SDL.internal.". These should be considered read-only and should not be
/// modified by applications.
///
/// \param props the properties to query.
/// \param name the name of the property to query.
/// \param default_value the default value of the property.
/// \returns the value of the property, or `default_value` if it is not set or
/// not a pointer property.
///
/// \threadsafety It is safe to call this function from any thread, although
/// the data returned is not protected and could potentially be
/// freed if you call SDL_SetPointerProperty() or
/// SDL_ClearProperty() on these properties from another thread.
/// If you need to avoid this, use SDL_LockProperties() and
/// SDL_UnlockProperties().
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetBooleanProperty
/// \sa SDL_GetFloatProperty
/// \sa SDL_GetNumberProperty
/// \sa SDL_GetPropertyType
/// \sa SDL_GetStringProperty
/// \sa SDL_HasProperty
/// \sa SDL_SetPointerProperty
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_GetPointerProperty(SDL_PropertiesID props, const char *name, void *default_value)
/// ```
Pointer<NativeType> sdlGetPointerProperty(
  int props,
  String? name,
  Pointer<NativeType> defaultValue,
) {
  final sdlGetPointerPropertyLookupFunction = libSdl3.lookupFunction<
    Pointer<NativeType> Function(
      Uint32 props,
      Pointer<Utf8> name,
      Pointer<NativeType> defaultValue,
    ),
    Pointer<NativeType> Function(
      int props,
      Pointer<Utf8> name,
      Pointer<NativeType> defaultValue,
    )
  >('SDL_GetPointerProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetPointerPropertyLookupFunction(
    props,
    namePointer,
    defaultValue,
  );
  calloc.free(namePointer);
  return result;
}

///
/// Get a string property from a group of properties.
///
/// \param props the properties to query.
/// \param name the name of the property to query.
/// \param default_value the default value of the property.
/// \returns the value of the property, or `default_value` if it is not set or
/// not a string property.
///
/// \threadsafety It is safe to call this function from any thread, although
/// the data returned is not protected and could potentially be
/// freed if you call SDL_SetStringProperty() or
/// SDL_ClearProperty() on these properties from another thread.
/// If you need to avoid this, use SDL_LockProperties() and
/// SDL_UnlockProperties().
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPropertyType
/// \sa SDL_HasProperty
/// \sa SDL_SetStringProperty
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetStringProperty(SDL_PropertiesID props, const char *name, const char *default_value)
/// ```
String? sdlGetStringProperty(int props, String? name, String? defaultValue) {
  final sdlGetStringPropertyLookupFunction = libSdl3.lookupFunction<
    Pointer<Utf8> Function(
      Uint32 props,
      Pointer<Utf8> name,
      Pointer<Utf8> defaultValue,
    ),
    Pointer<Utf8> Function(
      int props,
      Pointer<Utf8> name,
      Pointer<Utf8> defaultValue,
    )
  >('SDL_GetStringProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final defaultValuePointer =
      defaultValue != null ? defaultValue.toNativeUtf8() : nullptr;
  final result = sdlGetStringPropertyLookupFunction(
    props,
    namePointer,
    defaultValuePointer,
  );
  calloc.free(namePointer);
  calloc.free(defaultValuePointer);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get a number property from a group of properties.
///
/// You can use SDL_GetPropertyType() to query whether the property exists and
/// is a number property.
///
/// \param props the properties to query.
/// \param name the name of the property to query.
/// \param default_value the default value of the property.
/// \returns the value of the property, or `default_value` if it is not set or
/// not a number property.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPropertyType
/// \sa SDL_HasProperty
/// \sa SDL_SetNumberProperty
///
/// ```c
/// extern SDL_DECLSPEC Sint64 SDLCALL SDL_GetNumberProperty(SDL_PropertiesID props, const char *name, Sint64 default_value)
/// ```
int sdlGetNumberProperty(int props, String? name, int defaultValue) {
  final sdlGetNumberPropertyLookupFunction = libSdl3.lookupFunction<
    Int64 Function(Uint32 props, Pointer<Utf8> name, Int64 defaultValue),
    int Function(int props, Pointer<Utf8> name, int defaultValue)
  >('SDL_GetNumberProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetNumberPropertyLookupFunction(
    props,
    namePointer,
    defaultValue,
  );
  calloc.free(namePointer);
  return result;
}

///
/// Get a floating point property from a group of properties.
///
/// You can use SDL_GetPropertyType() to query whether the property exists and
/// is a floating point property.
///
/// \param props the properties to query.
/// \param name the name of the property to query.
/// \param default_value the default value of the property.
/// \returns the value of the property, or `default_value` if it is not set or
/// not a float property.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPropertyType
/// \sa SDL_HasProperty
/// \sa SDL_SetFloatProperty
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_GetFloatProperty(SDL_PropertiesID props, const char *name, float default_value)
/// ```
double sdlGetFloatProperty(int props, String? name, double defaultValue) {
  final sdlGetFloatPropertyLookupFunction = libSdl3.lookupFunction<
    Float Function(Uint32 props, Pointer<Utf8> name, Float defaultValue),
    double Function(int props, Pointer<Utf8> name, double defaultValue)
  >('SDL_GetFloatProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetFloatPropertyLookupFunction(
    props,
    namePointer,
    defaultValue,
  );
  calloc.free(namePointer);
  return result;
}

///
/// Get a boolean property from a group of properties.
///
/// You can use SDL_GetPropertyType() to query whether the property exists and
/// is a boolean property.
///
/// \param props the properties to query.
/// \param name the name of the property to query.
/// \param default_value the default value of the property.
/// \returns the value of the property, or `default_value` if it is not set or
/// not a boolean property.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPropertyType
/// \sa SDL_HasProperty
/// \sa SDL_SetBooleanProperty
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetBooleanProperty(SDL_PropertiesID props, const char *name, bool default_value)
/// ```
bool sdlGetBooleanProperty(int props, String? name, bool defaultValue) {
  final sdlGetBooleanPropertyLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Uint32 props, Pointer<Utf8> name, Uint8 defaultValue),
    int Function(int props, Pointer<Utf8> name, int defaultValue)
  >('SDL_GetBooleanProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlGetBooleanPropertyLookupFunction(
        props,
        namePointer,
        defaultValue ? 1 : 0,
      ) ==
      1;
  calloc.free(namePointer);
  return result;
}

///
/// Clear a property from a group of properties.
///
/// \param props the properties to modify.
/// \param name the name of the property to clear.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ClearProperty(SDL_PropertiesID props, const char *name)
/// ```
bool sdlClearProperty(int props, String? name) {
  final sdlClearPropertyLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Uint32 props, Pointer<Utf8> name),
    int Function(int props, Pointer<Utf8> name)
  >('SDL_ClearProperty');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlClearPropertyLookupFunction(props, namePointer) == 1;
  calloc.free(namePointer);
  return result;
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
bool sdlEnumerateProperties(
  int props,
  Pointer<NativeFunction<SdlEnumeratePropertiesCallback>> callback,
  Pointer<NativeType> userdata,
) {
  final sdlEnumeratePropertiesLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(
      Uint32 props,
      Pointer<NativeFunction<SdlEnumeratePropertiesCallback>> callback,
      Pointer<NativeType> userdata,
    ),
    int Function(
      int props,
      Pointer<NativeFunction<SdlEnumeratePropertiesCallback>> callback,
      Pointer<NativeType> userdata,
    )
  >('SDL_EnumerateProperties');
  return sdlEnumeratePropertiesLookupFunction(props, callback, userdata) == 1;
}

///
/// Destroy a group of properties.
///
/// All properties are deleted and their cleanup functions will be called, if
/// any.
///
/// \param props the properties to destroy.
///
/// \threadsafety This function should not be called while these properties are
/// locked or other threads might be setting or getting values
/// from these properties.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateProperties
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyProperties(SDL_PropertiesID props)
/// ```
void sdlDestroyProperties(int props) {
  final sdlDestroyPropertiesLookupFunction = libSdl3
      .lookupFunction<Void Function(Uint32 props), void Function(int props)>(
        'SDL_DestroyProperties',
      );
  return sdlDestroyPropertiesLookupFunction(props);
}
