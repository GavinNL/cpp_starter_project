# C++ Starter Project

[![pipeline status](https://gitlab.com/GavinNL/cpp_starter_project/badges/master/pipeline.svg)](https://gitlab.com/GavinNL/cpp_starter_project/-/commits/master)

[![coverage report](https://gitlab.com/GavinNL/cpp_starter_project/badges/master/coverage.svg)](https://gitlab.com/GavinNL/cpp_starter_project/-/commits/master)

[![Build status](https://ci.appveyor.com/api/projects/status/m76546ncm22ch1gc/branch/master?svg=true)](https://ci.appveyor.com/project/GavinNL/cpp-starter-project/branch/master)

A C++ Starter project using the Conan Package manager for dependencies.

```bash

mkdir build
cd build
conan install .. 

cmake ..
cmake --build .

ctest --output-on-failure

```



## Features

 * Conan Package Manager for dependencies
 * Unit tests using Catch2
 * CI using Gitlab-Ci and Appveyor
 * Code Coverage using Gcov
