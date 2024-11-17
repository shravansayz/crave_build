rm -rf .repo/local_manifests ; \
repo init --depth=1 --no-repo-verify -u https://github.com/The-Clover-Project/manifest.git -b 15 -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/Shravan55555/local_manifest.git -b main .repo/local_manifests && \
/opt/crave/resync.sh && \
repo forall -c 'git lfs pull' ; \
source build/envsetup.sh && \
lunch clover_RMX1901-ap3a-userdebug && \
make installclean ; \
mka clover
