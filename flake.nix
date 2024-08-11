{
  description = "An development environment to compile and run Ester";

  inputs = 
    {
      nixpkgs.url = "github:nixos/nixpkgs/38b7104fd1db0046ceed579f5dab4e62f136589c"; # GCC12
      #nixpkgs.url = "github:nixos/nixpkgs/a9858885e197f984d92d7fe64e9fff6b2e488d40"; #GCC13
    };

  outputs = { self, nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
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
            ];
            buildInputs = with pkgs; [
              gfortran
              openblasCompat
              hdf5-cpp
              python311Full
              python311Packages.numpy
              python311Packages.matplotlib
              python311Packages.tkinter
            #] ++ (if system == "aarch64-darwin" then [ ] else [ gdb ]);
            ];
            
            shellHook = ''
              mkdir -p exec
              export PATH=$PWD/install/bin:$PATH
              ./install_ester.sh
            '';
          };
      });
    };
}


