# Use Arch Linux as the base image
FROM archlinux:latest

# Update packages
RUN pacman -Syu --noconfirm && pacman -S --noconfirm \
	base-devel \
	git \
	sudo \
	vim \
	wget \
	zsh

# Create a non-root user for running Tor
RUN useradd -m -s /bin/bash toruser \
    && passwd -d toruser \
    && echo 'toruser ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/toruser

# Switch to the non-root user
USER toruser

# Set working directory
WORKDIR /home/toruser

# Copy the torrc file
COPY torrc /etc/tor/torrc

# Expose the Tor port
EXPOSE 9001
EXPOSE 9051

# Run Tor
CMD ["tor"]
