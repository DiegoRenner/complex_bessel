#!/bin/bash
# --------------------------------------------------------------------------- #
# Author:       Joey Dumont                   <joey.dumont@gmail.com>         #
# Author:       Denis Gagnon                  <gagnon88@gmail.com>            #
# Date:         2015-02-26                                                    #
# Description:  Compiles and builds complex_bessel                            #
# ----------------------------------------------------------------------------#

# -----------------------------------------#
# This script simply calls CMake from the  #
# build directory and compiles the library.#
#                                          #
# Usage: bash build.sh {make_arg}          #
# -----------------------------------------#

# Change to file directory.
cd "$(dirname "$(readlink "$0")")";

# Check if build/ dir exists.
if [ ! -d build ]; then
    mkdir build
else
    rm -rf build
    mkdir build
fi
if [ ! -d /u/$USER/complex_bessel_lib ]; then
    mkdir /u/$USER/complex_bessel_lib
fi

# Change to build dir and compile the library.
cd build
FC=/usr/bin/gfortran cmake -DCMAKE_INSTALL_PREFIX=/u/$USER/complex_bessel_lib -DBUILD_TESTING=OFF  ..
make $1
