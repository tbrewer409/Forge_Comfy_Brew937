ARG BASE_IMAGE
FROM ${BASE_IMAGE}

# Copy the build scripts
WORKDIR /
COPY --chmod=755 build/* ./

# Install A1111
ARG TORCH_VERSION
ARG XFORMERS_VERSION
ARG INDEX_URL
ARG WEBUI_VERSION
ARG CONTROLNET_COMMIT
ARG CIVITAI_BROWSER_PLUS_VERSION

RUN /install.sh
RUN /install_comfyui.sh

# Install Application Manager
WORKDIR /
ARG APP_MANAGER_VERSION
RUN git clone https://github.com/ashleykleynhans/app-manager.git /app-manager && \
    cd /app-manager && \
    npm install
COPY app-manager/config.json /app-manager/public/config.json

# Install CivitAI Model Downloader
ARG CIVITAI_DOWNLOADER_VERSION
RUN git clone https://github.com/ashleykleynhans/civitai-downloader.git && \
    cd civitai-downloader && \
    git checkout tags/${CIVITAI_DOWNLOADER_VERSION} && \
    cp download.py /usr/local/bin/download-model && \
    chmod +x /usr/local/bin/download-model && \
    cd .. && \
    rm -rf civitai-downloader

# Copy Stable Diffusion Web UI config files
COPY a1111/relauncher.py a1111/webui-user.sh /stable-diffusion-webui/


# Remove existing SSH host keys
RUN rm -f /etc/ssh/ssh_host_*

# NGINX Proxy
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Set template version
ARG RELEASE
ENV TEMPLATE_VERSION=${RELEASE}

# Set the venv path
ARG VENV_PATH
ENV VENV_PATH=${VENV_PATH}

# Copy the scripts
WORKDIR /
COPY --chmod=755 scripts/* ./

# Start the container
SHELL ["/bin/bash", "--login", "-c"]
CMD [ "/start.sh" ]
