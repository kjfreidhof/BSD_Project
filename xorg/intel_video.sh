#!/usr/bin/env sh

p="pkg.txt"
I_dkms=$(doas sysrc kld_list+=i915kms)

Install_video() {
if [ ! -f "$p" ]; then
    echo "file not found"
    exit 1
fi

while IFS= read -r pkg || [ -n "$pkg" ]
do
    if [ -z "$pkg" ] || [ "${pkg#\#}" != "$pkg" ]; then
        continue
    fi

    echo "Attempting to install: $pkg"
    doas env ASSUME_ALWAYS_YES=YES pkg install "$pkg"

    if [ $? -ne 0 ]; then
        echo "Failed to install: $pkg"
    else
        echo "Successfully installed: $pkg"
    fi
done < "$p"
$I_dkms
exit 0
}
Install_video
