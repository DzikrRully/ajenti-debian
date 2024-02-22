# Use the latest version of Debian as the base image
FROM debian:latest

# Update the system and install necessary packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    python3 python3-pip python3-lxml python3-dev libffi-dev libssl-dev libjpeg-dev libpng-dev uuid-dev python3-dbus

# Install Ajenti
RUN pip3 install ajenti-panel ajenti.plugin.dashboard ajenti.plugin.settings ajenti.plugin.plugins

# Expose the Ajenti port
EXPOSE 8000

# Start Ajenti when the container launches
CMD ["ajenti-panel", "-d"]
