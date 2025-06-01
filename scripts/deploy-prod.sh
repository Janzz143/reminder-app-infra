#!/bin/bash

set -e

echo "📦 Pulling latest production images..."
docker compose pull

echo "🧹 Stopping and removing old production containers..."
docker compose down

echo "🧹 Forcing removal of leftover containers if any..."
docker rm -f reminder-backend reminder-db 2>/dev/null || true

echo "🚀 Starting new production containers..."
docker compose up -d --build

echo "✅ Production deployment complete!"

