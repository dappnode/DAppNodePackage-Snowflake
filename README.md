# Snowflake Dappnode Package

This repository contains a minimal Dappnode package for running a Tor Snowflake proxy from the official upstream image.

## Services

- `snowflake-proxy`: Standalone Snowflake proxy running with `network_mode: host`

## Notes

- The original `watchtower` sidecar was removed because Dappnode already manages package updates.
- The proxy uses the upstream `latest` image tag. Pinning to a specific upstream release is safer for reproducible builds.
- Dappnode rejected `network_mode: host`, so this package exposes a fixed UDP range instead. That should run, but it may classify as a restricted NAT unless the host and router allow the mapped range.
- Additional Snowflake proxy CLI flags can be added in [`docker-compose.yml`](/Users/lanski/Documents/Dappnode/Code/Tor/snowflake/docker-compose.yml).
