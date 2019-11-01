mkdir build
cd build

cmake ^
    -G "NMake Makefiles" ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DBUILD_SPICE=yes ^
    -DBUILD_MAIN=no ^
    -DBUILD_PYKEP=yes ^
    -DBUILD_TESTS=yes ^
    ..

cmake --build . --config Release

ctest

cmake --build . --config Release --target install