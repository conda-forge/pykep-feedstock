mkdir build
cd build

cmake ^
    -G "Visual Studio 17 2022" -A x64 ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -Dkep3_BUILD_TESTS=OFF ^
    -Dkep3_BUILD_BENCHMARKS=OFF ^
    -Dkep3_BUILD_PYTHON_BINDINGS=ON ^
    -DPYKEP_INSTALL_PATH=%SP_DIR% ^
    -DPython3_EXECUTABLE=%PYTHON% ^
    ..

cmake --build . --config Release
cmake --build . --config Release --target install
