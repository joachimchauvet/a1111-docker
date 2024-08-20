variable "REGISTRY" {
    default = "docker.io"
}

variable "REGISTRY_USER" {
    default = "ashleykza"
}

variable "APP" {
    default = "a1111"
}

variable "RELEASE" {
    default = "1.9.4"
}

variable "CU_VERSION" {
    default = "121"
}

variable "BASE_IMAGE_REPOSITORY" {
    default = "ashleykza/runpod-base"
}

variable "BASE_IMAGE_VERSION" {
    default = "2.0.0"
}

variable "CUDA_VERSION" {
    default = "12.1.1"
}

variable "TORCH_VERSION" {
    default = "2.3.1"
}

variable "PYTHON_VERSION" {
    default = "3.10"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["${REGISTRY}/${REGISTRY_USER}/${APP}:${RELEASE}.post6"]
    args = {
        RELEASE = "${RELEASE}"
        BASE_IMAGE = "${BASE_IMAGE_REPOSITORY}:${BASE_IMAGE_VERSION}-python${PYTHON_VERSION}-cuda${CUDA_VERSION}-torch${TORCH_VERSION}"
        INDEX_URL = "https://download.pytorch.org/whl/cu${CU_VERSION}"
        TORCH_VERSION = "${TORCH_VERSION}+cu${CU_VERSION}"
        XFORMERS_VERSION = "0.0.27"
        WEBUI_VERSION = "v${RELEASE}"
        CONTROLNET_COMMIT = "3ff69b9ea32f59ac866780b19a6465f9b9d28053"
        CIVITAI_BROWSER_PLUS_VERSION = "v3.5.4"
        APP_MANAGER_VERSION = "1.2.1"
        CIVITAI_DOWNLOADER_VERSION = "2.1.0"
        VENV_PATH = "/workspace/venvs/stable-diffusion-webui"
    }
}
