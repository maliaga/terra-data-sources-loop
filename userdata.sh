#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<html><body><h1>Mario Aliaga y su hijo Rafael Aliaga</h1></body></html>" | sudo tee /var/www/html/index.html