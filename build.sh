#!/bin/sh

set -xe

VERSION=$1

BUILD_DIR="./build"
IBUILD_DIR="./ios"
WBUILD_DIR="./watchOS"



rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR

#build iOS
cd $IBUILD_DIR
sh ./build.sh "$VERSION"
cd ..
cp -r "$IBUILD_DIR/build/archives/SQLiteCipher-iOS.xcarchive" $BUILD_DIR
cp -r "$IBUILD_DIR/build/archives/SQLiteCipher-iOS_Simulator.xcarchive" $BUILD_DIR
# build watchOS
cd $WBUILD_DIR
sh ./build.sh "$VERSION"
cd ..
cp -r "$WBUILD_DIR/build/archives/SQLiteCipher-watchOS.xcarchive" $BUILD_DIR
cp -r "$WBUILD_DIR/build/archives/SQLiteCipher-watchOS_Simulator.xcarchive" $BUILD_DIR

cd $BUILD_DIR
xcodebuild -create-xcframework \
  -archive SQLiteCipher-iOS.xcarchive -framework SQLite.framework \
  -archive SQLiteCipher-iOS_Simulator.xcarchive -framework SQLite.framework \
  -archive SQLiteCipher-watchOS.xcarchive -framework SQLite.framework \
  -archive SQLiteCipher-watchOS_Simulator.xcarchive -framework SQLite.framework \
  -output SQLite.xcframework

xcodebuild -create-xcframework \
  -archive SQLiteCipher-iOS.xcarchive -framework SQLCipher.framework \
  -archive SQLiteCipher-iOS_Simulator.xcarchive -framework SQLCipher.framework \
  -archive SQLiteCipher-watchOS.xcarchive -framework SQLCipher.framework \
  -archive SQLiteCipher-watchOS_Simulator.xcarchive -framework SQLCipher.framework \
  -output SQLCipher.xcframework

zip -r SQLite.xcframework.zip SQLite.xcframework
zip -r SQLCipher.xcframework.zip SQLCipher.xcframework
