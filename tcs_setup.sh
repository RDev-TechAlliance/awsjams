#!/bin/bash
# Script file to be used to for container security

#############
#Copy latest code from tenable
echo "Downloading..."
curl https://www.tenable.com/downloads/api/v2/pages/tenable-cs/files/tenable.cs-cli_latest_Linux_x86_64.tar.gz --output tenable.cs-cli_latest_Linux_x86_64.tar.gz

# extract it
echo "Extracting..."
tar xzf tenable.cs-cli_latest_Linux_x86_64.tar.gz

# make it an executable
chmod +x tcs
sudo mv tcs /usr/local/bin/

############
# Download the latest Terrascan
$ curl -L "$(curl -s https://api.github.com/repos/tenable/terrascan/releases/latest | grep -o -E "https://.+?_Darwin_x86_64.tar.gz")" > terrascan.tar.gz
$ tar -xf terrascan.tar.gz terrascan && rm terrascan.tar.gz
$ sudo install terrascan /usr/local/bin && rm terrascan


# Download the latest IaC Scanner cli

curl -o accurics_linux https://downloads.accurics.com/cli/latest/accurics_linux
chmod +x accurics_linux
sudo mv ./accurics_linux /usr/local/bin && rm accurics_linux


