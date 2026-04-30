# docker-core-stack

##### Quick Commands
Change /01-proxy/ to the stack you want to uo/down

```docker compose -f /opt/core-stack/01-proxy/docker-compose.yml --env-file /opt/core-stack/.env up -d```

```docker compose -f /opt/core-stack/01-proxy/docker-compose.yml --env-file /opt/core-stack/.env down```

```docker compose -f /opt/core-stack/05-vpn/docker-compose.yml --env-file /opt/core-stack/.env up -d```

```docker compose -f /opt/core-stack/05-vpn/docker-compose.yml --env-file /opt/core-stack/.env down```
