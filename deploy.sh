#!/bin/bash
# Update the package list
sudo apt update

# Install dependencies (example for Node.js)
sudo apt install -y git curl

# Install Node.js (adjust if using something else)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Clone your project repo (replace with your repo)
git clone https://github.com/pratikwayal01/To_Do_WebApp.git /home/ubuntu/app

# Move into your app directory
cd /home/ubuntu/app

# Install dependencies & run the app
npm install
npm start &
