#!/usr/bin/env bash
set -e

# Clone the git repo of ForgeUI (updated A1111 fork)
git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git stable-diffusion-webui
cd /stable-diffusion-webui


# Create and activate venv
python3 -m venv --system-site-packages /venv
source /venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install torch and xformers
pip3 install --no-cache-dir torch==${TORCH_VERSION} torchvision torchaudio --index-url ${INDEX_URL}
pip3 install --no-cache-dir xformers==${XFORMERS_VERSION} --index-url ${INDEX_URL}
pip3 install tensorflow[and-cuda]

# Install A1111
pip3 install -r requirements_versions.txt
python3 -c "from launch import prepare_environment; prepare_environment()" --skip-torch-cuda-test

# Clone the Automatic1111 Extensions
git clone --depth=1 https://codeberg.org/Gourieff/sd-webui-reactor.git extensions/sd-webui-reactor
git clone --depth=1 https://github.com/zanllp/sd-webui-infinite-image-browsing.git extensions/infinite-image-browsing
git clone --depth=1 https://github.com/civitai/sd_civitai_extension.git extensions/sd_civitai_extension
git clone --depth=1 https://github.com/BlafKing/sd-civitai-browser-plus.git extensions/sd-civitai-browser-plus

# Install dependencies for various extensions
cd /stable-diffusion-webui/extensions/sd-webui-reactor
pip3 install -r requirements.txt
pip3 install onnxruntime-gpu
cd /stable-diffusion-webui/extensions/infinite-image-browsing
pip3 install -r requirements.txt
cd /stable-diffusion-webui/extensions/sd_civitai_extension
pip3 install -r requirements.txt

cd /stable-diffusion-webui/extensions/sd-civitai-browser-plus
pip3 install send2trash beautifulsoup4 ZipUnicode fake-useragent packaging pysocks
deactivate

# Add inswapper model for the ReActor extension
mkdir -p /stable-diffusion-webui/models/insightface
cd /stable-diffusion-webui/models/insightface
wget -O inswapper_128.onnx "https://huggingface.co/ashleykleynhans/inswapper/resolve/main/inswapper_128.onnx?download=true"

# Configure ReActor to use the GPU instead of the CPU
echo "CUDA" > /stable-diffusion-webui/extensions/sd-webui-reactor/last_device.txt
