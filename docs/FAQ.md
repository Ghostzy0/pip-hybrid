# Pip Hybrid questions and practical setup

## What can I use it for?

A native Apple Silicon Mac workspace for local model chat, pinned verified model downloads, visible Stop, encrypted saved history and optionally reviewed ChatGPT requests. Enhanced builds add local saved-chat search and selected-chat Markdown export. This is experimental source with explicit native/provider/accessibility limits, not a complete agent or web-research product.

## Which of the four builds should I choose?

Neutral baseline and Pip baseline share feature level0.1; neutral enhanced and Pip enhanced share feature level0.2. Pip changes presentation; enhanced adds search/export. Each owns separate preferences, models, history and credential namespaces. [Exact flags and paths](EDITIONS.md) explain reproducible builds. No automatic migration/import is performed.

## Is this Perplexity or an official client?

No. Perplexity is a behavior reference. This is independently authored MIT code on a licensed LocalSwitch foundation with original Pip artwork. Complete hybrid task orchestration, broad web research, document agents and exact reference layout/workflow parity remain gaps. The separately maintained [neutral baseline repository](https://github.com/Ghostzy0/pip-hybrid-replica) records that boundary.

## What does local mean?

The app uses a separately installed model and pinned llama.cpp child process. Builds/downloads need internet; local inference uses authenticated loopback. Offline behavior and network confinement still need qualification on the chosen host/model. This is not an App Sandbox or security certification. See [privacy](PRIVACY.md) for concrete boundaries.

## Do I need a paid account?

Local use needs no AI account. Optional ChatGPT use needs a currently supported, eligible account-specific consent/model flow and exact request review. Signing in does not promise access to every model. No silent API-billing fallback is provided. Models/runtime/fonts have their own notices; no model weights are bundled.

## Why does saved history show locked?

The local ad-hoc build stores its history key in the Mac login Keychain. Automatic access is noninteractive and fails closed; an explicit Unlock action may require native approval. Existing encrypted files are preserved on failure. Do not reset keys or repeatedly approve background dialogs. A deliberately chosen temporary session is visibly unsaved. [Privacy](PRIVACY.md) describes key-loss limitations.

## Is Markdown export encrypted?

No. Enhanced export warns before the native save panel. It exports only the selected current chat and its labelled unsent draft, fences content as literal text, and omits hidden system/tool records, other chats and account credentials. Choose a private destination; a folder may sync through other software. Cancelling does not write a file.

## Can an assistant set it up?

Use the [two-line assistant prompt](AI-SETUP.md) and [exact build commands](EDITIONS.md). It should test/build the requested variants and leave every app closed, without model/account/native-permission changes. Compile success does not prove inference, Keychain, provider or accessibility acceptance.

## Where are the evidence and limitations?

[Testing](TESTING.md), [screenshots](SCREENSHOTS.md), [release limits](RELEASE.md), [notices](../THIRD_PARTY_NOTICES.md) and [change notes](../CHANGELOG.md) separate source/fixture/build/render/native claims. No ratings, download counts, performance guarantees, affiliation or production-readiness claims are implied.
