FROM ubuntu:latest

# 1. Install necessary core system tools
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    ca-certificates \
    nano \
    git \
    && rm -rf /var/lib/apt/lists/*

# 2. Inject custom nano formatting configurations directly into the base image
RUN echo "set linenumbers" >> /root/.nanorc && \
    echo "set softwrap" >> /root/.nanorc && \
    echo "set tabsize 2" >> /root/.nanorc && \
    echo "set indicator" >> /root/.nanorc && \
    echo "set minibar" >> /root/.nanorc && \
    echo "set stateflags" >> /root/.nanorc && \
    echo "set constantshow" >> /root/.nanorc

# 3. Permanently route the executable path to the volume folder
ENV PATH="/data/bin:${PATH}"

# 4. REDIRECT CONFIGS TO PERSISTENT VOLUME
ENV XDG_CONFIG_HOME="/data/.config"
ENV HOME="/data"

# Set the active landing hub to the persistent volume drive
WORKDIR /data

CMD ["sleep", "infinity"]

