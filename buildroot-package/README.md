# Buildroot Package for libcedarc
## Add package to buildroot system
- Copy dir "libcedarc" to "buildroot/package"

- Modify "buildroot/package/Config.in", add package source to any menu you want
    ```
    source "package/libcedarc/Config.in"
    ```
    Demo
    ```
    menu "Hardware handling"
    source "package/libcedarc/Config.in" # <--Add
    source "package/acsccid/Config.in"
    source "package/bcm2835/Config.in"
    ```
- Modify "buildroot/package/libcedarc/libcedarc.mk"
    ```
    LDFLAGS="$(TARGET_LDFLAGS) -L$(@D)/library/arm-linux-gnueabihf"
    ```
    Change "arm-linux-gnueabihf" to fit your enviroment if necessery

## Build
- make menuconfig
- Select "libcedarc" package
- make

## Install to target
Due to a bug in libcedarc.mk you need copy every .so from "buildroot/output/build/libcedarc-master/library/[YOUR ARCH LIBRARY]" to your target "rootfs/usr/lib/" before you generate sdcard image.
