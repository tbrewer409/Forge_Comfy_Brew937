#!/usr/bin/env bash
set -e

# Clone ComfyUI repository into /workspace
git clone https://github.com/tbrewer409/ComfyRepo.git /ComfyUI
cd /ComfyUI

# Create and activate virtual environment
python3 -m venv --system-site-packages /venv_comfyui
source /venv_comfyui/bin/activate

# Upgrade pip and install base dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Make custom_nodes directory if it doesn't exist
mkdir -p custom_nodes
cd custom_nodes

# --------- Clone Extensions ---------

# ComfyUI Manager
git clone https://github.com/ltdrdata/ComfyUI-Manager.git

# rgthree-comfy
git clone https://github.com/rgthree/rgthree-comfy.git

# ComfyUI-Impact-Pack
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git

# comfyui_controlnet_aux
git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git

# ComfyUI-Easy-Use
git clone https://github.com/yolain/ComfyUI-Easy-Use.git

# ComfyUI-Florence2
git clone https://github.com/kijai/ComfyUI-Florence2.git

# was-node-suite-comfyui
git clone https://github.com/WASasquatch/was-node-suite-comfyui.git

# ComfyUI_essentials
git clone https://github.com/cubiq/ComfyUI_essentials.git

# ComfyUI-Detail-Daemon
git clone https://github.com/Jonseed/ComfyUI-Detail-Daemon.git

# comfyui-reactor-node (Codeberg)
git clone https://codeberg.org/Gourieff/comfyui-reactor-node.git

# ComfyUI_JPS-Nodes
git clone https://github.com/JPS-GER/ComfyUI_JPS-Nodes.git

# ComfyUI_Comfyroll_CustomNodes
git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git

# ComfyUI-Logic
git clone https://github.com/theUpsider/ComfyUI-Logic.git

# Install extension requirements in a single step
pip install \
  -r ComfyUI-Manager/requirements.txt \
  -r rgthree-comfy/requirements.txt \
  -r ComfyUI-Impact-Pack/requirements.txt \
  -r comfyui_controlnet_aux/requirements.txt \
  -r ComfyUI-Easy-Use/requirements.txt \
  -r ComfyUI-Florence2/requirements.txt \
  -r was-node-suite-comfyui/requirements.txt \
  -r ComfyUI_essentials/requirements.txt \
  -r ComfyUI-Detail-Daemon/requirements.txt \
  -r comfyui-reactor-node/requirements.txt

# --------- Wrap Up ---------
cd /ComfyUI
deactivate
