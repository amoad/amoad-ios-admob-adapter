// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AMoAdAdMobAdapter",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "AMoAdAdMobAdapter", targets: ["AMoAdAdMobAdapterTarget"])
    ],
    dependencies: [
        // AMoAd SDK の SPM 対応バージョン以降を要求する
        .package(url: "https://github.com/amoad/amoad-ios-sdk", from: "6.3.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads", from: "9.0.0")
    ],
    targets: [
        // xcframework は ultima-ios-sdk の make.sh admobadapter がリリースごとに配置する
        .binaryTarget(
            name: "AMoAdAdMobAdapter",
            path: "AMoAdAdMobAdapter.xcframework"
        ),
        // binaryTarget には依存を宣言できないため、このターゲットで
        // AMoAd SDK と Google Mobile Ads SDK への依存を束ねる
        .target(
            name: "AMoAdAdMobAdapterTarget",
            dependencies: [
                "AMoAdAdMobAdapter",
                .product(name: "AMoAd", package: "amoad-ios-sdk"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "Sources/AMoAdAdMobAdapterTarget"
        )
    ]
)
