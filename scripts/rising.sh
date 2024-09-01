crave run --no-patch -- "
rm -rf .repo/local_manifests ; \
repo init --depth=1 --no-repo-verify -u https://github.com/RisingTechOSS/android -b fourteen -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-cr14 .repo/local_manifests && \
/opt/crave/resync.sh && \
source build/envsetup.sh && \
riseup apollo userdebug && \
export WITH_GMS=true && \
export TARGET_CORE_GMS=true && \
export TARGET_CORE_GMS_EXTRAS=true && \
export TARGET_DEFAULT_PIXEL_LAUNCHER=true && \
rise b > /dev/null
"
