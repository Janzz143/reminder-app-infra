#!/bin/bash

# Exit on error
set -e

echo "🔧 Updating packages..."
sudo apt update -y
sudo apt upgrade -y

echo "☕ Installing Java (Jenkins requirement)..."
sudo apt install -y openjdk-11-jdk

echo "🔑 Adding Jenkins GPG key and repo..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "📦 Installing Jenkins..."
sudo apt update
sudo apt install -y jenkins

echo "🚀 Starting and enabling Jenkins..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "✅ Jenkins setup complete!"
echo "🔐 Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

