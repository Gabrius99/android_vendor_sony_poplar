#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/FOTAKernel:22855680:c13ef9c993d1da8e1c9f8aa958a2a670423fa1ed; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:16310272:b6add859c4c3a2afe3ff93baf75bc9dd8d2072ba \
          --target EMMC:/dev/block/bootdevice/by-name/FOTAKernel:22855680:c13ef9c993d1da8e1c9f8aa958a2a670423fa1ed && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
