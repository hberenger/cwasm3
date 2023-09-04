// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "CWasm3",
    products: [
        .library(
            name: "CWasm3",
            targets: ["CWasm3"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CWasm3",
            cSettings: [
                .define("APPLICATION_EXTENSION_API_ONLY", to: "YES"),
                .define("d_m3MaxDuplicateFunctionImpl", to: "10"),
                .define("__wasi__", to: "YES"),
                .define("d_m3HasWASI", to: "YES"),
                //for debugging: .define("d_m3EnableStrace", to: "2")
            ]
        ),
        .testTarget(
            name: "CWasm3Tests",
            dependencies: ["CWasm3"],
            exclude: [
                "Resources/add.wat",
                "Resources/constant.wat",
                "Resources/fib64.wat",
                "Resources/imported-add.wat",
                "Resources/memory.wat",
            ]
        ),
    ]
)
