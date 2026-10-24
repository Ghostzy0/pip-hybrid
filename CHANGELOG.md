# Change and patch notes

## Source patch · 24 October 2026

- A failed final history checkpoint keeps ordinary quit/window-close from discarding the latest edit; the draft remains available for retry or recovery.
- Automatic protected-history operations fail closed when access is unavailable. This describes the intended source behavior, not a guarantee that Keychain cannot prompt on every host or identity.
- ChatGPT model choice is remembered when available and otherwise prefers a listed Luna model before falling back to the first available model.
- The isolated model Smoke path accepts official in-root runtime SONAME aliases while rejecting escaping paths and cycles.

The matching Pip Plus source passed 109 XCTest cases and local ad-hoc packaging on 24 October; the Smoke executable also rebuilt. The four-variant public CI and native/provider acceptance remain separate gates. No public binary is offered by this patch. See [TESTING](docs/TESTING.md) for the exact evidence boundary.

## 0.2.0 enhanced alpha · in qualification

- Added the same active-variant saved-chat search and explicit selected-chat Markdown export to neutral and Pip enhanced variants.
- Search is in memory; export warns before writing unencrypted content and omits hidden instructions, account/provider credentials and other chats.
- Added distinct enhanced identities/versioning/build flags, shared regression fixtures and a four-way public-only CI matrix. Native qualification remains explicitly recorded, not inferred.

## 0.1.0 baseline alpha · source changes 2026-10-23

- Added reproducible baseline and Pip source editions with separate bundle, preference, model/history and credential namespaces.
- Baseline presentation uses system fonts, native button styles, semantic colors and a static system icon.
- Pip presentation uses the Paper theme, licensed bundled Geist fonts and a newly hand-authored MIT mascot silhouette replacing restricted-derived artwork.
- Fixed cleared-draft recovery, chat history reachability beyond twelve entries, disabled secondary-button feedback and progress tint. Added process-cancellation and Keychain-policy concurrency regression fixtures.
- Added public-only native CI for both editions and current synthetic native screenshots.
- Source export includes explicit asset provenance, build scripts, tests and public setup/privacy/release documentation while excluding private history, captures, caches and weights.

The source repositories are public, including [pip-hybrid](https://github.com/Ghostzy0/pip-hybrid) and [pip-hybrid-replica](https://github.com/Ghostzy0/pip-hybrid-replica). This section does not assert a tagged release, packaged acceptance pass or notarised binary. Exact test, package and screenshot evidence belongs in [TESTING](docs/TESTING.md) and [RELEASE](docs/RELEASE.md). Add a dated patch entry with affected version, concrete fix and retest result when a patch is actually verified.
