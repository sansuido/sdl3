Khronos platform-specific types and definitions.

The master copy of khrplatform.h is maintained in the Khronos EGL
Registry repository at https://github.com/KhronosGroup/EGL-Registry
The last semantic modification to khrplatform.h was at commit ID:
     67a3e0864c2d75ea5287b9f3d2eb74a745936692

Adopters may modify this file to suit their platform. Adopters are
encouraged to submit platform specific modifications to the Khronos
group so that they can be included in future versions of this file.
Please submit changes by filing pull requests or issues on
the EGL Registry repository linked above.


See the Implementer's Guidelines for information about where this file
should be located on your system and for more details of its use:
   http://www.khronos.org/registry/implementers_guide.pdf

This file should be included as
       #include <KHR/khrplatform.h>
by Khronos client API header files that use its types and defines.

The types in khrplatform.h should only be used to define API-specific types.

Types defined in khrplatform.h:
   khronos_int8_t              signed   8  bit
   khronos_uint8_t             unsigned 8  bit
   khronos_int16_t             signed   16 bit
   khronos_uint16_t            unsigned 16 bit
   khronos_int32_t             signed   32 bit
   khronos_uint32_t            unsigned 32 bit
   khronos_int64_t             signed   64 bit
   khronos_uint64_t            unsigned 64 bit
   khronos_intptr_t            signed   same number of bits as a pointer
   khronos_uintptr_t           unsigned same number of bits as a pointer
   khronos_ssize_t             signed   size
   khronos_usize_t             unsigned size
   khronos_float_t             signed   32 bit floating point
   khronos_time_ns_t           unsigned 64 bit time in nanoseconds
   khronos_utime_nanoseconds_t unsigned time interval or absolute time in
                                        nanoseconds
   khronos_stime_nanoseconds_t signed time interval in nanoseconds
   khronos_boolean_enum_t      enumerated boolean type. This should
     only be used as a base type when a client API's boolean type is
     an enum. Client APIs which use an integer or other type for
     booleans cannot use this as the base type for their boolean.

Tokens defined in khrplatform.h:

   KHRONOS_FALSE, KHRONOS_TRUE Enumerated boolean false/true values.

   KHRONOS_SUPPORT_INT64 is 1 if 64 bit integers are supported; otherwise 0.
   KHRONOS_SUPPORT_FLOAT is 1 if floats are supported; otherwise 0.

Calling convention macros defined in this file:
   KHRONOS_APICALL
   KHRONOS_APIENTRY
   KHRONOS_APIATTRIBUTES

These may be used in function prototypes as:

     KHRONOS_APICALL void KHRONOS_APIENTRY funcname(
                                 int arg1,
                                 int arg2) KHRONOS_APIATTRIBUTES;
