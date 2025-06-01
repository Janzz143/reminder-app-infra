#!/bin/bash

set -e

echo "📦 Pulling latest images..."
docker compose pull

echo "🧹 Stopping and removing old containers..."
docker compose down

echo "🚀 Starting new containers..."
docker compose up -d --build

echo "✅ Deployment complete!"

