# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    yum install swig -y
    rm -rf build
    mkdir build
    cd build
    cmake ..
    make
    cd ..
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