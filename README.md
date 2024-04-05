# Tor-lyrebird proxy
## Description
Docker container with Tor proxies obfuscated with lyrebird (fresh bridges are required)
- SOCKS
- DNS
- Tor Control

`tor` folder is used as volume to save tor's data - cache and keys

## Usage
1. Prepare `tor/torrc` settings file from `tor/torrc.template`
2. Rebuild (only if force rebuild required)
    - `docker-compose build`
3. Deploy
    - `docker-compose up -d`
4. Check
    - `curl -x socks5h://localhost:9350 https://check.torproject.org/api/ip`
4. Shutdown
    - `docker-compose`
