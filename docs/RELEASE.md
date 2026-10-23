# Release and installation limits

This snapshot is experimental source. No public repository availability, release URL, signed installer, notarisation, automatic update channel or stable release is asserted. The intended repository identity is `Ghostzy0/pip-hybrid`; verify actual published state before advertising it.

Local packaging commands:

```sh
./scripts/build-mac.sh baseline
./scripts/build-mac.sh pip
./scripts/build-mac.sh baseline-plus
./scripts/build-mac.sh pip-plus
```

All use four compilation jobs, prepare only the pinned runtime and leave the apps closed. Outputs under `dist/` are ad-hoc signed local builds. They are not notarised. Native OS account/permission prompts require the user's action. Never disable Gatekeeper or other system protections globally to run an experimental build.

Before releasing an exact source/package:

1. Build and test all four variants from a clean copy, preserving command/commit/host evidence and matching edition identities.
2. Resolve independent functional/data, UI/accessibility and packaged/security/licence review findings; clearly record unavailable consent/platform evidence.
3. Verify the original regenerated icon against its provenance hash, font notices and hashes, runtime pin/notices, model terms and absence of private/restricted material.
4. Inspect actual synthetic-content screenshots and update their build identities. Keep raw reference/private captures excluded.
5. Record the real version/tag/source commit, supported and actually tested hosts, change/patch notes and unresolved limits.
6. Generate SHA-256 checksums from the exact artefacts actually offered. Publish only artefacts corresponding to the tested packages and state signing/notarisation accurately.

The export manifest records the initial source files and their hashes. It is not a signature, SBOM, clean-clone build proof or runtime acceptance. Later repository changes require their own review and test identity. Do not publish runtime caches, weights, private data, credentials or internal repository history as release assets.
