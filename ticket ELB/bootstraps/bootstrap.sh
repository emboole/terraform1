#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

sudo echo "RewriteEngine on" >> /etc/httpd/conf/httpd.conf
sudo echo "RewriteRule \"^/api/v1$\" \"/index.html\" [L,R]" >> /etc/httpd/conf/httpd.conf
sudo systemctl restart httpd.service

sudo aws s3 cp s3://terraform-onboarding-bucketn-aguante/index.html /var/www/html/index.html