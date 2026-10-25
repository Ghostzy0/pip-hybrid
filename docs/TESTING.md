# Testing and evidence boundaries

This source export is not a test receipt. Results must name the exact snapshot/commit, edition, command, OS/architecture, inputs and observed result. Do not carry a test count or runtime claim from a historical build into a new export. Before the later merges below, a read-only remote-ref snapshot on 24 October found the two public source repositories at: `Ghostzy0/pip-hybrid` main at `98ce7b883b6cbb651d6cc6a396cfe812cbc598c2` and `Ghostzy0/pip-hybrid-replica` main at `dc39561e7ecb996968097ac8bafff080bedcc2b0` (read-only remote ref check). These are historical pre-merge refs; the later exact qualified merge is recorded below. Repository availability is distinct from source/package and native acceptance.

## Qualified source snapshot — 23 October 2026

A fresh remote clone at `c4d4d318789bd9d6962d17098fde63779a78163e` passed **99 tests per variant** (79 Core, 20 Mac; zero failures or skips) for baseline, Pip, baseline Plus and Pip Plus on macOS 27.0.1 (26A434), arm64. All 75 manifest entries matched before testing; tracked status remained clean afterwards. Each variant was then packaged with `scripts/build-mac.sh <variant>` and passed deep/strict ad-hoc signature verification. These are local source/package checks, not signed distribution or native interaction acceptance.

| Variant | Version | Executable SHA-256 |
| --- | --- | --- |
| baseline | 0.1.0 | `7f6e765d3f32dacdd13b15ced11e03a622b05057f586e26fcea17872844ad13b` |
| pip | 0.1.0 | `b8f811e852dbe5e201b6c1eb0b5b577b1b3738823fd0dfa523470bef17342f64` |
| baseline-plus | 0.2.0 | `34f5b27aae32c31a70ac7249203c7d9da62711498d65de9b810e418d3a95ee62` |
| pip-plus | 0.2.0 | `a38f67902167eed7d398b6c9d5741250826d14f7d5c6db9bb39135e1fbf1fdfa` |

Later documentation-only changes do not extend these results to changed implementation. Protected-history native restart, enhanced search/export interaction, live provider lifecycle, accessibility and complete Perplexity workflow parity remain separate gates.

## Merged source qualification · 24 October 2026

The public custom source candidate `c1c2e226a841d9767dd837a21e1975ecfed35fbc`, merged as `478b12b89b9484603178c3470e5fcfe7a1073c59`, passed [native CI run 40119565332](https://github.com/Ghostzy0/pip-hybrid/actions/runs/40119565332): all four variants each passed **109 tests** and ad-hoc packaging on the configured macOS runner. [Manual source checks 40119671624](https://github.com/Ghostzy0/pip-hybrid/actions/runs/40119671624) also passed. These checks cover the exact merged tree; they do not establish native account/provider interaction or full Perplexity task fidelity.

The follow-up public PR4 candidate `639bb43464b94a2734914c08dcd079ea898276a6` passed [native CI run 40124528447](https://github.com/Ghostzy0/pip-hybrid/actions/runs/40124528447): baseline, Pip, baseline Plus and Pip Plus each passed **109 tests** and ad-hoc packaging. [Manual source checks 40124579470](https://github.com/Ghostzy0/pip-hybrid/actions/runs/40124579470) also passed. The native run checked merge ref `59da5a2`; these results include the save-panel callback guard but predate the transcript-role filter below.

Before that public run, the matching Pip Plus implementation at internal source revision `84cdf43` passed **109 XCTest cases** (84 Core, 25 Mac; zero failures) on macOS 27.0.1 arm64. Pip Plus local ad-hoc packaging and the isolated Smoke release build passed. Executable SHA-256 values were `73e38a37f18f51515a4f0068def90e33fecaef3bbd87ee02dd89ba2f147b36ba` (app) and `2e2b75b4f338425129b50bea96a175eb81033561a6986935a1e2901826643f8a` (Smoke). This local qualification preceded the public CI run; no notarisation or public app binary is implied.

A separate bounded native test on the same internal Core source/build exercised a busy synthetic history store: ordinary quit and window close were vetoed while the latest draft remained visible, then retry saved it and the app exited. It used a synthetic identity/root with account sign-in disabled and memory-only provider state. This narrow gate does not verify owner Keychain behavior, broader native paths or provider lifecycle. The installed owner app was not used for this test.

The save-panel callback identity guard was first qualified at internal source revision `aac3398c345449d1f42cbbbdf77208d1ec567e5b`: **109 local XCTest cases** (84 Core, 25 Mac; zero failures) and strict ad-hoc Pip Plus packaging in 10.98 seconds on macOS 27.0.1 arm64. The production executable SHA-256 was `31df896a5898184f100049cd6d2fafba5e083a8edf1e6f5e75630d22e74f569d`. The later PR4 CI above covers this callback guard. Native callback interleaving remains untested.

Internal source revision `14d6d7dc34382d6d4472b973bf2c1ca475f1a4fa` adds a one-line workspace transcript filter for user/assistant roles. It passed **109 local Pip Plus XCTest cases** (84 Core, 25 Mac; zero failures) and strict ad-hoc Pip Plus packaging in 11.56 seconds on macOS 27.0.1 arm64. Production executable SHA-256: `e62ddcfcc2bf89bdde067c00cef9fa6daa1d7de8d054df25b8acda05be1d486a`. These local checks postdate PR4 CI; a fresh all-four-variant hosted run remains pending. Source review indicates this filter changes displayed rows only; raw conversation messages remain available to persistence and legacy migration. Native transcript interaction has not been run or accepted.

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
| Clean-source packaging | All four variants built from this export; bundle ID/name/resources/signature checked | Pending separate receipt |
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
