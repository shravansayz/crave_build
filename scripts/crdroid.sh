device="apollo" # required
project="crDroid-14" # just for telegram notif

crave ssh -- "rm -f out/target/product/$device/*.zip"

crave run --no-patch -- "
/opt/crave/resync.sh && \
source build/envsetup.sh && \
brunch apollo"

#rm -rf .repo/local_manifests ; \
#repo init --depth=1 --no-repo-verify -u https://github.com/crdroidandroid/android.git -b 14.0 -g default,-mips,-darwin,-notdefault && \
#git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-cr14 .repo/local_manifests && \

echo "DEVICE_CODENAME=$device" >> $GITHUB_ENV
echo "ROM_NAME=$project" >> $GITHUB_ENV
