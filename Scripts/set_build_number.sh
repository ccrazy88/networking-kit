#!/bin/sh

# If we're using the Debug build configuration, suffix the build number with
# the current branch name to make collisions far less likely across feature
# branches.

build_number=$(git rev-list HEAD --count)
bundle_version=${build_number}

if [ "$CONFIGURATION" = "Debug" ]; then
    branch_name=$(git rev-parse --abbrev-ref HEAD)
    bundle_version=${bundle_version}-${branch_name}
fi

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $bundle_version" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $bundle_version" "${BUILT_PRODUCTS_DIR}/${WRAPPER_NAME}.dSYM/Contents/Info.plist"
