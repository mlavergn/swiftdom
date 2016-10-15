import PackageDescription

let package = Package(
    name: "swiftdom",
    dependencies: [
      .Package(url: "libxml2", majorVersion: 1),
    ]
)
