# Docker Compose Collection

A comprehensive collection of Docker Compose configurations for various applications and services. This repository contains ready-to-use Docker Compose files for quick deployment of popular web applications, databases, development tools, and services.

## 📋 Table of Contents

- [Applications](#applications)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Service Details](#service-details)
- [Network Configuration](#network-configuration)
- [Port Mappings](#port-mappings)
- [Data Persistence](#data-persistence)
- [Security Notes](#security-notes)
- [Contributing](#contributing)

## 🚀 Applications

This collection includes Docker Compose configurations for:

### Content Management Systems
- **WordPress** (`wordpress-mysql/`, `new-wp/`, `sbrunner-wp-my/`) - Popular CMS with MySQL backend
- **Drupal** (`drupal/`) - Enterprise-grade CMS
- **Mastodon** (`mastodon/`) - Decentralized social network

### E-commerce Platforms
- **Magento** (`magento/`) - Enterprise e-commerce platform
- **OpenCart** (`opencart/`) - Open-source shopping cart
- **PrestaShop** (`prestashop/`) - E-commerce solution

### Development Tools
- **GitLab** (`gitlab/`) - Complete DevOps platform
- **JetBrains TeamCity** (`jetbrainsteamcity/`) - Continuous integration server
- **MailHog** (`mailhog/`) - Email testing tool
- **PostgreSQL** (`postgreSql/`) - Advanced database with Adminer

### Development Environments
- **Python** (`python/`) - Python development environment with MySQL
- **Ubuntu** (`ubuntu/`) - Basic Ubuntu container
- **SoftEther** (`softether/`) - VPN software

### Custom Applications
- **SB Runner** (`sbRunner/`, `affiliates/`) - Custom WordPress-based applications

## 📋 Prerequisites

- Docker Engine 20.10.0 or later
- Docker Compose 2.0.0 or later
- At least 4GB of available RAM (some applications like GitLab require more)
- Available disk space for data persistence

## 🚀 Quick Start

1. **Clone this repository**
   ```bash
   git clone <repository-url>
   cd docker-compose
   ```

2. **Navigate to the desired application folder**
   ```bash
   cd wordpress-mysql
   ```

3. **Start the application**
   ```bash
   docker-compose up -d
   ```

4. **Access the application** (see port mappings below)

5. **Stop the application**
   ```bash
   docker-compose down
   ```

## 📊 Service Details

### WordPress Configurations

| Service | Port | Database | Description |
|---------|------|----------|-------------|
| `wordpress-mysql` | 82 | MySQL (port 3307) | Standard WordPress with MySQL |
| `new-wp` | 81 | MySQL (port 3307) | New WordPress instance |
| `sbrunner-wp-my` | 82 | MySQL (port 3307) | SB Runner WordPress variant |

### E-commerce Platforms

| Service | Port | Database | Description |
|---------|------|----------|-------------|
| `magento` | 80, 443 | MariaDB | Magento 2 with MariaDB |
| `opencart` | 80, 443 | MariaDB | OpenCart with MariaDB |
| `prestashop` | 82 | MySQL | PrestaShop with MySQL |

### Development Tools

| Service | Port | Description |
|---------|------|-------------|
| `gitlab` | 8080 (HTTP), 8443 (HTTPS), 2222 (SSH) | GitLab Enterprise Edition |
| `jetbrainsteamcity` | 8111 | TeamCity CI/CD server |
| `mailhog` | 8025 (Web UI), 1025 (SMTP) | Email testing tool |
| `postgresql` | 8080 | PostgreSQL with Adminer web interface |

### Social & Communication

| Service | Port | Description |
|---------|------|-------------|
| `mastodon` | 3000 (Web), 4000 (Streaming) | Decentralized social network |

### Custom Applications

| Service | Port | Description |
|---------|------|-------------|
| `sbRunner` | 81 | Custom SB Runner application |
| `affiliates` | 81 | Affiliates management system |

## 🌐 Network Configuration

Most services use custom Docker networks for isolation:

- `my_network` - WordPress configurations
- `wp_network` - New WordPress and SB Runner
- `prestashop_network` - PrestaShop
- `python_network` - Python development
- `teamsrunner_network` - Drupal
- `tc_network` - TeamCity
- `softether_network` - SoftEther VPN

## 🔌 Port Mappings

### Web Applications
- **Port 80**: Magento, OpenCart
- **Port 81**: New WordPress, SB Runner, Affiliates, Drupal
- **Port 82**: WordPress-MySQL, SB Runner WP, PrestaShop
- **Port 443**: Magento (HTTPS), OpenCart (HTTPS)

### Development Tools
- **Port 8025**: MailHog Web UI
- **Port 8080**: GitLab HTTP, PostgreSQL Adminer
- **Port 8111**: TeamCity
- **Port 8443**: GitLab HTTPS

### Databases
- **Port 3307**: MySQL instances
- **Port 1025**: MailHog SMTP
- **Port 2222**: GitLab SSH

### Mastodon
- **Port 3000**: Web interface
- **Port 4000**: Streaming API

## 💾 Data Persistence

All configurations include proper volume mappings for data persistence:

- **Database Data**: Stored in `./db_data` directories
- **Application Data**: Stored in service-specific directories
- **Configuration**: GitLab stores config in `./gitlab/config`

## 🔒 Security Status

✅ **SECURITY UPDATED** - All critical vulnerabilities have been resolved!

### 🛡️ Security Improvements Implemented:
- **✅ Eliminated all hard-coded passwords** - Now using secure .env files
- **✅ Disabled empty password authentication** - Secure authentication required
- **✅ Removed database port exposure** - Internal network access only
- **✅ Updated all base images** - Latest secure versions
- **✅ Implemented HTTPS support** - SSL/TLS encryption ready
- **✅ Added security contexts** - Non-root users, no-new-privileges
- **✅ Network isolation** - Localhost binding, custom networks

📋 **See `SECURITY_FIXES_SUMMARY.md`** for complete details on all fixes implemented.

### 🚀 Production Ready Features:
- Environment variable configuration
- SSL/HTTPS support 
- Network security
- User access controls
- Updated secure images
- Security best practices

### 🔧 Setup Instructions:

1. **Copy environment template:**
   ```bash
   cp .env.example service-name/.env
   ```

2. **Generate secure passwords:**
   ```bash
   # Example for WordPress
   cd wordpress-mysql
   # Edit .env and replace with your secure passwords
   ```

3. **Start services:**
   ```bash
   docker-compose up -d
   ```

### 🔑 Environment Variables Required:
Each service now requires a `.env` file with secure passwords. See `.env.example` for template.

## 🔧 Customization

To customize any service:

1. **Environment Variables**: Modify the `environment` section in the compose file
2. **Port Mapping**: Change the `ports` section to avoid conflicts
3. **Volumes**: Adjust volume mappings for different data locations
4. **Networks**: Modify network configurations as needed

## 🐛 Troubleshooting

### Common Issues:

1. **Port Conflicts**: Ensure ports are not already in use
   ```bash
   netstat -ano | findstr :80
   ```

2. **Permission Issues**: On Windows, ensure Docker has access to the drive
3. **Memory Issues**: Some applications (GitLab, Mastodon) require significant RAM
4. **Network Issues**: Check Docker network configuration

### Logs:
```bash
docker-compose logs -f [service-name]
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Add your Docker Compose configuration
4. Update this README with your service details
5. Submit a pull request

## 📝 License

This collection is provided as-is for educational and development purposes. Please check individual application licenses for production use.

---

**Note**: Always review and understand the configurations before deploying to production environments. Some services may require additional setup steps or configuration files not included in this collection.
