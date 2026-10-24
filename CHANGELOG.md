# Change and patch notes

## Source patch · 24 October 2026

- A failed final history checkpoint keeps ordinary quit/window-close from discarding the latest edit; the draft remains available for retry or recovery.
- Automatic protected-history operations fail closed when access is unavailable. This describes the intended source behavior, not a guarantee that Keychain cannot prompt on every host or identity.
- ChatGPT model choice is remembered when available and otherwise prefers a listed Luna model before falling back to the first available model.
- The isolated model Smoke path accepts official in-root runtime SONAME aliases while rejecting escaping paths and cycles.

The matching Pip Plus source passed 109 XCTest cases and local ad-hoc packaging on 24 October; the Smoke executable also rebuilt. The merged source candidate subsequently passed public CI with 109 tests and ad-hoc packaging in all four variants, plus the manual source checks. A narrow synthetic Core quit/window-close recovery test also passed locally; owner storage, provider and broader native acceptance remain separate gates. The published alpha is a source-only preview, not a public app binary. See [TESTING](docs/TESTING.md) and [RELEASE](docs/RELEASE.md) for the exact boundaries.

## Pending source patch · 24 October 2026

- Ignore a late save-panel completion after its panel has been dismissed or replaced, so it cannot write an export or clear a newer panel. Current-panel completion still clears its own state.

The patched Pip Plus source `aac3398c345449d1f42cbbbdf77208d1ec567e5b` passed 109 local XCTest cases (84 Core, 25 Mac) and strict ad-hoc Pip Plus packaging on 24 October. All-four-variant hosted CI and native callback-interleaving checks remain pending; do not attribute the merged-candidate CI above to this patch. See [TESTING](docs/TESTING.md).

## 0.2.0 enhanced alpha · source-only preview published 24 October 2026

- Added the same active-variant saved-chat search and explicit selected-chat Markdown export to neutral and Pip enhanced variants.
- Search is in memory; export warns before writing unencrypted content and omits hidden instructions, account/provider credentials and other chats.
- Added distinct enhanced identities/versioning/build flags, shared regression fixtures and a four-way public-only CI matrix. The four variants passed the later merged-candidate CI; native interaction remains a separate gate.

## 0.1.0 baseline alpha · source changes 2026-10-23

- Added reproducible baseline and Pip source editions with separate bundle, preference, model/history and credential namespaces.
- Baseline presentation uses system fonts, native button styles, semantic colors and a static system icon.
- Pip presentation uses the Paper theme, licensed bundled Geist fonts and a newly hand-authored MIT mascot silhouette replacing restricted-derived artwork.
- Fixed cleared-draft recovery, chat history reachability beyond twelve entries, disabled secondary-button feedback and progress tint. Added process-cancellation and Keychain-policy concurrency regression fixtures.
- Added public-only native CI for both editions and current synthetic native screenshots.
- Source export includes explicit asset provenance, build scripts, tests and public setup/privacy/release documentation while excluding private history, captures, caches and weights.

The source repositories are public, including [pip-hybrid](https://github.com/Ghostzy0/pip-hybrid) and [pip-hybrid-replica](https://github.com/Ghostzy0/pip-hybrid-replica). The custom source preview is tagged [v0.2.0-alpha.1](https://github.com/Ghostzy0/pip-hybrid/releases/tag/v0.2.0-alpha.1) at merge `478b12b89b9484603178c3470e5fcfe7a1073c59`; it contains no app binary. Ad-hoc package checks do not imply notarised distribution or complete native acceptance. Exact test and package evidence belongs in [TESTING](docs/TESTING.md). Add a dated patch entry with affected version, concrete fix and retest result when a patch is actually verified.
