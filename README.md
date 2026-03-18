# Snowflake Dappnode Package

This repository contains a minimal Dappnode package for running a Tor Snowflake proxy from the official upstream image.

## Publishing

This repo includes a GitHub Actions workflow at `.github/workflows/publish.yml` that publishes through the SDK flow and creates a GitHub release containing the `sdk-publish` link for the DAppNode publish site.

You can trigger it in either of these ways:

- Run the `Publish` workflow manually from the GitHub Actions tab and choose `patch`, `minor`, or `major`
- Push a temporary tag named `release`, `release/patch`, `release/minor`, or `release/major`

The workflow will:

- Build the package for the declared architectures
- Upload the release to remote DAppNode IPFS infrastructure
- Create a prerelease on GitHub with release assets and a publish link to `https://dappnode.github.io/sdk-publish/`
- Create the final version tag automatically

If this package has never been published before, add a repository secret named `DEVELOPER_ADDRESS` with the Ethereum address that should own the package repository. `GITHUB_TOKEN` is provided automatically by GitHub Actions.

## Services

- `snowflake-proxy`: Standalone Snowflake proxy exposing a fixed UDP port range

## Notes

- The original `watchtower` sidecar was removed because Dappnode already manages package updates.
- The proxy uses the upstream `latest` image tag. Pinning to a specific upstream release is safer for reproducible builds.
- Dappnode rejected `network_mode: host`, so this package exposes a fixed UDP range instead. That should run, but it may classify as a restricted NAT unless the host and router allow the mapped range.
- Users can add optional Snowflake proxy CLI flags through the `EXTRA_OPTS` environment variable in package config. For example, set `EXTRA_OPTS=--verbose` to enable verbose logs when troubleshooting.
