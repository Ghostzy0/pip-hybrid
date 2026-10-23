# Contributing

Read the README and privacy boundaries before changing a workflow. Keep changes small and explain the user-visible problem, relevant source and validation. Preserve notices and use original or explicitly licensed assets.

Run both edition test commands in [TESTING](docs/TESTING.md). Use synthetic content. A passing fixture does not prove native consent, Keychain, live provider behavior, hardware fit or assistive technology acceptance. Report the exact build/host and unverified paths.

Changes must preserve local-only fail-closed behavior, explicit provider review, visible Stop, input recovery, separate edition namespaces and protected history handling. Never log tokens, import another app's OAuth credentials or silently adopt another edition's data. Do not introduce chargeable services or automatic cloud routes as a fallback.

Use the issue/PR templates on the repository hosting this checkout. Maintainer: [Ghostzy0](https://github.com/Ghostzy0). No response schedule is promised. Review dependencies, licence terms, synthetic screenshots and the final clean-source build before a release. CI includes a manual source check and public-only native test/package checks for both editions. It does not perform interactive runtime acceptance.
