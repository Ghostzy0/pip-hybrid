# Setup with a coding assistant

Give an assistant this two-line prompt from the checked-out source folder:

> Read README.md and docs/EDITIONS.md, docs/PRIVACY.md and docs/TESTING.md. Verify this is the intended Ghostzy0/pip-hybrid source and an Apple Silicon Mac with the documented Xcode toolchain; report missing prerequisites without installing paid tools.
> Run the documented four-job tests and local builds for all four variants in docs/EDITIONS.md, report exact results and output paths, and leave every app closed. Build-time pinned runtime retrieval is allowed; do not download model weights, connect accounts, read personal stores or change OS permissions.

Verify actual repository/release availability instead of assuming a source checkout is a tested binary. Use the source location actually supplied to you. Review changes before granting an assistant additional access.

## Exact commands

These prerequisite checks are read-only:

```sh
uname -m
sw_vers
xcode-select -p
xcrun swift --version
python3 --version
```

The build lane targets `arm64`, macOS 14+ and a full Xcode developer directory. Missing Xcode/OS consent requires the user's action. Do not use `sudo`, change the selected toolchain or purchase a developer account automatically.

From the source root:

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

Tests and compilation use separate scratch folders. The packaging script downloads the pinned llama.cpp runtime if absent, checks its hash and ad-hoc signs local app outputs. It does not launch the GUI or configure accounts/models. Do not run simultaneous heavy builds on a memory-constrained Mac.

Report the tested commit/snapshot, edition, OS/architecture, command outcomes and the four `dist/<App name>.app` paths listed in EDITIONS.md. A compilation is not evidence of inference, Keychain, provider, accessibility or runtime acceptance. Follow [TESTING](TESTING.md) for those distinct gates.
