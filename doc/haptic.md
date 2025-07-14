
# CategoryHaptic

The SDL haptic subsystem manages haptic (force feedback) devices.

The basic usage is as follows:

- Initialize the subsystem (SDL_INIT_HAPTIC).
- Open a haptic device.
- SDL_OpenHaptic() to open from index.
- SDL_OpenHapticFromJoystick() to open from an existing joystick.
- Create an effect (SDL_HapticEffect).
- Upload the effect with SDL_CreateHapticEffect().
- Run the effect with SDL_RunHapticEffect().
- (optional) Free the effect with SDL_DestroyHapticEffect().
- Close the haptic device with SDL_CloseHaptic().

Simple rumble example:

```c
   SDL_Haptic *haptic = NULL;

   // Open the device
   SDL_HapticID *haptics = SDL_GetHaptics(NULL);
   if (haptics) {
       haptic = SDL_OpenHaptic(haptics[0]);
       SDL_free(haptics);
   }
   if (haptic == NULL)
      return;

   // Initialize simple rumble
   if (!SDL_InitHapticRumble(haptic))
      return;

   // Play effect at 50% strength for 2 seconds
   if (!SDL_PlayHapticRumble(haptic, 0.5, 2000))
      return;
   SDL_Delay(2000);

   // Clean up
   SDL_CloseHaptic(haptic);
```

Complete example:

```c
bool test_haptic(SDL_Joystick *joystick)
{
   SDL_Haptic *haptic;
   SDL_HapticEffect effect;
   SDL_HapticEffectID effect_id;

   // Open the device
   haptic = SDL_OpenHapticFromJoystick(joystick);
   if (haptic == NULL) return false; // Most likely joystick isn't haptic

   // See if it can do sine waves
   if ((SDL_GetHapticFeatures(haptic) & SDL_HAPTIC_SINE)==0) {
      SDL_CloseHaptic(haptic); // No sine effect
      return false;
   }

   // Create the effect
   SDL_memset(&effect, 0, sizeof(SDL_HapticEffect)); // 0 is safe default
   effect.type = SDL_HAPTIC_SINE;
   effect.periodic.direction.type = SDL_HAPTIC_POLAR; // Polar coordinates
   effect.periodic.direction.dir[0] = 18000; // Force comes from south
   effect.periodic.period = 1000; // 1000 ms
   effect.periodic.magnitude = 20000; // 20000/32767 strength
   effect.periodic.length = 5000; // 5 seconds long
   effect.periodic.attack_length = 1000; // Takes 1 second to get max strength
   effect.periodic.fade_length = 1000; // Takes 1 second to fade away

   // Upload the effect
   effect_id = SDL_CreateHapticEffect(haptic, &effect);

   // Test the effect
   SDL_RunHapticEffect(haptic, effect_id, 1);
   SDL_Delay(5000); // Wait for the effect to finish

   // We destroy the effect, although closing the device also does this
   SDL_DestroyHapticEffect(haptic, effect_id);

   // Close the device
   SDL_CloseHaptic(haptic);

   return true; // Success
}
```

Note that the SDL haptic subsystem is not thread-safe.
