# Tor-lyrebird proxy

## Description

Docker container with Tor proxies obfuscated with lyrebird (fresh bridges are required)

- SOCKS
- DNS
- Tor Control

`tor` folder is used as volume to save tor's data - cache and keys.
For non Windows systems use `make chown` to create `tor` local user
which corresponds to the `tor` user in the container and change
ownership of the `torrc` and `data` directory to `tor`. Is is required
to avoid "Access denied" error in the container.

## Usage

### Basic

1. Prepare `tor/torrc` settings file from `tor/torrc.template`
2. For non Windows systems change tor folder owner
    - `make chown`
3. Deploy and start
    - `make start`
4. Check
    - `make check`
5. Shutdown
    - `make stop`

### Dev

1. If tor/torrc changed then script `scripts/restart.sh` reconfigure Tor without container restart
    - `make restart`
2. If Dockerfile or some its stuff changed then force rebuild
    - `make rebuild`

## References

1. [torrc man](https://manpages.debian.org/jessie/tor/torrc.5)
