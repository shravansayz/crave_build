device="apollo" # required
project="Evolution-XYZ" # just for telegram notif

crave ssh -- "rm -f out/target/product/$device/*.zip"

crave run --no-patch -- "
source build/envsetup.sh && \
lunch lineage_apollo-userdebug && \
make installclean && \
m evolution"

#rm -rf .repo/local_manifests ; \
#repo init --depth=1 --no-repo-verify -u https://github.com/Evolution-XYZ/manifest -b udc -g default,-mips,-darwin,-notdefault && \
#git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-evo14 .repo/local_manifests && \

echo "DEVICE_CODENAME=$device" >> $GITHUB_ENV
echo "ROM_NAME=$project" >> $GITHUB_ENV
