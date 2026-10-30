# Configuration

Profiles:
- `default`: motion and touch-friendly defaults.
- `adaptive`: runtime-friendly defaults for varied devices.
- `lightweight`: disables decorative motion and keeps core controls.

Override any profile field in `Nexus.create({ profile = "lightweight" })`. Prefer capability checks before enabling media or high-frequency animation.