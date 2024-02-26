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
      url: "https://github.com/telami/SQLiteCipher/releases/download/0.15.0/SQLite.xcframework.zip",
      checksum: "3966de0fcc7454f003a74678c8ca8153b357fe3bebd31d20aade6ded106a295f"
    ),

    .binaryTarget(
      name: "SQLCipher",
      url: "https://github.com/telami/SQLiteCipher/releases/download/0.15.0/SQLCipher.xcframework.zip",
      checksum: "5951891d691c8e54446c79fc7f4a51c65165b3247738c6ee0904479ad7829a5e"
    ),
  ]
)
