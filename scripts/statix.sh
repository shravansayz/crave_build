crave run --no-patch -- "
rm -rf .repo/local_manifests ; \
repo init --depth=1 --no-repo-verify -u https://github.com/StatiXOS/android_manifest.git -b udc-qpr3 -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-statix .repo/local_manifests && \
/opt/crave/resync.sh && \
source build/envsetup.sh && \
brunch statix_apollo-ap2a-userdebug > /dev/null"

#rm -rf .repo/local_manifests ; \
#repo init --depth=1 --no-repo-verify -u https://github.com/StatiXOS/android_manifest.git -b udc-qpr3 -g default,-mips,-darwin,-notdefault && \
#git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-statix .repo/local_manifests && \
