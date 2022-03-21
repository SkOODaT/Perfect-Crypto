// swift-tools-version:5.2

import PackageDescription

#if os(Linux)
	let cOpenSSLRepo = "https://github.com/SkOODaT/Perfect-COpenSSL-Linux.git"
#else
	let cOpenSSLRepo = "https://github.com/SkOODaT/Perfect-COpenSSL.git"
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
        .package(name: "PerfectLib", url: "https://github.com/SkOODaT/Perfect.git", .branch("SKOODAT")),
        .package(name: "PerfectThread", url: "https://github.com/SkOODaT/Perfect-Thread.git", .branch("SKOODAT")),
        .package(name: "COpenSSL", url: cOpenSSLRepo, .branch("SKOODAT"))
	],
	targets: [
		.target(name: "PerfectCrypto", dependencies: ["PerfectLib", "PerfectThread", "COpenSSL"]),
		.testTarget(name: "PerfectCryptoTests", dependencies: ["PerfectCrypto"])
	]
)
