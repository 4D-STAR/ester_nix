#!/bin/bash
if test -d ester; then
  exit
fi
echo "Installing ester"
git clone https://github.com/4D-STAR/ester.git
cd ester
git checkout evolution_nix
#git apply ../numpy_dirs_and_new_gfortran.patch
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../../install
make
make install

