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

# --------- Clone and install Extensions ---------

# ComfyUI Manager
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
pip install -r ComfyUI-Manager/requirements.txt

# rgthree-comfy
git clone https://github.com/rgthree/rgthree-comfy.git
pip install -r rgthree-comfy/requirements.txt

# ComfyUI-Impact-Pack
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git
pip install -r ComfyUI-Impact-Pack/requirements.txt

# comfyui_controlnet_aux
git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git
pip install -r comfyui_controlnet_aux/requirements.txt

# ComfyUI-Easy-Use
git clone https://github.com/yolain/ComfyUI-Easy-Use.git
pip install -r ComfyUI-Easy-Use/requirements.txt

# ComfyUI-Florence2
git clone https://github.com/kijai/ComfyUI-Florence2.git
pip install -r ComfyUI-Florence2/requirements.txt

# was-node-suite-comfyui
git clone https://github.com/WASasquatch/was-node-suite-comfyui.git
pip install -r was-node-suite-comfyui/requirements.txt

# ComfyUI_essentials
git clone https://github.com/cubiq/ComfyUI_essentials.git
pip install -r ComfyUI_essentials/requirements.txt

# ComfyUI-Detail-Daemon
git clone https://github.com/Jonseed/ComfyUI-Detail-Daemon.git
pip install -r ComfyUI-Detail-Daemon/requirements.txt

# comfyui-reactor-node (Codeberg)
git clone https://codeberg.org/Gourieff/comfyui-reactor-node.git
pip install -r comfyui-reactor-node/requirements.txt

# ComfyUI_JPS-Nodes
git clone https://github.com/JPS-GER/ComfyUI_JPS-Nodes.git

# ComfyUI_Comfyroll_CustomNodes
git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git

# ComfyUI-Logic
git clone https://github.com/theUpsider/ComfyUI-Logic.git

# --------- Wrap Up ---------
cd /ComfyUI
deactivate
