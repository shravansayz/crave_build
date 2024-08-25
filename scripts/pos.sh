crave run --no-patch -- "
rm -rf .repo/local_manifests ; \
repo init --depth=1 --no-repo-verify -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-pos14 .repo/local_manifests && \
/opt/crave/resync.sh && \
source build/envsetup.sh && \
lunch aosp_apollo-ap2a-userdebug && \
make installclean && \
mka bacon > /dev/null"

#rm -rf .repo/local_manifests ; \
#repo init --depth=1 --no-repo-verify -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen -g default,-mips,-darwin,-notdefault && \
#git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-pos14 .repo/local_manifests && \