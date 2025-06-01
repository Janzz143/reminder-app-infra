#!/bin/bash

set -e

echo "📦 Pulling latest production images..."
docker compose -f docker-compose.prod.yml pull

echo "🧹 Stopping and removing old production containers..."
docker compose -f docker-compose.prod.yml down

echo "🚀 Starting new production containers..."
docker compose -f docker-compose.prod.yml up -d --build

echo "✅ Production deployment complete!"
