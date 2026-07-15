part of '../../../sdl.dart';

extension SdlHidDeviceInfoEx on SdlHidDeviceInfo {
  ///
  /// Enumerate the HID Devices.
  ///
  /// This function returns a linked list of all the HID devices attached to the
  /// system which match vendor_id and product_id. If `vendor_id` is set to 0
  /// then any vendor matches. If `product_id` is set to 0 then any product
  /// matches. If `vendor_id` and `product_id` are both set to 0, then all HID
  /// devices will be returned.
  ///
  /// By default SDL will only enumerate controllers, to reduce risk of hanging
  /// or crashing on bad drivers, but SDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS
  /// can be set to "0" to enumerate all HID devices.
  ///
  /// \param vendor_id the Vendor ID (VID) of the types of device to open, or 0
  /// to match any vendor.
  /// \param product_id the Product ID (PID) of the types of device to open, or 0
  /// to match any product.
  /// \returns a pointer to a linked list of type SDL_hid_device_info, containing
  /// information about the HID devices attached to the system, or NULL
  /// in the case of failure. Free this linked list by calling
  /// SDL_hid_free_enumeration().
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_hid_device_change_count
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_hid_device_info * SDLCALL SDL_hid_enumerate(unsigned short vendor_id, unsigned short product_id)
  /// ```
  /// {@category hidapi}
  static Pointer<SdlHidDeviceInfo> enumerate(int vendorId, int productId) =>
      sdlHidEnumerate(vendorId, productId);
}

extension SdlHidDeviceInfoPointerEx on Pointer<SdlHidDeviceInfo> {
  ///
  /// Free an enumeration linked list.
  ///
  /// This function frees a linked list created by SDL_hid_enumerate().
  ///
  /// \param devs pointer to a list of struct_device returned from
  /// SDL_hid_enumerate().
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_hid_free_enumeration(SDL_hid_device_info *devs)
  /// ```
  /// {@category hidapi}
  void free() => sdlHidFreeEnumeration(this);
}
