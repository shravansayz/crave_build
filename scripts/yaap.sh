rm -rf .repo/local_manifests && \
repo init --depth=1 --no-repo-verify -u https://github.com/yaap/manifest.git -b fifteen -git-lfs -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-yaap15 .repo/local_manifests && \
/opt/crave/resync.sh && \
export TARGET_BUILD_GAPPS=true ; \
source build/envsetup.sh && \
lunch yaap_apollo-user && \
make installclean ; \
m yaap
