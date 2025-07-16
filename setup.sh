#!/bin/bash

set -e

echo "🔧 Installing Docker, Compose, NGINX, Certbot, UFW..."
sudo apt update
sudo apt install -y docker.io docker-compose nginx certbot python3-certbot-nginx ufw

echo "📁 Setting up NGINX config..."
sudo cp nginx.conf /etc/nginx/sites-available/n8n
sudo ln -sf /etc/nginx/sites-available/n8n /etc/nginx/sites-enabled/n8n
sudo nginx -t && sudo systemctl reload nginx

echo "🔐 Creating SSL cert..."
sudo certbot --nginx -d n8n.yourdomain.com --non-interactive --agree-tos -m you@example.com

echo "🛡️ Enabling firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 80
sudo ufw allow 443
sudo ufw --force enable

echo "📦 Starting n8n with Docker..."
docker-compose up -d

echo "✅ Setup complete! Visit: https://n8n.yourdomain.com"
