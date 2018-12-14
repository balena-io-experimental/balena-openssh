# This first line selects our base image. In this instance we use the dockerfile templates,
# this means the appropriate image gets picked for instance on rpi3, this would end up
# resolving to resin/raspberrypi3-python:latest
FROM resin/%%RESIN_MACHINE_NAME%%-debian
MAINTAINER Shaun Mulligan <shaun@balena.io>

# here we install apt dependencies. We also remove the apt lists in the same step,
# this reduces the size of the docker image.
RUN apt-get update && apt-get install -yq --no-install-recommends \
    openssh-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# here we set up the config for openSSH.
RUN mkdir /var/run/sshd \
    && echo 'root:balena' | chpasswd \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

# We set the working directory for the next few commands
WORKDIR /usr/src/app

# here we copy all the root of our repo into the containers WORKDIR
COPY . ./

# Enable systemd init system in the container, so it never closes
ENV INITSYSTEM on

# Start.sh will run when the container starts
CMD ["./src/start.sh"]
