rm -rf .repo/local_manifests && \
repo init --depth=1 --no-repo-verify -u https://github.com/DerpFest-AOSP/manifest.git -b 15 --git-lfs -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/shravansayz/local_manifests.git -b derp15 .repo/local_manifests && \
/opt/crave/resync.sh && \
repo forall -c 'git lfs pull' ; \
export DISABLE_STUB_VALIDATION=true ; \
export TZ=Asia/Kolkata ; \
cd vendor/derp && curl -s https://raw.githubusercontent.com/shravansayz/ota-stuff/refs/heads/main/0001-tools-Generate-json-for-non-official-builds.patch > json.patch && git apply json.patch ; cd ../../ && \
source build/envsetup.sh && \
lunch derp_RMX1901-user && \
make installclean ; \
mka derp
