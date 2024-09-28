rm -rf .repo/local_manifests ; \
repo init --depth=1 --no-repo-verify -u https://github.com/Evolution-XYZ/manifest -b udc -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-evo14 .repo/local_manifests && \
/opt/crave/resync.sh && \
#repo forall -c 'git lfs install && git lfs pull' ; \
export RELAX_USES_LIBRARY_CHECK=true && \
source build/envsetup.sh && \
lunch lineage_apollo-user && \
make installclean && \
m evolution
