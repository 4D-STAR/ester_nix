#!/bin/bash
if test -d ester; then
  exit
fi
echo "Installing ester"
git clone https://github.com/ester-project/ester.git
cd ester
git checkout master
#git checkout evolution_nix
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../../install  -DPYTHON_NUMPY_INCLUDE_DIR=`python -c "import numpy; print(numpy.get_include())"` -DCBLAS_LIBRARIES=cblas
make
make install

