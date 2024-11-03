rm -rf .repo/local_manifests ; \
repo init --depth=1 --no-repo-verify -u https://github.com/RisingTechOSS/android -b fourteen -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-rising14 .repo/local_manifests && \
/opt/crave/resync.sh && \
cd vendor/lineage && git fetch https://github.com/LineageOS/android_vendor_lineage refs/changes/89/405989/1 && git cherry-pick FETCH_HEAD ; cd - && \
source build/envsetup.sh && \
riseup apollo user && \
rise b && \
export WITH_GMS=true && \
export TARGET_DEFAULT_PIXEL_LAUNCHER=true && \
rise b && \
export TARGET_DEFAULT_PIXEL_LAUNCHER=true && \
export TARGET_CORE_GMS=true && \
export TARGET_CORE_GMS_EXTRAS=true && \
rise b
