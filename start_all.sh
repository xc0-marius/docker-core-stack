#!/bin/bash
set -e

# Docker Core Stack - Robust Start Script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "🚀 Starting Docker Core Stack from $SCRIPT_DIR"

# Create shared networks
echo "🌐 Creating shared Docker networks..."
docker network create proxy_net 2>/dev/null || true
docker network create db_net 2>/dev/null || true

# Stack startup in dependency order
declare -a stacks=(
    "01-proxy"
    "02-database" 
    "03-auth"
    "04-management"
    "05-vpn"
)

for stack in "${stacks[@]}"; do
    if [ ! -d "$stack" ]; then
        echo "❌ ERROR: $stack directory not found!"
        exit 1
    fi
    
    if [ ! -f "$stack/docker-compose.yml" ]; then
        echo "❌ ERROR: $stack/docker-compose.yml not found!"
        exit 1
    fi
    
    echo "⬆️  Starting $stack..."
    pushd "$stack" > /dev/null
    if docker compose --env-file ../.env up -d --wait; then
        echo "✅ $stack healthy"
    else
        echo "❌ $stack failed to start"
        popd > /dev/null
        exit 1
    fi
    popd > /dev/null
done

echo ""
echo "🎉 All stacks started successfully!"
echo "📋 Check status: docker ps"
echo "🌐 Access:"
echo "  Traefik: https://traefik.ktown.gg"
echo "  pgAdmin: https://pgadmin.ktown.gg"
echo "  Authentik: https://auth.ktown.gg"
echo "  Dockhand: https://dockhand.ktown.gg"
echo "  Netbird: https://netbird.ktown.gg"
