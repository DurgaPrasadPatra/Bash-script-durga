#!/bin/bash
#####################################
#Author: Durga-Devops
#Date:29-09-24
#version:v 0.0.1
#Installs and confucgures AWS CLI v2
# Shell script to check and install AWS CLI, update system, and configure AWS CLI
#####################################

# Function to install AWS CLI
install_aws_cli() {
    echo "Installing AWS CLI V2..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    
    # Verify the installation
    if command -v aws &> /dev/null
    then
        echo "AWS CLI installed successfully."
    else
        echo "AWS CLI installation failed."
        exit 1
    fi
}

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null
then
    # Update the system
    echo "Updating the system..."
    sudo apt update -y
    sudo apt upgrade -y
    #echo "AWS CLI is not installed. "
    echo "AWS CLI - INSTALATION BEGINS..."
    install_aws_cli
else
    echo "AWS CLI is already installed."
fi



# Configure AWS CLI if not already configured
if ! aws configure list &> /dev/null
then
    echo "AWS CLI is not configured. Configuring now entering credntials.."
    aws configure
else
    echo "AWS CLI is already configured."
fi

echo "Script completed successfully."
