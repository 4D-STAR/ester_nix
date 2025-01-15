# Ester Nix

[Evolution STEllaire en Rotation (Ester)](https://github.com/ester-project/ester) is a 2d stellar evolution code. This repo provides a script to build a C++/Fortran/Python development environment to compile and execute ester using the [Nix](https://nix.dev) ecosystem. 

## Pre-requisites

The only requirement is Nix itself. Install Nix following the instructions at https://nixos.org/download/.

Alternatively, you can use one-liner for installing Determinate Nix 

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
``` 

Test your installation by running 

```
nix --version
```

which should return something like `nix (Nix) 2.24.1`.

## Using this repo

Clone or download this repo. Then open a terminal, navigate to the root of this repository and execute

```
nix develop --extra-experimental-features nix-command --extra-experimental-features flakes
```

This will instantiate the development environment and compile Ester's `evolution` branch. Upon finishing, you will be in a bash shell with the following commands available: `star1d`, `star2d`, `star_evol`. 


## Why Nix

The lock file in this directory guarantees a consistent development environment, greatly facilitating the installation of ester across different distributions

## Notes and TODOs
-The build has been tested in Ubuntu, Arch Linux, Rocky Linux, MacOS(M1) and in Windows through the [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)

