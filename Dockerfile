# Use syntax version 1.3-labs for Dockerfile
# syntax=docker/dockerfile:1.3-labs

# Use the Ubuntu latest as the base image
ARG VERSION=latest
FROM ubuntu:$VERSION
ARG VERSION

# Define environment variables
ENV _ETC="/etc/asterisk"

# Set the image metadata
LABEL maintainer="Tiozão do Linux <jarbas.junior@gmail.com>"
LABEL author="Jarbas <jarbas.junior@gmail.com>"

# Install necessary packages
# Run the following commands inside the container:
# 1. Update the package lists for upgrades and new package installations
# 2. Install the asterisk package
# 3. Remove the package lists to reduce the image size

# Disable interactive mode for debian packages only in build stage
ARG DEBIAN_FRONTEND=noninteractive  

RUN <<EOF
apt-get update
apt-get install -y asterisk asterisk-mysql asterisk-mp3 asterisk-ooh323 lame htop tree iputils-ping
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF

WORKDIR $_ETC

ADD root/.bashrc /root/.bashrc
ADD etc/profile.d/asterisk.sh /etc/profile.d/asterisk.sh
ADD etc/asterisk/manager.conf $_ETC/manager.conf
ADD etc/asterisk/manager.d/ami.conf $_ETC/manager.d/ami.conf
ADD etc/asterisk/http.conf $_ETC/http.conf
ADD etc/asterisk/ari.conf $_ETC/ari.conf

# Expose necessary ports
EXPOSE 18083/tcp 5060/tcp 1-65530/udp
 
# # Run with ENTRYPOINT

# ENTRYPOINT ["asterisk", "-f"]
# # Set the default command
CMD ["asterisk", "-f"]
