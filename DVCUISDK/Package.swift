// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "DVCUISDK",
    defaultLocalization: "en", 
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DVCUISDK",
            targets: ["DVCUISDKBinary"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios", from: "4.5.0"),
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .upToNextMinor(from: "1.0.0"))
    ],
    targets: [
        .binaryTarget(
            name: "DVCUISDK",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/DVCSDK/DVCUISDK/DVCUISDK-1.0.0.zip",
            checksum: "1db3a7ae27c183a40e08e21f82a669330d1b38b9f4271ae1dac5b52ef081867f"
        ),
        .target(
            name: "DVCUISDKBinary",
            dependencies: [
                "DVCUISDK",
                //"Core",
                //"DVCSDK",
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS")
            ],
            path: "Sources/DVCUISDK"
        )
    ]
)
