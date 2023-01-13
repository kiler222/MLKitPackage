
// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "MLKitPackage",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "MLKitFaceDetection",
            targets: ["MLKitFaceDetection", "MLImage", "MLKitVision", "Common"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "2.1.1"),
        .package(url: "https://github.com/google/GoogleDataTransport.git", from: "9.2.0"),
        .package(url: "https://github.com/google/GoogleUtilities.git", from: "7.7.1"),
        .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "1.7.2"),
        .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "2.30909.0")),
    ],
    targets: [
        .binaryTarget(name: "MLImage", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/MLImage.xcframework.zip", checksum: "d360820204628a8d6d9a915d0bd9ed78aec6ed0eeed7c84c1e78bd85909bbe37"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/MLKitCommon.xcframework.zip", checksum: "50e1c24fc66b9a5b0516dccee5a27bca226e4f41f661799fc96873b572b51417"),
        .binaryTarget(name: "MLKitFaceDetection", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/MLKitFaceDetection.xcframework.zip", checksum: "dbdc769316aa27e316a6404ee9cac847265e0ba6a164f680d10aaa192978fdfb"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/MLKitVision.xcframework.zip", checksum: "19acaf1d993c6911bca9684364d47362cd8ff30ee2609f02a5f94d5143e64edb"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/GoogleToolboxForMac.xcframework.zip", checksum: "6f2e01c3fada4c9a92f45cd83374716026cb5aebf4fed1f74bdd3eba9e9d83bc"),
        .binaryTarget(
            name: "GoogleUtilitiesComponents", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/GoogleUtilitiesComponents.xcframework.zip", checksum: "e9b4e629a140234cee5f4da292219c32f3212fc1fce23c773043e10692abb14d"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/3.2.0/Protobuf.xcframework.zip", checksum: "e411598ad55b7a74bdec956e67fd7e6b453fcd4267c0f7ccfdfad0952a220cbd"),
        .target(
            name: "Common",
            dependencies: [
                "MLKitCommon",
                "GoogleToolboxForMac",
                "GoogleUtilitiesComponents",
                "Protobuf",
                .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                .product(name: "GULEnvironment", package: "GoogleUtilities"),
                .product(name: "GULISASwizzler", package: "GoogleUtilities"),
                .product(name: "GULLogger", package: "GoogleUtilities"),
                .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
                .product(name: "GULNSData", package: "GoogleUtilities"),
                .product(name: "GULNetwork", package: "GoogleUtilities"),
                .product(name: "GULReachability", package: "GoogleUtilities"),
                .product(name: "GULUserDefaults", package: "GoogleUtilities"),
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "FBLPromises", package: "promises"),
            ]),
    ])

/*
 let package = Package(
     name: "MLKitPackage",
     platforms: [
         .iOS(.v13),
     ],
     products: [
         .library(
             name: "MLKitPackage",
             targets: ["MLKitPackage"]
         ),
     ],
     dependencies: [
         .package(
             url: "https://github.com/google/GoogleDataTransport.git",
             "8.4.0"..<"9.0.0"
         ),
         .package(
             url: "https://github.com/google/GoogleUtilities.git",
             "7.4.0"..<"8.0.0"
         ),
         .package(
             url: "https://github.com/google/gtm-session-fetcher.git",
             "1.5.0"..<"2.0.0"
         ),
         .package(
             url: "https://github.com/firebase/nanopb.git",
             "2.30908.0"..<"2.30909.0"
         ),
         .package(
             url: "https://github.com/google/promises.git",
             "1.2.0"..<"1.3.0"
         ),
     ],
     targets: [
         .target(
             name: "MLKitPackage",
             dependencies: [
                 .product(name: "FBLPromises", package: "Promises"),
                 .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                 .target(name: "GoogleToolboxForMac"),
                 .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                 .product(name: "GULEnvironment", package: "GoogleUtilities"),
                 .product(name: "GULLogger", package: "GoogleUtilities"),
                 .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
                 .product(name: "GULNetwork", package: "GoogleUtilities"),
                 .product(name: "GULNSData", package: "GoogleUtilities"),
                 .product(name: "GULReachability", package: "GoogleUtilities"),
                 .product(name: "GULUserDefaults", package: "GoogleUtilities"),
                 .target(name: "GoogleUtilitiesComponents"),
                 .product(name: "GTMSessionFetcherFull", package: "gtm-session-fetcher"),
                 // All `MLKit*` must be added to the Build Phases -> Link Binary with libraries
                 // of your project and should not be content of the Package.swift.
 //                .target(name: "MLKitCommon"),
 //                .target(name: "MLKitFaceDetection"),
 //                .target(name: "MLKitImageLabeling"),
 //                .target(name: "MLKitImageLabelingCommon"),
 //                .target(name: "MLKitObjectDetectionCommon"),
 //                .target(name: "MLKitVision"),
 //                .target(name: "MLKitVisionKit"),
                 .product(name: "nanopb", package: "nanopb"),
                 .target(name: "Protobuf"),
             ],
             path: "Sources/MLKitPackage"
         ),

 //        .binaryTarget(name: "FBLPromises", path: "FBLPromises.xcframework"),
         .binaryTarget(name: "GoogleToolboxForMac", path: "GoogleToolboxForMac.xcframework"),
         .binaryTarget(name: "GoogleUtilitiesComponents", path: "GoogleUtilitiesComponents.xcframework"),
         // All `MLKit*` must be added to the Build Phases -> Link Binary with libraries
         // of your project and should not be content of the Package.swift.
 //        .binaryTarget(name: "MLKitCommon", path: "MLKitCommon.xcframework"),
 //        .binaryTarget(name: "MLKitFaceDetection", path: "MLKitFaceDetection.xcframework"),
 //        .binaryTarget(name: "MLKitImageLabeling", path: "MLKitImageLabeling.xcframework"),
 //        .binaryTarget(name: "MLKitImageLabelingCommon", path: "MLKitImageLabelingCommon.xcframework"),
 //        .binaryTarget(name: "MLKitObjectDetectionCommon", path: "MLKitObjectDetectionCommon.xcframework"),
 //        .binaryTarget(name: "MLKitVision", path: "MLKitVision.xcframework"),
 //        .binaryTarget(name: "MLKitVisionKit", path: "MLKitVisionKit.xcframework"),
         .binaryTarget(name: "Protobuf", path: "Protobuf.xcframework"),
     ]
 )
 */
