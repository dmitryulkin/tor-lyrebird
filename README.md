# Tor-lyrebird proxy
## Description
Docker container with Tor proxies obfuscated with lyrebird (fresh bridges are required)
- SOCKS
- DNS
- Tor Control

`tor` folder is used as volume to save tor's data - cache and keys

## Usage
### Basic
1. Prepare `tor/torrc` settings file from `tor/torrc.template`
2. Deploy
    - `docker-compose up -d`
3. Check
    - `curl -x socks5h://localhost:9350 https://check.torproject.org/api/ip`
4. Shutdown
    - `docker-compose`
### Dev
1. If tor/torrc changed then script `scripts/restart.sh` reconfigure Tor without container restart
2. If Dockerfile or some its stuff changed then force rebuild
    - `docker-compose build`

## References
1. [torrc man](https://manpages.debian.org/jessie/tor/torrc.5)
