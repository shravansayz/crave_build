device="apollo" # required
project="PixelOS-Fourteen" # just for telegram notif

echo "DEVICE_CODENAME=$device" >> $GITHUB_ENV
echo "ROM_NAME=$project" >> $GITHUB_ENV

crave ssh -- "rm -f out/target/product/$device/*.zip"

crave run --no-patch -- "
/opt/crave/resync.sh && \
source build/envsetup.sh && \
lunch aosp_apollo-ap2a-user && \
make installclean && \
mka bacon"

#rm -rf .repo/local_manifests ; \
#repo init --depth=1 --no-repo-verify -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen -g default,-mips,-darwin,-notdefault && \
#git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-pos14 .repo/local_manifests && \
