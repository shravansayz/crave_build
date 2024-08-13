device="apollo" # required
project="AOSPA-uvite" # just for telegram notif
echo "DEVICE_CODENAME=$device" >> $GITHUB_ENV
echo "ROM_NAME=$project" >> $GITHUB_ENV

crave ssh -- "rm -f out/target/product/$device/*.zip"

crave run --no-patch -- "
rm -rf * && \
repo init --depth=1 --no-repo-verify -u https://github.com/AOSPA/manifest -b uvite -g default,-mips,-darwin,-notdefault && \
/opt/crave/resync.sh && \
./rom-build.sh apollo"

#rm -rf .repo/local_manifests ; \
#repo init --depth=1 --no-repo-verify -u https://github.com/AOSPA/manifest -b uvite -g default,-mips,-darwin,-notdefault && \
#git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-uvite .repo/local_manifests && \
