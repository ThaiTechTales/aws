#!/bin/bash
yum install -y amazon-ssm-agent # Install SSM agent
yum update -y                   # Update the OS

systemctl start amazon-ssm-agent  # Start SSM agent
systemctl enable amazon-ssm-agent # Enable SSM agent to start on boot

# Install the Amazon Inspector agent
wget https://inspector-agent.amazonaws.com/linux/latest/install # Download the installation script
sudo bash install # Run the installation script

# Start the Amazon Inspector agent
sudo /etc/init.d/awsagent start