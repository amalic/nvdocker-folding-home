[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/amalic/Jupyterlab/blob/master/LICENSE)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/amalic/nvdocker-folding-home)
[![Docker Pulls](https://img.shields.io/docker/pulls/amalic/nvdocker-folding-home.svg)](https://hub.docker.com/r/amalic/nvdocker-folding-home/)

# Folding@Home docker image based on nvidia/cuda

## Prerequisites
Make sure you have properly installed and configured Docker and NVidia Docker

## Build
```
docker build -t amalic/nvdocker-folding-home .
```

## Run
```
docker run -t --gpus all -p 36330:36330 -p 7396:7396 amalic/nvdocker-folding-home
```
