# Third-party notices and original assets

The source export preserves the original LocalSwitch MIT grant and copyright in [LICENSE](LICENSE). Subsequent original application code and the independently drawn Pip Hybrid mascot are MIT-licensed contributions. Native SwiftUI/AppKit/Foundation/CryptoKit/Metal APIs are platform dependencies. The retained `LocalSwitch` package/executable names are implementation identifiers, not a claim that editions share data.

## Runtime

The build preparation script downloads the official llama.cpp `b11768` macOS arm64 archive from the upstream release. Pinned commit: `1ba568c5ad5c6c718984bd2bf4e7c71485b706f9`. Archive SHA-256: `15afe10cd251b3c22926fae17348bc2bd85dd2cba9ed39a97659983d01b9f979`. The [MIT notice](apps/mac/Resources/Licenses/llama.cpp-MIT.txt) is retained. Runtime binaries and caches are excluded from the source export. Review the archive's own component notices before redistributing a packaged runtime.

## Models

No model weights are included. Each catalogue download URL is pinned to a publisher revision and checked against the expected SHA-256 in [Catalogue.swift](apps/mac/Sources/LocalSwitchCore/Catalogue.swift). Admitted Qwen catalogue entries use Apache-2.0; the [full licence](apps/mac/Resources/Licenses/Qwen-Apache-2.0.txt) travels with the application. Runtime licensing does not license arbitrary replacement model weights. Check the exact model's terms before use or redistribution.

## Fonts

The Pip edition uses Geist and Geist Mono from Vercel geist-font `v1.8.1`, under SIL Open Font License 1.1. [OFL.txt](apps/mac/Resources/Fonts/OFL.txt) and [publisher/file provenance](apps/mac/Resources/Fonts/PROVENANCE.json) are retained. Publisher archive SHA-256: `70f42c1452fb6df12ea183e20a65999157354f91d11dac18b4c713e383808ec2`. Fonts are bundled locally; the baseline uses system fonts and packages no Geist files.

## Artwork and reference boundary

The new [SVG mascot](docs/assets/pip-hybrid.svg) and native Path are hand-authored original MIT artwork. [Pip provenance](apps/mac/Resources/PIP-PROVENANCE.json) records the replacement and regenerated icon hash. No restricted mascot geometry or motion library is licensed by this export. The icon must match the reviewed original artwork before export.

Perplexity is a behavior reference only; its source, branding, screenshots and proprietary assets are excluded. References do not imply affiliation or grant redistribution rights. The source export contains no historical prototype, private captures or internal repository history.
