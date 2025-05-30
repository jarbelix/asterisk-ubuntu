# Use the Ubuntu latest as the base image
FROM ubuntu:latest
 
# Run the following commands inside the container:
# 1. Update the package lists for upgrades and new package installations
# 2. Install the asterisk package
# 3. Remove the package lists to reduce the image size
#
# This is all run in a HEREDOC; see
# https://www.docker.com/blog/introduction-to-heredocs-in-dockerfiles/
# for more details.

RUN <<EOF
apt-get update;
apt-get install -y asterisk asterisk-mysql asterisk-mp3 asterisk-ooh323 lame htop tree iputils-ping;
apt-get clean;
rm -rf /var/lib/apt/lists/*;
EOF

WORKDIR /etc/asterisk

ADD root/.bashrc /root/.bashrc
ADD etc/profile.d/asterisk.sh /etc/profile.d/asterisk.sh
ADD etc/asterisk/manager.conf /etc/asterisk/manager.conf
ADD etc/asterisk/manager.d/ami.conf /etc/asterisk/manager.d/ami.conf
ADD etc/asterisk/http.conf /etc/asterisk/http.conf
ADD etc/asterisk/ari.conf /etc/asterisk/ari.conf

# Expose necessary ports
EXPOSE 18083/tcp 5060/tcp 1-65530/udp
 
# # Run with ENTRYPOINT
# ENTRYPOINT ["/bin/bash"]

# # Set the default command
CMD ["asterisk", "-f"]
