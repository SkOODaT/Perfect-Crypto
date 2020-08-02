// swift-tools-version:5.2

import PackageDescription

#if os(Linux)
	let cOpenSSLRepo = "https://github.com/123FLO321/Perfect-COpenSSL-Linux.git"
#else
	let cOpenSSLRepo = "https://github.com/123FLO321/Perfect-COpenSSL.git"
#endif

let package = Package(
    name: "PerfectCrypto",
	platforms: [
		.macOS(.v10_15)
	],
	products: [
		.library(name: "PerfectCrypto", targets: ["PerfectCrypto"])
	],
    dependencies: [
        .package(name: "PerfectLib", url: "https://github.com/123FLO321/Perfect.git", .branch("swift5")),
        .package(name: "PerfectThread", url: "https://github.com/123FLO321/Perfect-Thread.git", .branch("swift5")),
        .package(name: "COpenSSL", url: cOpenSSLRepo, .branch("swift5"))
	],
	targets: [
		.target(name: "PerfectCrypto", dependencies: ["PerfectLib", "PerfectThread", "COpenSSL"]),
		.testTarget(name: "PerfectCryptoTests", dependencies: ["PerfectCrypto"])
	]
)
