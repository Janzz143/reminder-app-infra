#!/bin/bash

set -e

# Check if docker-compose or docker compose is available
if command -v docker-compose &> /dev/null; then
  DC_CMD="docker-compose"
elif command -v docker &> /dev/null; then
  DC_CMD="docker compose"
else
  echo "Error: Neither 'docker-compose' nor 'docker compose' command found."
  exit 1
fi

echo "📦 Pulling latest images..."
$DC_CMD pull

echo "🧹 Stopping and removing old containers..."
$DC_CMD down

echo "🚀 Starting new containers..."
$DC_CMD up -d --build

# Optional: wait for all containers to be healthy (requires HEALTHCHECK in your docker-compose.yml)
echo "⏳ Waiting for containers to become healthy..."

for i in {1..30}; do
  unhealthy_count=$($DC_CMD ps --filter "health=unhealthy" -q | wc -l)
  starting_count=$($DC_CMD ps --filter "health=starting" -q | wc -l)
  total_unhealthy=$((unhealthy_count + starting_count))

  if [ "$total_unhealthy" -eq 0 ]; then
    echo "✅ All containers are healthy."
    break
  fi

  echo "Waiting for healthy status... ($i/30)"
  sleep 5
done

if [ "$total_unhealthy" -ne 0 ]; then
  echo "⚠️ Warning: Some containers are not healthy after waiting."
  $DC_CMD ps
fi

echo "✅ Deployment complete!"
