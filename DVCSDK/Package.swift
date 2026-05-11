// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "DVCSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DVCSDK",
            targets: ["DVCSDKBinary"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", exact: "1.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "DVCSDK",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/DVCSDK/DVCSDK/DVCSDK-1.0.0.zip",
            checksum: "cd0f46194a85ed590254740d8cced0eecc443f9ad36cd91f0b679c55f49b35c1"
        ),
        .target(
            name: "DVCSDKBinary",
            dependencies: [
                "DVCSDK",
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
            ],
            path: "Sources/DVCSDK"
        )
    ]
)
