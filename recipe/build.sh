#!/usr/bin/env bash

mkdir build
cd build

if [[ "$target_platform" == linux-64 ]]; then
    LDFLAGS="-lrt ${LDFLAGS}"
fi

cmake ${CMAKE_ARGS} \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -Dkep3_BUILD_TESTS=OFF \
    -Dkep3_BUILD_PYTHON_BINDINGS=ON \
    -DPYKEP_INSTALL_PATH=$SP_DIR \
    ..

make -j${CPU_COUNT} VERBOSE=1

make install