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

# Install Tor
RUN pacman -S --noconfirm tor

# Copy the torrc file
COPY torrc /etc/tor/torrc

# Expose the Tor port
EXPOSE 9001

# Run Tor
CMD ["tor"]
