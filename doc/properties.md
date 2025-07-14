
# CategoryProperties

A property is a variable that can be created and retrieved by name at
runtime.

All properties are part of a property group (SDL_PropertiesID). A property
group can be created with the SDL_CreateProperties function and destroyed
with the SDL_DestroyProperties function.

Properties can be added to and retrieved from a property group through the
following functions:

- SDL_SetPointerProperty and SDL_GetPointerProperty operate on `void*`
  pointer types.
- SDL_SetStringProperty and SDL_GetStringProperty operate on string types.
- SDL_SetNumberProperty and SDL_GetNumberProperty operate on signed 64-bit
  integer types.
- SDL_SetFloatProperty and SDL_GetFloatProperty operate on floating point
  types.
- SDL_SetBooleanProperty and SDL_GetBooleanProperty operate on boolean
  types.

Properties can be removed from a group by using SDL_ClearProperty.
