# Use the latest Debian base image
FROM debian:latest

# Update the system and install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl gnupg2

# Add the Ajenti repository
RUN echo 'deb http://repo.ajenti.org/debian main main debian' >> /etc/apt/sources.list && \
    wget http://repo.ajenti.org/debian/key -O- | apt-key add -

# Install Ajenti
RUN apt-get update && apt-get install -y ajenti

# Expose the Ajenti port
EXPOSE 8000

# Start Ajenti
CMD ["ajenti-panel", "-d"]
