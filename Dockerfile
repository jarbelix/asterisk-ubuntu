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

# # Disable interactive mode for debian packages only in build stage
# ARG DEBIAN_FRONTEND=noninteractive

RUN <<EOF
apt-get update
apt-get install -y asterisk asterisk-mysql asterisk-mp3 asterisk-ooh323 lame htop tree iputils-ping curl jq
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF

WORKDIR $_ETC

COPY root/* /root/
COPY --chmod=u+x etc/profile.d/asterisk.sh /etc/profile.d/asterisk.sh

COPY --chown=asterisk:asterisk etc/asterisk/*.conf $_ETC/
COPY --chown=asterisk:asterisk etc/asterisk/manager.d/*.conf $_ETC/manager.d/

# ADD https://github.com/jarbelix/asterisk-ubuntu.git /opt/asterisk-ubuntu

# # Expose necessary ports
# EXPOSE 18083/tcp 5060/tcp 1-65530/udp

# # Volumization
# VOLUME ["/etc/asterisk", "/var/lib/asterisk", "/var/log/asterisk"]

# # Set the default user
# USER asterisk
 
# # Run with ENTRYPOINT
# ENTRYPOINT ["asterisk", "-f"]

# # Set the default command
CMD ["asterisk", "-f"]
