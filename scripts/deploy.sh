#!/bin/bash
set -e

echo "📦 Pulling latest images..."
docker compose pull

echo "🧹 Stopping and removing old containers..."
docker compose down

# Force remove leftover containers if any remain
echo "🧹 Forcing removal of leftover containers if any..."

for container in reminder-backend reminder-db; do
  if [ "$(docker ps -aq -f name=$container)" ]; then
    echo "Removing leftover container: $container"
    docker rm -f $container || true
  fi
done

echo "🚀 Starting new containers..."
docker compose up -d --build

echo "✅ Deployment complete!"
