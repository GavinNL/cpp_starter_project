# C++ Starter Project


| Dasd            | Master                                                                                                                                                                           | Dev                                                                                                                                                                        |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Pipeline Status | [![pipeline status](https://gitlab.com/GavinNL/cpp_starter_project/badges/master/pipeline.svg)](https://gitlab.com/GavinNL/cpp_starter_project/-/commits/master)                 | [![pipeline status](https://gitlab.com/GavinNL/cpp_starter_project/badges/dev/pipeline.svg)](https://gitlab.com/GavinNL/cpp_starter_project/-/commits/dev)                 |
| Coverage        | [![coverage report](https://gitlab.com/GavinNL/cpp_starter_project/badges/master/coverage.svg)](https://gitlab.com/GavinNL/cpp_starter_project/-/commits/master)                 | [![coverage report](https://gitlab.com/GavinNL/cpp_starter_project/badges/dev/coverage.svg)](https://gitlab.com/GavinNL/cpp_starter_project/-/commits/dev)                 |
| Appveyor        | [![Build status](https://ci.appveyor.com/api/projects/status/m76546ncm22ch1gc/branch/master?svg=true)](https://ci.appveyor.com/project/GavinNL/cpp-starter-project/branch/master) | [![Build status](https://ci.appveyor.com/api/projects/status/m76546ncm22ch1gc/branch/dev?svg=true)](https://ci.appveyor.com/project/GavinNL/cpp-starter-project/branch/dev) |

A C++ Starter project using the Conan Package manager for dependencies.
Some settings were taken from https://github.com/lefticus/cpp_starter_project

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
