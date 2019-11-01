# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    build_swig

    yum update -y

    # Dependencies
    yum install wget -y

    # Cmake Installation

    wget https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz
    tar -zxvf cmake-3.6.2.tar.gz
    cd cmake-3.6.2
    ./bootstrap --prefix=/usr/local
    make
    make install
    cmake --version

    
    cd hello_swig
    mkdir build
    cd build
    cmake ..
    make
    cd ..
    cd ..
    


    # Install anaconda
    # yum install curl -y
    # yum install bzip2 -y
    # yum install cmake -y
    # yum install make -y

    # curl –O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    # sh Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3
    # export PATH=" $HOME/miniconda3/bin:$PATH"
    # conda -V


    # yum install swig -y
    # rm -rf build
    # mkdir build
    # cd build
    # cmake ..
    # make
    # cd ..
}

function pip_opts {
    # Extra options for pip
    # echo "--only-binary matplotlib --find-links ${MANYLINUX_URL}"
    echo "Hello"
}

function run_tests {
    echo "tests"
    # # Runs tests on installed distribution from an empty directory
    # ASTROPY_INSTALL_DIR=$(dirname $(python -c 'import astropy; print(astropy.__file__)'))

    # # Patch the test_roundtrip_sky_rotation test which is affected by angle
    # # wrapping on 32-bit platforms. This should be fixed in astropy v4.0 with
    # # https://github.com/astropy/astropy/pull/9496
    # local patch_file=$(abspath ../patches/test_roundtrip_sky_rotation.patch)
    # (cd $ASTROPY_INSTALL_DIR && patch -p0 < $patch_file)

    # # Runs tests on installed distribution from an empty directory
    # python --version
    # python -c "import sys; import swigHello; sys.exit(astropy.test(remote_data='none'))"
}