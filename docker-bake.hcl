variable "REGISTRY" {
    default = "docker.io"
}

variable "REGISTRY_USER" {
    default = "tbrewer937"
}

variable "APP" {
    default = "forge_comfy"
}

variable "RELEASE" {
    default = "1.10.1"
}

variable "VERSION" {
     default = "1.0.0"
}

variable "CU_VERSION" {
    default = "124"
}

variable "BASE_IMAGE_REPOSITORY" {
    default = "ashleykza/runpod-base"
}

variable "BASE_IMAGE_VERSION" {
    default = "2.4.2"
}

variable "CUDA_VERSION" {
    default = "12.4.1"
}

variable "TORCH_VERSION" {
    default = "2.6.0"
}

variable "PYTHON_VERSION" {
    default = "3.10"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["${REGISTRY}/${REGISTRY_USER}/${APP}:${VERSION}"]
    args = {
        RELEASE = "${RELEASE}"
        BASE_IMAGE = "${BASE_IMAGE_REPOSITORY}:${BASE_IMAGE_VERSION}-python${PYTHON_VERSION}-cuda${CUDA_VERSION}-torch${TORCH_VERSION}"
        INDEX_URL = "https://download.pytorch.org/whl/cu${CU_VERSION}"
        TORCH_VERSION = "${TORCH_VERSION}+cu${CU_VERSION}"
        XFORMERS_VERSION = "0.0.29.post3"
        WEBUI_VERSION = "v${RELEASE}"
        CONTROLNET_COMMIT = "56cec5b2958edf3b1807b7e7b2b1b5186dbd2f81"
        CIVITAI_BROWSER_PLUS_VERSION = "v3.6.0"
        APP_MANAGER_VERSION = "1.2.2"
        CIVITAI_DOWNLOADER_VERSION = "2.1.0"
        VENV_PATH = "/workspace/venvs/a1111"
    }
    platforms = ["linux/amd64"]
}
