# Two source editions

Both editions compile the same native backend and workflows. The baseline makes the original functional implementation available with native system presentation; Pip adds the original Paper theme and mascot. This is not proprietary reference source or a claim of full Perplexity equivalence.

| Property | Baseline | Pip (default) |
| --- | --- | --- |
| Compile flag | `BASELINE_EDITION` | None |
| Display name | Pip Hybrid Baseline | Pip Hybrid |
| Bundle/preferences namespace | `app.pip.hybrid.baseline` | `app.pip.hybrid.mac` |
| Application Support subfolder | `Pip Hybrid Baseline` | `Pip Hybrid` |
| Credential services | Baseline bundle ID plus `.history`, `.chatgpt`, `.secrets` | Pip bundle ID plus the same suffixes |
| Presentation | System fonts, semantic colors, native buttons, static system icon | Paper, bundled Geist, original MIT pebble with finite gestures |
| Build folder | `apps/mac/.build-baseline` | `apps/mac/.build-pip` |
| Output | `dist/Pip Hybrid Baseline.app` | `dist/Pip Hybrid.app` |

There is no automatic import or sharing of preferences, models, history keys or provider sessions between editions or from the original LocalSwitch app. This namespace separation is not an OS sandbox. Configure each independently. Both retain the same local-only and explicit provider-review boundaries.

```sh
swift test --package-path apps/mac --scratch-path apps/mac/.build-baseline --jobs 4 -Xswiftc -DBASELINE_EDITION
./scripts/build-mac.sh baseline
swift test --package-path apps/mac --scratch-path apps/mac/.build-pip --jobs 4
./scripts/build-mac.sh pip
```

Omitting the script argument builds Pip. The script supplies the flag only for baseline, packages fonts/icon only for Pip and never launches the app. The baseline currently uses macOS's generic application icon; its in-app decorative symbol is native.

Compare the exact two packages using the same synthetic prompts, model, Stop/recovery scenarios and explicit provider consent. A common code path supports a parity argument; only observed tests establish behavior on a particular host.
