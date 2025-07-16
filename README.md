# n8n Azure Self-Hosted Deployment

This repo sets up a secure, production-ready instance of [n8n.io](https://n8n.io) using Docker Compose on an Azure (or any Ubuntu) VM, with NGINX and Let's Encrypt.

## 🔧 Requirements

- Ubuntu 20.04/22.04 VM (Azure, DigitalOcean, etc.)
- Public DNS entry (e.g. `n8n.yourdomain.com`)
- Docker & Docker Compose (installed by script)

## 🚀 Quick Start

1. Clone the repo to your VM:

```bash
git clone https://github.com/your-org/n8n-azure-deploy.git
cd n8n-azure-deploy
```

2. Copy and edit the environment config:

```bash
cp .env.example .env
nano .env
```

3. Edit `nginx.conf` and `setup.sh`:
   - Replace `n8n.yourdomain.com`
   - Replace email in `setup.sh`

4. Run the setup:

```bash
chmod +x setup.sh
./setup.sh
```

5. Visit your site at: `https://n8n.yourdomain.com`

## 🧠 Notes

- Basic auth is enabled (`admin` / your password from `.env`)
- Let's Encrypt SSL is automatically configured
- Docker volume persists all data
- UFW firewall is enabled for ports 22, 80, 443

## 🔄 To Restart n8n

```bash
docker-compose restart
```

## 🧽 To Remove Everything

```bash
docker-compose down -v
```

## 📄 License

MIT
