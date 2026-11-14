# cloady-xray-trojan

Personal Trojan proxy (Xray) for deployment on Cloady free tier.

- Protocol: Trojan over WebSocket, TLS terminated by Cloady (external 443).
- The container listens on `$PORT` (default 8080), no TLS inside.
- Credentials come from environment variables, never from this repo:
  - `TROJAN_PASSWORD` — the Trojan password.
  - `WS_PATH` — the WebSocket path, e.g. `/7afe80cb422e34ea`.
- Do not share the deployed address, password, or path.
