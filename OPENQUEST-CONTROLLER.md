# Experimental OpenQuest controller service

This opt-in hook consumes `external/openquest/components/controller_tracking`. It does not
change the default device build or automatically take over tracking hardware.

1. Place the OpenQuest contribution at `external/openquest` and build its pinned Android
   prebuilts using `components/controller_tracking/build-android.sh`.
2. Set `WITH_OPENQUEST_CONTROLLER_TRACKING := true` before including this device's product
   and BoardConfig files. The service, runtime libraries, init rules and private SELinux policy
   are then included.
3. Follow the component README to provision private per-unit calibration.

The service starts disabled and needs a privileged, synchronized camera/IMU producer and
an OpenXR consumer. Those links are not included yet. Do not enable it as a replacement for
a working VR runtime. It reports model-centroid poses relative to the headset IMU, not world
poses or grip/aim poses. No public data/calibration files are shipped.

Validation: the native tracker and socket interface were built and exercised on a stock Quest 1.
This device-tree hook, Soong integration and policy have not been compiled into a complete
LineageOS image or boot-tested. Existing device-tree / boot blockers are unaffected.
