# Folding@Home docker image based on nvidia/cuda

## Prerequisites
Make sure you have properly installed and configured Docker and NVidia Docker

## Build
```
docker build -t amalic/nvdocker-folding-home .
```

## Run
```
docker run -it --gpus all -p 36330:36330 -p 7396:7396 amalic/nvdocker-folding-home
```