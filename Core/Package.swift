// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Core",
            targets: ["CoreBinary"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "Core",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/DVCSDK/Core/Core-1.0.0.zip",
            checksum: "a1a7bbccbaa8ade7ab748948206f7616c55fe42d5799ed964346371e72e7242c"
        ),
        .target(
            name: "CoreBinary",
            dependencies: [
                "Core"
            ],
            path: "Sources/Core"
        )
    ]
)
