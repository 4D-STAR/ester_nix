# Ester Nix

[Evolution STEllaire en Rotation (Ester)](https://github.com/ester-project/ester) is a 2d stellar evolution code. This repo provides a script to build a C++/Fortran/Python development environment to compile and execute ster using the [Nix](https://nix.dev) ecosystem. 

## Installation and usage

The only requirement is Nix itself. Install Nix following: https://nix.dev/install-nix

After Nix has been installed correctly, cd to the root of this directory and execute

```bash
nix develop
```

This will mount the development environment and install ester. Upon finishing you will be in a bash shell with the following commands available: `star1d`, `star2d`, `star_evol`

## Why Nix

The lock file in this directory guarantees consistent a development environment, greatly facilitating the installation of ester across different distributions

## Notes and TODOs

- Only Ester's `evolution` branch was tested
- A small patch on Ester's `CMakeList.txt` was needed to find `numpy` include dirs. Additionally, gfortran > 9.5 required compiling with `-fallow-argument-mismatch -fallow-invalid-boz`.
- GCC version 12.2.0 was used. Versions 13 and above require more changes in Ester to compile successfully
- Only Openblas was tested. TODO: Test MKL
- TODO: Create an ester flake
- TODO: Test build on MacOS
- TODO: Test build on Windows WSL

