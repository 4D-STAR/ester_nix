#!/bin/bash
if test -d ester; then
  exit
fi
echo "Installing ester"
git clone https://github.com/ester-project/ester.git
cd ester
git checkout evolution
git apply ../numpy_dirs_and_new_gfortran.patch
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../../install
make
make install

