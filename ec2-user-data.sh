#!/bin/bash
# Update the OS
apt update -y

# Install Apache (httpd) and Git
apt install -y apache2 git

# Enable and start Apache
systemctl enable apache2


# Clone the public GitHub repo
cd /tmp
git clone https://github.com/dimuthnc/caap.git

# Copy the HTML file to the Apache web directory
cp caap/index.html /var/www/html/index.html

# Set correct permissions
chown www-data:www-data /var/www/html/index.html
chmod 644 /var/www/html/index.html
systemctl start apache2