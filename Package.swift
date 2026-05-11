// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "DVC",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Core",
            targets: ["CoreBinary"]
        ),
        .library(
            name: "DVCSDK",
            targets: ["DVCSDKBinary"]
        ),
        .library(
            name: "DVCUISDK",
            targets: ["DVCUISDKBinary"]
        )
    ],
    dependencies: [
        // External dependencies
        .package(
            url: "https://github.com/vbmobile/AMADocModeliOS",
            .upToNextMinor(from: "1.0.0")
        ),
        .package(
            url: "https://github.com/airbnb/lottie-ios",
            from: "4.5.0"
        )
    ],
    targets: [
        // MARK: - Binary Targets

        .binaryTarget(
            name: "Core",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/DVCSDK/Core/Core-1.0.0.zip",
            checksum: "a1a7bbccbaa8ade7ab748948206f7616c55fe42d5799ed964346371e72e7242c"
        ),

        .binaryTarget(
            name: "DVCSDK",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/DVCSDK/DVCSDK/DVCSDK-1.0.0.zip",
            checksum: "cd0f46194a85ed590254740d8cced0eecc443f9ad36cd91f0b679c55f49b35c1"
        ),

        .binaryTarget(
            name: "DVCUISDK",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/DVCSDK/DVCUISDK/DVCUISDK-1.0.0.zip",
            checksum: "1db3a7ae27c183a40e08e21f82a669330d1b38b9f4271ae1dac5b52ef081867f"
        ),

        // MARK: - Wrapper / Glue Targets

        .target(
            name: "CoreBinary",
            dependencies: [
                "Core"
            ],
            path: "Sources/Core"
        ),

        .target(
            name: "DVCSDKBinary",
            dependencies: [
                "DVCSDK",
                "CoreBinary",
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS")
            ],
            path: "Sources/DVCSDK"
        ),

        .target(
            name: "DVCUISDKBinary",
            dependencies: [
                "DVCUISDK",
                "CoreBinary",
                "DVCSDKBinary",
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS")
            ],
            path: "Sources/DVCUISDK"
        )
    ]
)
