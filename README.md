# cuda-ct-pipeline

GPU-accelerated CT scan preprocessing pipeline for intracranial hemorrhage detection using CUDA, OpenCV, and C++.

## Overview

This project implements a high-performance image preprocessing pipeline for CT scan data from the [PhysioNet CT Hemorrhage dataset](https://physionet.org/). All heavy computation runs on the GPU using CUDA, with OpenCV handling image I/O and visualization.

The pipeline covers the full preprocessing workflow needed before any downstream detection or segmentation task:

- DICOM loading and raw Hounsfield Unit (HU) extraction
- CT windowing and normalization on the GPU
- Parallel image filtering and edge detection
- Hemorrhage region preprocessing and preparation for inference

## Tech stack

- **CUDA 12.4** — parallel kernel execution on the GPU
- **C++17** — host-side logic and pipeline orchestration
- **OpenCV 4.5.4** — image I/O, visualization, and CPU-side utilities
- **CMake** — build system
- **Docker** — reproducible dev environment (Ubuntu 22.04 + CUDA 12.4)

## Hardware

Developed and tested on an NVIDIA Quadro P2000 (Pascal, SM 6.1, 4GB VRAM).
Requires any CUDA-capable GPU with compute capability 6.0+.

## Project structure

```
cuda-ct-pipeline/
├── src/
│   └── main.cu         # Entry point
├── include/            # Header files
├── data/               # Sample inputs (not tracked)
├── build/              # Compiled binaries (not tracked)
├── .devcontainer/
│   └── devcontainer.json
├── CMakeLists.txt
├── Dockerfile
├── docker-compose.yml
└── README.md
```

## Getting started

### Prerequisites

- Docker Desktop with WSL2 backend (Windows) or Docker Engine (Linux)
- NVIDIA driver 550+ on the host
- NVIDIA Container Toolkit

### Build and run

```bash
# Clone the repo
git clone https://github.com/<your-username>/cuda-ct-pipeline.git
cd cuda-ct-pipeline

# Build the dev image (first time only)
docker build -t ct_hemorrhage:dev .

# Build the project
docker compose run --rm dev bash -c "cmake -B build -S . && cmake --build build"

# Run
docker compose run --rm dev ./build/ct_hemorrhage
```

### VS Code Dev Container

Open the project in VS Code and run **"Dev Containers: Reopen in Container"** (`Ctrl+Shift+P`). This attaches VS Code directly into the container with full IntelliSense, CMake integration, and CUDA support.

## Dataset

This project uses the **PhysioNet Computed Tomography Images for Intracranial Hemorrhage Detection and Segmentation** dataset.

Access requires a PhysioNet account and credentialed data use agreement:
https://physionet.org/content/ct-ich/1.3.1/

Data files are not included in this repository.

## Roadmap

- [x] Project setup and dev environment
- [ ] DICOM loader and HU extraction
- [ ] GPU CT windowing kernel
- [ ] Parallel normalization and resizing
- [ ] Convolution and edge detection kernels
- [ ] Shared memory optimization pass
- [ ] OpenCV visualization overlay
- [ ] End-to-end pipeline benchmark

## License

MIT
