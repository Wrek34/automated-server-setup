#!/bin/bash

# Automated Server Setup Script
# Author: Wrek
# Description: This script automates the setup of a web server environment on a fresh Linux installation.
# Version: 1.2

# Exit immediately if a command exits with a non-zero status


# Default values
INSTALL_NGINX=true
INSTALL_PHP=true
INSTALL_MYSQL=true
CONFIGURE_FIREWALL=true

# Function to display usage information
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  --no-nginx        Skip Nginx installation"
    echo "  --no-php          Skip PHP installation"
    echo "  --no-mysql        Skip MySQL installation"
    echo "  --no-firewall     Skip firewall configuration"
    echo "  --help            Display this help message"
}

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --no-nginx) INSTALL_NGINX=false ;;
        --no-php) INSTALL_PHP=false ;;
        --no-mysql) INSTALL_MYSQL=false ;;
        --no-firewall) CONFIGURE_FIREWALL=false ;;
        --help) usage; exit 0 ;;
        *) echo "Unknown parameter passed: $1"; usage; exit 1 ;;
    esac
    shift
done

# ... (keep existing functions: log_message, check_root, update_system)

install_nginx() {
    if $INSTALL_NGINX; then
        log_message "Installing Nginx web server..."
        apt install -y nginx
        systemctl enable nginx
        systemctl start nginx
    else
        log_message "Skipping Nginx installation."
    fi
}

install_php() {
    if $INSTALL_PHP; then
        log_message "Installing PHP and necessary modules..."
        apt install -y php-fpm php-mysql
        systemctl enable php7.4-fpm
        systemctl start php7.4-fpm
    else
        log_message "Skipping PHP installation."
    fi
}

install_mysql() {
    if $INSTALL_MYSQL; then
        log_message "Installing MySQL..."
        apt install -y mysql-server
        systemctl enable mysql
        systemctl start mysql
        
        log_message "Securing MySQL installation..."
        mysql_secure_installation
    else
        log_message "Skipping MySQL installation."
    fi
}

configure_firewall() {
    if $CONFIGURE_FIREWALL; then
        log_message "Configuring firewall..."
        apt install -y ufw
        ufw allow 'Nginx Full'
        ufw allow 'OpenSSH'
        ufw --force enable
    else
        log_message "Skipping firewall configuration."
    fi
}

create_sample_page() {
    if $INSTALL_PHP && $INSTALL_NGINX; then
        log_message "Creating a sample index.php file..."
        echo "<?php phpinfo(); ?>" > /var/www/html/index.php
    else
        log_message "Skipping sample page creation (Nginx or PHP not installed)."
    fi
}

# Main execution
check_root
update_system
install_nginx
install_php
install_mysql
configure_firewall
create_sample_page

log_message "Server setup completed successfully!"