#!/bin/sh

set -euxo pipefail

echo "This script can be used to install InfluxDB. This script has been tested with CentOS 7"

readonly DEFAULT_TEMP_CONFIG_FILE_PATH="/tmp/config/influxdb.conf"
readonly DEFAULT_CONFIG_FILE_PATH="/etc/influxdb/influxdb.conf"

#################### run package update ##################
sudo yum update -y
sudo yum install wget nvme-cli -y

#################### install influxdb ####################
#add InfluxDB yum repo to only get stable releases
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF

#instal InfluxDB
sudo yum install -y influxdb-1.7.6

#################### config file changes #################
# Move config file to influxdb correct config location
sudo mv "$DEFAULT_TEMP_CONFIG_FILE_PATH" "$DEFAULT_CONFIG_FILE_PATH"

# Change owner of configuration files to influxdb user
sudo chown -R influxdb:influxdb "$(dirname "${DEFAULT_CONFIG_FILE_PATH}")"

############## stop influxdb #################

#start InfluxDB
sudo systemctl stop influxdb