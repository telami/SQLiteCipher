#!/bin/sh

set -xe

VERSION=$1

BUILD_DIR="./build"
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
cd $BUILD_DIR

cat <<EOF > Podfile
use_frameworks!
install! 'cocoapods', :deterministic_uuids => false, :integrate_targets => false
  platform :ios, '16.0'
  pod 'SQLite.swift/SQLCipher', '0.14.1'

EOF

bundle exec pod install

xcodebuild archive \
  -project ./Pods/Pods.xcodeproj \
  -scheme SQLite.swift \
  -destination "generic/platform=iOS" \
  -archivePath "archives/SQLiteCipher-iOS" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO \
  OTHER_SWIFT_FLAGS='$(inherited) -DSQLITE_SWIFT_SQLCIPHER' \
  GCC_PREPROCESSOR_DEFINITIONS='$(inherited) SQLITE_HAS_CODEC=1 SQLITE_SWIFT_SQLCIPHER=1'

xcodebuild archive \
  -project ./Pods/Pods.xcodeproj \
  -scheme SQLite.swift \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "archives/SQLiteCipher-iOS_Simulator" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO \
  OTHER_SWIFT_FLAGS='$(inherited) -DSQLITE_SWIFT_SQLCIPHER' \
  GCC_PREPROCESSOR_DEFINITIONS='$(inherited) SQLITE_HAS_CODEC=1 SQLITE_SWIFT_SQLCIPHER=1'




