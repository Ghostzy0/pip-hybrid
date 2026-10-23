# Testing and evidence boundaries

This source export is not a test receipt. Results must name the exact snapshot/commit, edition, command, OS/architecture, inputs and observed result. Do not carry a test count or runtime claim from a historical build into a new export.

## Reproducible source checks

From the source root on an Apple Silicon Mac with full Xcode:

```sh
sh -n scripts/build-mac.sh
swift test --package-path apps/mac --scratch-path apps/mac/.build-baseline --jobs 4 -Xswiftc -DBASELINE_EDITION
swift build --package-path apps/mac --scratch-path apps/mac/.build-baseline --jobs 4 -c release -Xswiftc -DBASELINE_EDITION --product LocalSwitch
swift test --package-path apps/mac --scratch-path apps/mac/.build-pip --jobs 4
swift build --package-path apps/mac --scratch-path apps/mac/.build-pip --jobs 4 -c release --product LocalSwitch
```

The identity tests use temporary synthetic sentinels to check legacy/other-edition model-store preservation and credential namespace derivation. Fixture tests do not establish live Keychain/provider acceptance. Direct `swift build` compiles source; use `./scripts/build-mac.sh baseline` and `./scripts/build-mac.sh pip` for local app packaging and the pinned runtime.

## Native acceptance matrix

| Area | Required evidence | This template's status |
| --- | --- | --- |
| Baseline and Pip tests | Exact commands/head and real results for both flags | Must be recorded for export head |
| Clean-source packaging | Both editions built from this export; bundle ID/name/resources/signature checked | Pending separate receipt |
| Local inference | Chosen model/hash, synthetic prompt, stream/Stop and recovery/restart | Host/model-specific; do not infer from fixtures |
| Protected history | Native approval if needed, encrypted restart, lock/unavailable-key recovery without data loss | Requires consented native observation |
| Provider | User-authorized supported sign-in, exact payload review, send/cancel/error and saved-session behavior | Requires consent/account and exact provider observation |
| Pip visuals/motion | Actual normal/compact light/dark renders, reduced motion, interruption and static history | Source and sampled frames alone are insufficient |
| Baseline presentation | Native font/buttons/icon and same workflow inputs as Pip | Inspect actual package |
| Accessibility | Keyboard/focus, native semantics and real assistive technology path | No blanket conformance claim |
| Public content/licences | Reviewed allowlist, notices, hashes, synthetic screenshots and secret/personal-content review | Independent review still required |

Do not change owner stores or sign out/revoke working credentials just to test. Keep private captures outside the repository. Add public evidence only after removing account/personal content without concealing meaningful failures.

## CI

The included workflow is manual, Linux source-only and uses a pinned checkout action. It checks script syntax and asset/provenance structure. It does not compile SwiftUI or test a packaged app. Native CI should be added only after available runner allowance and spending boundaries are confirmed. A green source check is not native acceptance.
