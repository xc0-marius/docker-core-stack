# docker-core-stack

##### Quick Commands
Change /01-proxy/ to the stack you want to uo/down

```docker compose -f /opt/core-stack/01-proxy/docker-compose.yml --env-file /opt/core-stack/.env up -d```

```docker compose -f /opt/core-stack/01-proxy/docker-compose.yml --env-file /opt/core-stack/.env down```

```docker compose -f /opt/core-stack/05-vpn/docker-compose.yml --env-file /opt/core-stack/.env up -d```

```docker compose -f /opt/core-stack/05-vpn/docker-compose.yml --env-file /opt/core-stack/.env down```

```docker compose logs -f --tail=50 netbird-server```



trustedPeers:
  - "172.18.0.0/16"
  - "178.104.129.102/32"
  - "89.10.103.156/32"
  - "2001:2020:4317:9d56:1807:4f32:32cb:205e/128"
