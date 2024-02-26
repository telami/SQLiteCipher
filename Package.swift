// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SQLiteCipher",
  platforms: [
    .iOS(.v11), .watchOS(.v6)
  ],
  products: [
    .library(name: "SQLiteCipher", targets: ["SQLite", "SQLCipher"]),
  ],
  targets: [
    .binaryTarget(
      name: "SQLite",
      url: "https://github.com/telami/SQLiteCipher/releases/download/0.14.1/SQLite.xcframework.zip",
      checksum: "bce7aaa7cc498b6b0b1a92135ec836d113cc1e709d8d897f2ddfb18d17ceb572"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/telami/SQLiteCipher/releases/download/0.14.1/SQLCipher.xcframework.zip",
      checksum: "c3a9057738451e20dfc3bcf75e34f806deb72ae282183b02075c922dd4faebc0"
    ),
  ]
)
