mkdir build
cd build

cmake ^
    -G "Visual Studio 16 2019" -A x64 ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DPYKEP_BUILD_TESTS=no ^
    -DPYKEP_BUILD_SPICE=yes ^
    ..

cmake --build . -- -v

cmake --build . --target install

cd ..
mkdir build_python
cd build_python

cmake ^
    -G "Visual Studio 16 2019" -A x64 ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DPYKEP_BUILD_PYKEP=yes ^
    -DPYKEP_BUILD_KEP_TOOLBOX=no ^
    ..

cmake --build . -- -v

cmake --build . --target install