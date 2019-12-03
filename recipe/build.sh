#!/usr/bin/env bash

mkdir build
cd build

if [[ "$target_platform" == linux-64 ]]; then
    LDFLAGS="-lrt ${LDFLAGS}"
fi

# Install the dcgp headers first.
cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DPYKEP_BUILD_TESTS=no \
    -DPYKEP_BUILD_SPICE=yes \
    ..

make -j${CPU_COUNT} VERBOSE=1

make install

cd ..
mkdir build_python
cd build_python

# Now the python bindings.
cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DPYKEP_BUILD_PYKEP=yes \
    -DPYKEP_BUILD_KEP_TOOLBOX=no \
    ..

make -j${CPU_COUNT} VERBOSE=1

make install