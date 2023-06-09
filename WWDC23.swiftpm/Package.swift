// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "SomeTone",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "SomeTone",
            targets: ["AppModule"],
            bundleIdentifier: "Academy.WWDC23.",
            teamIdentifier: "YFB3KM7U74",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
//                .portrait,
                .landscapeRight,
                .landscapeLeft,
//                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            appCategory: .music
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
