mkdir build
cd build

cmake ^
    -G "Visual Studio 17 2022" -A x64 ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DPYKEP_BUILD_TESTS=no ^
    -DPYKEP_BUILD_SPICE=yes ^
    ..

cmake --build . --config Release
cmake --build . --config Release --target install


cd ..
mkdir build_python
cd build_python

cmake ^
    -G "Visual Studio 17 2022" -A x64 ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DPYKEP_BUILD_PYKEP=yes ^
    -DPYKEP_BUILD_KEP_TOOLBOX=no ^
    ..

cmake --build . --config Release
cmake --build . --config Release --target install
