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
        .package(url: "https://github.com/amoad/amoad-ios-sdk", from: "6.3.1"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads", from: "9.0.0")
    ],
    targets: [
        // url / checksum はリリースごとに更新する
        // ( checksum は make.sh admobadapter が zip 生成時に出力する値を転記する )
        .binaryTarget(
            name: "AMoAdAdMobAdapter",
            url: "https://github.com/amoad/amoad-ios-admob-adapter/releases/download/1.0.4/AMoAdAdMobAdapter.xcframework.zip",
            checksum: "RELEASE_TIME_CHECKSUM_PLACEHOLDER"
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
