OLDPATH = $PATH
rm -rf build
mkdir build
cd build
if [ "$1" = "arm" ]; then
    export PATH=$PATH:$ANDROID_NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/darwin-x86_64/bin/
    export ANDROID_NDK_SYSROOT=$ANDROID_NDK/platforms/android-14/arch-arm/
    export CPP=arm-linux-androideabi-cpp
    export CC=arm-linux-androideabi-gcc
    export LD=arm-linux-androideabi-ld
    export AR=arm-linux-androideabi-ar
    export RANLIB=arm-linux-androideabi-ranlib
    export CPPFLAGS="--sysroot=$ANDROID_NDK_SYSROOT"
    export CFLAGS="--sysroot=$ANDROID_NDK_SYSROOT"
    export CXXFLAGS="--sysroot=$ANDROID_NDK_SYSROOT"
    ../configure --build=x86_64-darwin --host=arm
elif [ "$1" = "x86" ]; then
    export PATH=$PATH:$ANDROID_NDK/toolchains/x86-4.9/prebuilt/darwin-x86_64/bin/
    export ANDROID_NDK_SYSROOT=$ANDROID_NDK/platforms/android-14/arch-x86/
    export CPP=i686-linux-android-cpp
    export CC=i686-linux-android-gcc
    export LD=i686-linux-android-ld
    export AR=i686-linux-android-ar
    export RANLIB=i686-linux-android-ranlib
    export CPPFLAGS="--sysroot=$ANDROID_NDK_SYSROOT"
    export CFLAGS="--sysroot=$ANDROID_NDK_SYSROOT"
    export CXXFLAGS="--sysroot=$ANDROID_NDK_SYSROOT"
    ../configure --build=x86_64-darwin --build=i386 --host=i386
fi
make
make check
export PATH=$OLDPATH