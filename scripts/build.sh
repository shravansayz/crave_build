#!/bin/bash

usage() {
  echo "Usage: $0 <project> <device> <build_type> [--reinit]"
  echo "Projects: PixelOS-14, CrDroid-14, Evolution-14"
  echo "Build Types: user, userdebug, eng"
  exit 1
}

validate_params() {
  if [ -z "$project" ] || [ -z "$device" ]; then
    usage
  fi

  case "$project" in
    "PixelOS-14"|"CrDroid-14"|"Evolution-14")
      ;;
    *)
      echo "Invalid project specified"
      usage
      ;;
  esac

  case "$build_type" in
    "user"|"userdebug"|"eng")
      ;;
    *)
      echo "Invalid build type specified"
      usage
      ;;
  esac
}

project="$1"
device="$2"
build_type="$3"
reinit="$4"

validate_params

echo "DEVICE_CODENAME=$device" >> $GITHUB_ENV
echo "ROM_NAME=$project" >> $GITHUB_ENV

case "$project" in
  "PixelOS-14")
    repo_init="repo init --depth=1 --no-repo-verify -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen -g default,-mips,-darwin,-notdefault"
    lunch="lunch aosp_$device-ap2a-$build_type"
    make_command="mka bacon"
    manifest="https://github.com/aosp-realm/android_build_manifest.git -b apollo-pos14"
    ;;
  "CrDroid-14")
    repo_init="repo init --depth=1 --no-repo-verify -u https://github.com/crdroidandroid/android.git -b 14.0 -g default,-mips,-darwin,-notdefault"
    make_command="brunch $device"
    manifest="https://github.com/aosp-realm/android_build_manifest.git -b apollo-cr14"
    ;;
  "Evolution-14")
    repo_init="repo init --depth=1 --no-repo-verify -u https://github.com/Evolution-XYZ/manifest -b udc -g default,-mips,-darwin,-notdefault"
    lunch="lunch lineage_$device-$build_type"
    make_command="m evolution"
    manifest="https://github.com/aosp-realm/android_build_manifest.git -b apollo-evo14"
    ;;
  *)
    echo "Invalid project specified"
    usage
    ;;
esac

if [ "$reinit" == "--reinit" ]; then
  if [ "$project" == "CrDroid-14" ]; then
    crave run --no-patch "rm -rf .repo/local_manifests ; \
    $repo_init && \
    git clone $manifest .repo/local_manifests && \
    /opt/crave/resync.sh && \
    rm -rf out/target/product/$device/*.zip ; \
    source build/envsetup.sh && \
    $make_command"
  else
    crave run --no-patch "rm -rf .repo/local_manifests ; \
    $repo_init && \
    git clone $manifest .repo/local_manifests && \
    /opt/crave/resync.sh && \
    rm -rf out/target/product/$device/*.zip ; \
    source build/envsetup.sh && \
    $lunch && \
    $make_command"
  fi
else
  if [ "$project" == "CrDroid-14" ]; then
    crave run --no-patch "/opt/crave/resync.sh && \
    rm -rf out/target/product/$device/*.zip ; \
    source build/envsetup.sh && \
    $make_command"
  else
    crave run --no-patch "/opt/crave/resync.sh && \
    source build/envsetup.sh && \
    rm -rf out/target/product/$device/*.zip ; \
    $lunch && \
    $make_command"
  fi
fi

