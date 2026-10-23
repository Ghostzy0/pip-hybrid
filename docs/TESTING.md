# Testing and evidence boundaries

This source export is not a test receipt. Results must name the exact snapshot/commit, edition, command, OS/architecture, inputs and observed result. Do not carry a test count or runtime claim from a historical build into a new export.

## Qualified source snapshot — 23 October 2026

A fresh remote clone at `c4d4d318789bd9d6962d17098fde63779a78163e` passed **99 tests per variant** (79 Core, 20 Mac; zero failures or skips) for baseline, Pip, baseline Plus and Pip Plus on macOS 27.0.1 (26A434), arm64. All 75 manifest entries matched before testing; tracked status remained clean afterwards. Each variant was then packaged with `scripts/build-mac.sh <variant>` and passed deep/strict ad-hoc signature verification. These are local source/package checks, not signed distribution or native interaction acceptance.

| Variant | Version | Executable SHA-256 |
| --- | --- | --- |
| baseline | 0.1.0 | `7f6e765d3f32dacdd13b15ced11e03a622b05057f586e26fcea17872844ad13b` |
| pip | 0.1.0 | `b8f811e852dbe5e201b6c1eb0b5b577b1b3738823fd0dfa523470bef17342f64` |
| baseline-plus | 0.2.0 | `34f5b27aae32c31a70ac7249203c7d9da62711498d65de9b810e418d3a95ee62` |
| pip-plus | 0.2.0 | `a38f67902167eed7d398b6c9d5741250826d14f7d5c6db9bb39135e1fbf1fdfa` |

Later documentation-only changes do not extend these results to changed implementation. Protected-history native restart, enhanced search/export interaction, live provider lifecycle, accessibility and complete Perplexity workflow parity remain separate gates.

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

The complete four-variant commands and identities are in [EDITIONS](EDITIONS.md). Enhanced acceptance additionally requires search across more than twelve chats (title/body/draft/Unicode/order/clear/empty results) and selected-chat export (plaintext warning, cancellation, partial state, exact content, overwrite/write failure and no unrelated chat/account data). No source-only receipt closes those native interaction gates.

## Native acceptance matrix

| Area | Required evidence | This template's status |
| --- | --- | --- |
| Four-variant tests | Exact commands/head and real results for all flag combinations | Must be recorded for export head |
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

The manual Linux source workflow checks script syntax and asset/provenance structure. The native workflow runs on pull requests, pushes to main and manual dispatch, only when this repository is public. It uses standard Apple Silicon macOS runners, tests all four variants and builds/verifies their ad-hoc packages sequentially. Both workflows use pinned checkout actions with read-only permissions. No models, account sessions, interactive app tests or release artefacts are uploaded. Native fixture/package CI does not establish Keychain, UI, provider or accessibility acceptance.
