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
# Usage: bash build.sh {install_dir}	   #
# 					   {make_arg}          #
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
# Check if basedirectory was given as commandline argument
if [ -z "$1" ]; then
	basedir="/usr"
	echo test
	echo test
else
	basedir=$1
fi
# Change to build dir and compile the library.
cd build
FC=/usr/bin/gfortran cmake -DCMAKE_INSTALL_PREFIX=$basedir -DBUILD_TESTING=OFF  ..
make $2
