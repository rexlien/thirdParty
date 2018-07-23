#!/bin/bash
##/Users/rexlien/Development/ndk-bundle/build/tools/make_standalone_toolchain.py --arch arm --api 21 --stl=libc++ --install-dir android/toolchain
##export PATH=~/project/git-dev/TestBed_react_native/LGEngine/android/toolchain/bin:$PATH
ROOT=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
OLDPATH=$PATH;
export PATH=$ROOT/android/toolchain/arm/bin:$PATH
echo $PATH
cd thirdParty/boost_1_64_0
./bootstrap.sh
{
        echo "import os ;"
        echo "local ROOT = [ os.environ ROOT ] ;"
        echo "import option ;"
        echo "import feature ;"
        echo "import python ;"
        echo "libraries = ;"
        echo "option.set keep-going : false ;"
        echo ""
        echo "using clang : android" 
        echo ":"
        echo "../../android/toolchain/arm/bin/clang++"
        echo ":"
        echo "<compileflags>-fexceptions"
        echo "<compileflags>-frtti"
        echo "<compileflags>-fpic"
        echo "<compileflags>-ffunction-sections"
        echo "<compileflags>-funwind-tables"
        echo "<compileflags>-Wno-psabi"
        echo "<compileflags>-march=armv7-a"
        echo "<compileflags>-mfloat-abi=softfp"
        echo "<compileflags>-mfpu=vfpv3-d16"
        echo "<compileflags>-fomit-frame-pointer"
        echo "<compileflags>-fno-strict-aliasing"
        echo "<compileflags>-finline-limit=64"
        echo "<compileflags>-I../../android/toolchain/arm/sysroot/usr/include"
        echo "<compileflags>-I../../android/toolchain/arm/include/python2.7"
        echo "<compileflags>-Wa,--noexecstack"
        echo "<compileflags>-DANDROID"
        echo "<compileflags>-D__ANDROID__"
        echo "<compileflags>-DNDEBUG"
        echo "<compileflags>-O2"
        echo "<architecture>arm"
        echo "<cxxflags>-std=c++11"
        echo "<cxxflags>-D__arm__"
        echo ";"
} | cat >tools/build/src/user-config.jam
ln -sf ../../android/toolchain/arm/bin/arm-linux-androideabi-ranlib ranlib
./b2 toolset=clang-android include=../../android/toolchain/arm/include/llvm-libc++abi/include include=../../android/toolchain/arm/include/c++/4.9.x \
    threading=multi link=static binary-format=elf --layout=versioned --without-python address-model=32 abi=aapcs target-os=android --stagedir=../../thirdParty/boost/android/armeabi stage

./b2 toolset=clang-android include=../../android/toolchain/arm/include/llvm-libc++abi/include include=../../android/toolchain/arm/include/c++/4.9.x \
    threading=multi link=static binary-format=elf --layout=versioned --without-python address-model=32 abi=aapcs target-os=android --stagedir=../../thirdParty/boost/android/armeabi-v7a stage

export PATH=$OLDPATH
export PATH=$ROOT/android/toolchain/x86:$PATH
echo $PATH
./bootstrap.sh
{
        echo "import os ;"
        echo "local ROOT = [ os.environ ROOT ] ;"
        echo "import option ;"
        echo "import feature ;"
        echo "import python ;"
        echo "libraries = ;"
        echo "option.set keep-going : false ;"
        echo ""
        echo "using clang : android" 
        echo ":"
        echo "../../android/toolchain/x86/bin/clang++"
        echo ":"

        echo "<compileflags>-fexceptions"
        echo "<compileflags>-frtti"
        echo "<compileflags>-fpic"
        echo "<compileflags>-ffunction-sections"
        echo "<compileflags>-funwind-tables"
        echo "<compileflags>-fstack-protector"
        echo "<compileflags>--target=i686-none-linux-android"
        
        echo "<architecture>i686"
        echo "<cxxflags>-std=c++11"
        echo "<compileflags>-fomit-frame-pointer"
        echo "<compileflags>-fno-strict-aliasing"
        echo "<compileflags>-no-canonical-prefixes"
        echo "<compileflags>-I../../android/toolchain/x86/sysroot/usr/local/include"
        echo "<compileflags>-I../../android/toolchain/x86/sysroot/usr/include"
        echo "<compileflags>-I../../android/toolchain/x86/include/python2.7"
        echo "<compileflags>-Wa,--noexecstack"
        echo "<compileflags>-DANDROID"
        echo "<compileflags>-D__ANDROID__"
        echo "<compileflags>-DNDEBUG"
        echo "<compileflags>-O2"
        echo "<compileflags>-Os"
        echo "<compileflags>-g"
        echo ";"
} | cat >tools/build/src/user-config.jam
ln -sf ../../android/toolchain/x86/bin/i686-linux-android-ranlib ranlib
./b2 toolset=clang-android include=../../android/toolchain/x86/include/llvm-libc++abi/include \
    include=../../android/toolchain/x86/include/c++/4.9.x threading=multi link=static binary-format=elf address-model=32 \
    abi=sysv target-os=linux --stagedir=$ROOT/thirdParty/boost/android/x86  --layout=versioned --without-python stage

export PATH=$OLDPATH