// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swiftlint:disable all
let package = Package(
    name: "SparkCheckbox",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SparkCheckbox",
            targets: ["SparkCheckbox"]
        ),
        .library(
            name: "SparkCheckboxTesting",
            targets: ["SparkCheckboxTesting"]
        )
    ],
    dependencies: [
       .package(
           url: "https://github.com/adevinta/spark-ios-common.git",
           // path: "../spark-ios-common"
           /*version*/ "0.0.1"..."999.999.999"
       ),
       .package(
           url: "https://github.com/adevinta/spark-ios-theming.git",
           // path: "../spark-ios-theming"
           /*version*/ "0.0.1"..."999.999.999"
       )
    ],
    targets: [
        .target(
            name: "SparkCheckbox",
            dependencies: [
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkTheming",
                    package: "spark-ios-theming"
                )
            ]
        ),
        .target(
            name: "SparkCheckboxTesting",
            dependencies: [
                "SparkCheckbox",
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkTheme",
                    package: "spark-ios-theming"
                )
            ]
        ),
        .testTarget(
            name: "SparkCheckboxUnitTests",
            dependencies: [
                "SparkCheckbox",
                "SparkCheckboxTesting",
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                )
            ]
        ),
        .testTarget(
            name: "SparkCheckboxSnapshotTests",
            dependencies: [
                "SparkCheckbox",
                "SparkCheckboxTesting",
                .product(
                    name: "SparkCommonSnapshotTesting",
                    package: "spark-ios-common"
                ),
            ]
        ),
    ]
)
