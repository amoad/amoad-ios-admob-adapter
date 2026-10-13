// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AMoAdAdMobAdapter",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "AMoAdAdMobAdapter", targets: ["AMoAdAdMobAdapterTarget"])
    ],
    dependencies: [
        // AMoAd SDK の SPM 対応バージョン以降を要求する
        .package(url: "https://github.com/amoad/amoad-ios-sdk", from: "6.3.0"),
        // 12 で Swift API の名前が変わったため 12 系以降に対応する ( 9〜11 系は 1.0.3 を使う )
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads", "12.0.0"..<"14.0.0")
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
