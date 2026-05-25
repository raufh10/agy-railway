FROM ubuntu:latest

# 1. Install necessary core system tools
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    ca-certificates \
    nano \
    git \
    && rm -rf /var/lib/apt/lists/*

# 2. Inject your custom nano preferences permanently into the image OS layer
RUN echo "set linenumbers" >> /root/.nanorc && \
    echo "set softwrap" >> /root/.nanorc && \
    echo "set tabsize 2" >> /root/.nanorc && \
    echo "set indicator" >> /root/.nanorc && \
    echo "set minibar" >> /root/.nanorc && \
    echo "set stateflags" >> /root/.nanorc && \
    echo "set constantshow" >> /root/.nanorc

# 3. Download and install the Antigravity CLI straight into a safe system binary folder
RUN curl -fsSL https://antigravity.google/cli/install.sh | bash -s -- --dir /usr/local/bin

# 4. Set the landing hub to your persistent app data workspace
WORKDIR /app/data

CMD ["sleep", "infinity"]
