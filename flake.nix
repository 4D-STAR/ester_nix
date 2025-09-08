{
  description = "An development environment to compile and run Ester";

  inputs = 
    {
      #nixpkgs.url = "github:nixos/nixpkgs/38b7104fd1db0046ceed579f5dab4e62f136589c"; # GCC12
      nixpkgs.url = "github:nixos/nixpkgs/a9858885e197f984d92d7fe64e9fff6b2e488d40"; #GCC13
    };

  outputs = { self, nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell
          {
            nativeBuildInputs = with pkgs; [
              cmake
              vim
              pkg-config
              swig
              git
              #perf-tools
              #hotspot
            ];
            buildInputs = with pkgs; [
              binutils
              which
              gfortran
              boost
              llvmPackages.openmp
              openblasCompat.dev
              hdf5-cpp.dev
              python311Full
              python311Packages.numpy
              python311Packages.matplotlib
              python311Packages.tkinter
            ];
            
            shellHook = ''
              mkdir -p exec
              export PATH=$PWD/install/bin:$PATH
              export ESTER=`pwd`/ester
              ./install_ester.sh
            '';
          };
      });
    };
}


