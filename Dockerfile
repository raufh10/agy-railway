FROM ubuntu:latest

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Run a sleep loop to keep the container alive so you can connect to it or execute your script here.
CMD ["sleep", "infinity"]
