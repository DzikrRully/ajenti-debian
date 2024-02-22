# Use the official Ubuntu image as the base
FROM ubuntu:latest

# Update the system and install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
    gnupg \
    apt-transport-https

# Add the Ajenti repository and key
RUN wget http://repo.ajenti.org/debian/key -O- | apt-key add -
RUN echo "deb http://repo.ajenti.org/ng/debian main main ubuntu" >> /etc/apt/sources.list

# Install Ajenti
RUN apt-get update && apt-get install -y ajenti

# Expose the Ajenti port
EXPOSE 8000

# Start Ajenti
CMD ["ajenti-panel"]
