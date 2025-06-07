# Security Fix Script for Docker Compose Collection
# This script helps generate secure environment files and provides security recommendations

Write-Host "🔒 Docker Compose Security Fix Helper" -ForegroundColor Cyan
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "⚠️  WARNING: Critical security vulnerabilities detected!" -ForegroundColor Red
Write-Host "   See SECURITY_ANALYSIS.md for full details" -ForegroundColor Red
Write-Host ""

# Function to generate random password
function Generate-SecurePassword {
    param([int]$Length = 32)
    $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*"
    $password = ""
    for ($i = 0; $i -lt $Length; $i++) {
        $password += $chars[(Get-Random -Maximum $chars.Length)]
    }
    return $password
}

Write-Host "🔧 Generating secure passwords..." -ForegroundColor Yellow

# Generate secure passwords
$mysqlRootPassword = Generate-SecurePassword
$mysqlUserPassword = Generate-SecurePassword
$postgresPassword = Generate-SecurePassword
$prestashopAdminPassword = Generate-SecurePassword

Write-Host "✅ Generated secure passwords" -ForegroundColor Green
Write-Host ""

Write-Host "📝 Creating sample .env file..." -ForegroundColor Yellow

# Create sample .env content
$envContent = @"
# Docker Compose Environment Variables
# Generated on $(Get-Date)
# 
# SECURITY NOTE: 
# - Keep this file secure and never commit to version control
# - Add .env to your .gitignore file
# - Use different passwords for each environment

# MySQL Database Passwords
MYSQL_ROOT_PASSWORD=$mysqlRootPassword
MYSQL_PASSWORD=$mysqlUserPassword

# PostgreSQL Password
POSTGRES_PASSWORD=$postgresPassword

# PrestaShop Admin Password
PRESTASHOP_ADMIN_PASSWORD=$prestashopAdminPassword

# Database Users
MYSQL_USER=dbuser
POSTGRES_USER=dbuser

# Database Names
MYSQL_DATABASE=appdb
POSTGRES_DB=appdb

# Application Settings
DOMAIN=localhost
ADMIN_EMAIL=admin@localhost
"@

# Save to sample file
$envContent | Out-File -FilePath "sample.env" -Encoding UTF8

Write-Host "✅ Created sample.env file" -ForegroundColor Green
Write-Host ""

Write-Host "🔧 Security Checklist:" -ForegroundColor Cyan
Write-Host ""
Write-Host "□ 1. Copy sample.env to .env in each service directory" -ForegroundColor White
Write-Host "□ 2. Update docker-compose.yml files to use env_file" -ForegroundColor White
Write-Host "□ 3. Remove hard-coded passwords from YAML files" -ForegroundColor White
Write-Host "□ 4. Remove database port exposure (3307:3306)" -ForegroundColor White
Write-Host "□ 5. Update base images to latest versions" -ForegroundColor White
Write-Host "□ 6. Enable HTTPS for web services" -ForegroundColor White
Write-Host "□ 7. Add .env to .gitignore" -ForegroundColor White
Write-Host "□ 8. Disable ALLOW_EMPTY_PASSWORD in MariaDB" -ForegroundColor White
Write-Host "□ 9. Change POSTGRES_HOST_AUTH_METHOD from 'trust'" -ForegroundColor White
Write-Host "□ 10. Add security contexts to containers" -ForegroundColor White
Write-Host ""

Write-Host "📋 Next Steps:" -ForegroundColor Yellow
Write-Host "1. Review SECURITY_ANALYSIS.md for detailed vulnerabilities"
Write-Host "2. Copy sample.env to each service directory as .env"
Write-Host "3. Update docker-compose.yml files to reference environment variables"
Write-Host "4. Test each service after security updates"
Write-Host ""

Write-Host "🔐 Example docker-compose.yml update:" -ForegroundColor Cyan
Write-Host @"
services:
  db:
    image: mysql:8.0  # Updated version
    env_file:
      - .env
    environment:
      MYSQL_ROOT_PASSWORD: `${MYSQL_ROOT_PASSWORD}
      MYSQL_PASSWORD: `${MYSQL_PASSWORD}
      MYSQL_USER: `${MYSQL_USER}
      MYSQL_DATABASE: `${MYSQL_DATABASE}
    # Remove port exposure for security
    # ports:
    #   - 3307:3306
"@ -ForegroundColor Gray

Write-Host ""
Write-Host "⚠️  IMPORTANT: Never commit .env files to version control!" -ForegroundColor Red
Write-Host "   Add .env to your .gitignore file" -ForegroundColor Red
Write-Host ""
Write-Host "✅ Security fix helper completed!" -ForegroundColor Green
