# Allwinner CedarX userspace library
Based on lindenis-v536 SDK

## Add package to buildroot system
- Copy dir "buildroot-package/libcedarc" to "buildroot/package"

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

## Build
- make menuconfig
- Select "libcedarc" package
- make

## Work with ffmpeg (tested with buildroot 2020.02.1)
- make menuconfig
- goto "> Target packages > Audio and video applications > ffmpeg"
- set "(--enable-omx) Additional parameters for ./configure"
- recompile ffmpeg
