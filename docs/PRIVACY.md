# Data and network boundaries

This document describes implemented boundaries and intended use, not a security or privacy certification. Check the exact source and observed runtime before using sensitive material.

## Local use

Local-only chat uses the separately installed local llama.cpp runtime and the model selected by the user. The build may contact GitHub to retrieve a pinned runtime. Selecting a model download contacts its pinned publisher URL; model weights are not bundled or downloaded by the build script. Both need network access for that retrieval. Once configured, offline inference must still be verified for the chosen host/model; this document does not claim an observed offline pass.

The child runtime is configured through legacy/deprecated `/usr/bin/sandbox-exec` to deny non-loopback networking while permitting loopback requests. Its profile otherwise allows access by default: this is not a full filesystem sandbox or an App Sandbox entitlement, and it does not certify network isolation on every macOS version. Native network and platform-compatibility checks remain required.

The app supports selected small UTF-8 text input, not an unrestricted document crawler. Do not grant broader filesystem access than a task requires. Native model fitting is an estimate, with runtime/context overhead beyond weights.

## Optional provider use

ChatGPT is optional and requires its own supported sign-in and consent. Review the exact outgoing conversation before each cloud Send. A connected account does not imply arbitrary model access, a transferable subscription, API billing entitlement or affiliation. No silent cloud/API fallback is part of the local-only contract. Provider capabilities and terms can change; verify eligibility at the point of use.

Sensitive-information detection is advisory and can miss data. Read the payload yourself. Provider sign-in and requests use network services; do not call them offline/private merely because the app runs on your computer.

## Saved history and credentials

Saved chat content uses AES-256-GCM with a separate non-synchronising key in the legacy Mac login Keychain and its app access-control policy. The ad-hoc build does not use the provisioned Data Protection Keychain path; do not apply a `WhenUnlockedThisDeviceOnly` guarantee to this default login-Keychain configuration. Losing that key can make saved history unrecoverable. macOS may require native approval for protected storage. Do not bypass a prompt or repeatedly invoke it in the background. Locked/unavailable history needs an honest recovery state, not a fabricated save success.

Each source edition has a separate preferences domain, Application Support folder, model directory and Keychain service namespace. Neither automatically adopts the other edition's data or the original LocalSwitch store. [Edition names and paths](EDITIONS.md) identify these stores. Namespace separation does not restrict all filesystem/network privileges and is not a sandbox claim.

## Enhanced search and export

Enhanced variants search active-variant decrypted saved content locally in memory, including saved drafts; no persistent plaintext index is written. Search does not connect a provider. The explicit Markdown export contains one selected current chat and its labelled draft, and is intentionally unencrypted. It requires a warning plus a chosen destination. It excludes hidden system/tool records, account identifiers and provider credentials. Keep the resulting file private if its content is sensitive; your chosen folder may be synced by other software.

## Testing and reporting

Use synthetic content for initial runs, screenshots and bug reports. Never publish tokens, private histories, model caches or account screenshots. Source tests cannot establish end-to-end retention, deletion, provider lifecycle or protected-storage behavior on your Mac. See [TESTING](TESTING.md) and [SECURITY](../SECURITY.md).
