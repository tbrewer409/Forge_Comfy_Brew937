#!/usr/bin/env bash
echo " Starting Stable Diffusion Web UI"
cd /workspace/stable-diffusion-webui
export HF_HOME="/workspace"
export PYTHONUNBUFFERED=1
nohup ./webui.sh -f > /workspace/logs/Forge.log 2>&1 &
echo " Stable Diffusion Web UI started"
echo " Log file: /workspace/logs/Forge.log"
