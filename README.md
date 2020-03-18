[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/amalic/Jupyterlab/blob/master/LICENSE)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/amalic/nvdocker-folding-home)
[![Docker Pulls](https://img.shields.io/docker/pulls/amalic/nvdocker-folding-home.svg)](https://hub.docker.com/r/amalic/nvdocker-folding-home/)

# Folding@Home docker image based on nvidia/opencl

## Prerequisites
Make sure you have properly installed and configured Docker and [NVidia Docker](https://github.com/NVIDIA/nvidia-docker). Microsoft Windows is not supported by NVidia Docker see [Platform Support](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#platform-support). Please use the native client instead.

## Build
```
docker build -t amalic/nvdocker-folding-home .
```

## Run
```
docker run -d --restart unless-stopped --gpus all -p 80:7396 -e USERNAME=<FAH_username> amalic/nvdocker-folding-home
```
Inject your own config file by adding following switch 
```
... -v <path to your config xml>:/etc/fahclient/config.xml ...
```
You can monitor the progress via webinterface on http://localhost

*There's a known bug with the web interface. In case the page continues reloading press Ctrl+F5 to clear the caches*

### Environment variables
- USERNAME (default *Anonymous*)
- TEAM (default *0*)
- PASSWORD (default empty string)
- REMOTE_PASSWORD (default *override_me*)
- USE_GPU (default *true*)

### Console log output
Seems that it will run into timeouts while trying to find a server with available work units.
```
Starting fahclient ... OK
22:52:47:</config>
22:52:47:Switching to user fahclient
22:52:47:Connecting to assign1.foldingathome.org:8080
22:52:47:Updated GPUs.txt
22:52:47:Read GPUs.txt
22:52:47:Trying to access database...
22:52:47:Successfully acquired database lock
22:52:47:FS00:Set client configured
22:52:47:Enabled folding slot 00: READY gpu:0:GP102 [GeForce GTX 1080 Ti] 11380
22:52:47:WU00:FS00:Connecting to 65.254.110.245:8080
22:52:48:WU00:FS00:Connecting to 65.254.110.245:8080
22:52:49:WU00:FS00:Assigned to work server 140.163.4.231
22:52:49:WU00:FS00:Requesting new work unit for slot 00: READY gpu:0:GP102 [GeForce GTX 1080 Ti] 11380 from 140.163.4.231
22:52:49:WU00:FS00:Connecting to 140.163.4.231:8080
22:54:29:ERROR:WU00:FS00:Exception: 10002: Received short response, expected 512 bytes, got 0
22:54:29:WU00:FS00:Connecting to 65.254.110.245:8080
22:54:30:WU00:FS00:Assigned to work server 140.163.4.241
22:54:30:WU00:FS00:Requesting new work unit for slot 00: READY gpu:0:GP102 [GeForce GTX 1080 Ti] 11380 from 140.163.4.241
22:54:30:WU00:FS00:Connecting to 140.163.4.241:8080
22:56:40:WARNING:WU00:FS00:WorkServer connection failed on port 8080 trying 80
22:56:40:WU00:FS00:Connecting to 140.163.4.241:80
22:58:51:ERROR:WU00:FS00:Exception: Failed to connect to 140.163.4.241:80: Connection timed out
22:58:51:WU00:FS00:Connecting to 65.254.110.245:8080
22:58:52:WU00:FS00:Assigned to work server 128.252.203.10
22:58:52:WU00:FS00:Requesting new work unit for slot 00: READY gpu:0:GP102 [GeForce GTX 1080 Ti] 11380 from 128.252.203.10
22:58:52:WU00:FS00:Connecting to 128.252.203.10:8080
22:59:05:WU00:FS00:Downloading 29.70MiB
22:59:10:WU00:FS00:Download complete
22:59:10:WU00:FS00:Received Unit: id:00 state:DOWNLOAD error:NO_ERROR project:11760 run:0 clone:104 gen:5 core:0x22 unit:0x0000000580fccb0a5e6d7cc7bd0f9264
22:59:10:WU00:FS00:Downloading core from http://cores.foldingathome.org/v7/lin/64bit/Core_22.fah
22:59:10:WU00:FS00:Connecting to cores.foldingathome.org:80
22:59:10:WU00:FS00:FahCore 22: Downloading 3.58MiB
22:59:13:WU00:FS00:FahCore 22: Download complete
22:59:13:WU00:FS00:Valid core signature
22:59:13:WU00:FS00:Unpacked 9.30MiB to cores/cores.foldingathome.org/v7/lin/64bit/Core_22.fah/FahCore_22
22:59:13:WU00:FS00:Starting
22:59:13:WU00:FS00:Running FahCore: /usr/bin/FAHCoreWrapper /var/lib/fahclient/cores/cores.foldingathome.org/v7/lin/64bit/Core_22.fah/FahCore_22 -dir 00 -suffix 01 -version 705 -lifeline 20 -checkpoint 15 -gpu-vendor nvidia -opencl-platform 0 -opencl-device 0 -cuda-device 0 -gpu 0
22:59:13:WU00:FS00:Started FahCore on PID 33
22:59:13:WU00:FS00:Core PID:37
22:59:13:WU00:FS00:FahCore 0x22 started
22:59:13:WU00:FS00:0x22:*********************** Log Started 2020-03-15T22:59:13Z ***********************
22:59:13:WU00:FS00:0x22:*************************** Core22 Folding@home Core ***************************
22:59:13:WU00:FS00:0x22:       Type: 0x22
22:59:13:WU00:FS00:0x22:       Core: Core22
22:59:13:WU00:FS00:0x22:    Website: https://foldingathome.org/
22:59:13:WU00:FS00:0x22:  Copyright: (c) 2009-2018 foldingathome.org
22:59:13:WU00:FS00:0x22:     Author: John Chodera <john.chodera@choderalab.org> and Rafal Wiewiora
22:59:13:WU00:FS00:0x22:             <rafal.wiewiora@choderalab.org>
22:59:13:WU00:FS00:0x22:       Args: -dir 00 -suffix 01 -version 705 -lifeline 33 -checkpoint 15
22:59:13:WU00:FS00:0x22:             -gpu-vendor nvidia -opencl-platform 0 -opencl-device 0 -cuda-device
22:59:13:WU00:FS00:0x22:             0 -gpu 0
22:59:13:WU00:FS00:0x22:     Config: <none>
22:59:13:WU00:FS00:0x22:************************************ Build *************************************
22:59:13:WU00:FS00:0x22:    Version: 0.0.2
22:59:13:WU00:FS00:0x22:       Date: Dec 6 2019
22:59:13:WU00:FS00:0x22:       Time: 21:20:17
22:59:13:WU00:FS00:0x22: Repository: Git
22:59:13:WU00:FS00:0x22:   Revision: f87d92b58abdf7e6bf2e173cfbc4dc3e837c7042
22:59:13:WU00:FS00:0x22:     Branch: core22
22:59:13:WU00:FS00:0x22:   Compiler: GNU 4.8.2 20140120 (Red Hat 4.8.2-15)
22:59:13:WU00:FS00:0x22:    Options: -std=gnu++98 -O3 -funroll-loops
22:59:13:WU00:FS00:0x22:   Platform: linux2 4.9.87-linuxkit-aufs
22:59:13:WU00:FS00:0x22:       Bits: 64
22:59:13:WU00:FS00:0x22:       Mode: Release
22:59:13:WU00:FS00:0x22:************************************ System ************************************
22:59:13:WU00:FS00:0x22:        CPU: AMD Ryzen Threadripper 1950X 16-Core Processor
22:59:13:WU00:FS00:0x22:     CPU ID: AuthenticAMD Family 23 Model 1 Stepping 1
22:59:13:WU00:FS00:0x22:       CPUs: 32
22:59:13:WU00:FS00:0x22:     Memory: 62.74GiB
22:59:13:WU00:FS00:0x22:Free Memory: 876.11MiB
22:59:13:WU00:FS00:0x22:    Threads: POSIX_THREADS
22:59:13:WU00:FS00:0x22: OS Version: 5.3
22:59:13:WU00:FS00:0x22:Has Battery: false
22:59:13:WU00:FS00:0x22: On Battery: false
22:59:13:WU00:FS00:0x22: UTC Offset: 0
22:59:13:WU00:FS00:0x22:        PID: 37
22:59:13:WU00:FS00:0x22:        CWD: /var/lib/fahclient/work
22:59:13:WU00:FS00:0x22:         OS: Linux 5.3.0-40-generic x86_64
22:59:13:WU00:FS00:0x22:    OS Arch: AMD64
22:59:13:WU00:FS00:0x22:********************************************************************************
22:59:13:WU00:FS00:0x22:Project: 11760 (Run 0, Clone 104, Gen 5)
22:59:13:WU00:FS00:0x22:Unit: 0x0000000580fccb0a5e6d7cc7bd0f9264
22:59:13:WU00:FS00:0x22:Reading tar file core.xml
22:59:13:WU00:FS00:0x22:Reading tar file integrator.xml
22:59:13:WU00:FS00:0x22:Reading tar file state.xml
22:59:13:WU00:FS00:0x22:Reading tar file system.xml
22:59:13:WU00:FS00:0x22:Digital signatures verified
22:59:13:WU00:FS00:0x22:Folding@home GPU Core22 Folding@home Core
22:59:13:WU00:FS00:0x22:Version 0.0.2
22:59:21:WU00:FS00:0x22:Completed 0 out of 2000000 steps (0%)
22:59:21:WU00:FS00:0x22:Temperature control disabled. Requirements: single Nvidia GPU, tmax must be < 110 and twait >= 900
23:00:10:WU00:FS00:0x22:Completed 20000 out of 2000000 steps (1%)
23:01:00:WU00:FS00:0x22:Completed 40000 out of 2000000 steps (2%)
```
