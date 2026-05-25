FROM ubuntu:latest

# 1. Install necessary core system tools
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    ca-certificates \
    nano \
    git \
    && rm -rf /var/lib/apt/lists/*

# 2. Let the script handle the target path and install directly
RUN curl -fsSL https://antigravity.google/cli/install.sh | bash -s -- --dir /root/.local/bin

# 3. Permanently wire the binary path to the global environment
ENV PATH="/root/.local/bin:${PATH}"

# 4. Inject custom nano formatting configuration lines
RUN echo "set linenumbers" >> /root/.nanorc && \
    echo "set softwrap" >> /root/.nanorc && \
    echo "set tabsize 2" >> /root/.nanorc && \
    echo "set indicator" >> /root/.nanorc && \
    echo "set minibar" >> /root/.nanorc && \
    echo "set stateflags" >> /root/.nanorc && \
    echo "set constantshow" >> /root/.nanorc

WORKDIR /app

CMD ["sleep", "infinity"]

