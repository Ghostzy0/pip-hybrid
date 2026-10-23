# Four source variants

One shared core supports two presentation styles and two feature levels. Neutral uses native/system presentation; Pip uses Paper/Geist and original MIT artwork with finite gestures. Enhanced variants add the same local saved-chat search and deliberate current-chat Markdown export. Those additions are separate from reference parity. This is our original behavioral implementation, not proprietary Perplexity code/assets or a full equivalence claim.

| Variant / script argument | Compile flags | App name | Bundle/preferences namespace | Version family |
| --- | --- | --- | --- | --- |
| `baseline` | `BASELINE_EDITION` | Pip Hybrid Baseline | `app.pip.hybrid.baseline` |0.1 alpha |
| `pip` (default) | None | Pip Hybrid | `app.pip.hybrid.mac` |0.1 alpha |
| `baseline-plus` | Both flags | Pip Hybrid Baseline Plus | `app.pip.hybrid.baseline.plus` |0.2 alpha |
| `pip-plus` | `ENHANCED_EDITION` | Pip Hybrid Plus | `app.pip.hybrid.mac.plus` |0.2 alpha |

Each app owns `~/Library/Application Support/<App name>/{Models,History}`. Credential services append `.history`, `.chatgpt` or `.secrets` to that variant's bundle ID. Preferences, models, keys and provider sessions are not migrated/shared automatically, including from LocalSwitch. Configure each independently. Namespace separation is not an OS sandbox.

Baseline styles use system fonts, semantic colors, native buttons and a static system symbol with the generic macOS app icon. Pip styles use bundled licensed fonts and the original icon. Backend behavior, explicit provider review and local-only fail-closed rules are shared.

## Reproduce all four

```sh
swift test --package-path apps/mac --scratch-path apps/mac/.build-baseline --jobs 4 -Xswiftc -DBASELINE_EDITION
./scripts/build-mac.sh baseline
swift test --package-path apps/mac --scratch-path apps/mac/.build-pip --jobs 4
./scripts/build-mac.sh pip
swift test --package-path apps/mac --scratch-path apps/mac/.build-baseline-plus --jobs 4 -Xswiftc -DBASELINE_EDITION -Xswiftc -DENHANCED_EDITION
./scripts/build-mac.sh baseline-plus
swift test --package-path apps/mac --scratch-path apps/mac/.build-pip-plus --jobs 4 -Xswiftc -DENHANCED_EDITION
./scripts/build-mac.sh pip-plus
```

The script supplies the correct flags, separate `.build-<variant>` scratch folder and variant name/ID/version. Outputs are under `dist/<App name>.app`. Builds fetch only the verified runtime; they never launch an app, download model weights or connect accounts. Test results must name the exact variant/source; passing a common core does not accept four native workflows automatically.

## Enhanced behavior

Search scans only this variant's loaded saved-chat titles, visible messages and saved drafts in memory. It preserves history order and creates no plaintext index or network request. Clear search to restore the list; chats outside twelve entries remain available in every variant.

Export uses only the current chat and unsent draft. The app warns that the chosen Markdown file is unencrypted, then opens a native save panel. Cancellation writes nothing; write failure leaves chat/draft unchanged. Partial/stopped results and drafts are labelled, message content is fenced as literal text, and account IDs/credentials/other chats are omitted. The file's destination and any sync/sharing of that folder are your choice.
