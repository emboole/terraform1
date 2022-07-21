#!/bin/bash
yum update -y
sudo yum install nginx
sudo /etc/init.d/nginx start

aws s3 cp s3://my_bucket/my_folder/index.html /var/www/html/index.html