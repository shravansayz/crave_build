crave run --no-patch -- "
rm -rf .repo/local_manifests ; \
repo init --depth=1 --no-repo-verify -u https://github.com/yaap/manifest.git -b fifteen --git-lfs -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/shravansayz/local_manifests.git -b test .repo/local_manifests && \
/opt/crave/resync.sh && \
source build/envsetup.sh && \
lunch yaap_RMX1901-user && \
make installclean && \
m yaap"

#rm -rf .repo/local_manifests ; \
#repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs -g default,-mips,-darwin,-notdefault && \
#git clone https://github.com/shravansayz/local_manifests.git -b test .repo/local_manifests && \
