# [0.1.0]

- Initial `in_app_review_pro` release (forked from britannio/in_app_review).
- Renames the package and directories to `in_app_review_pro` / `in_app_review_pro_platform_interface`.
- Updates repository URLs to https://github.com/wanwenfeng4798/in_app_review_pro.
- Requires Flutter 3.44+ / Dart 3.12+.
- Migrates to AGP built-in Kotlin.
- Upgrades Android Gradle Plugin to 9.4.0 and Gradle to 9.7.1 (Java 17).
- Aligns Android toolchain with compileSdk/targetSdk 37, build-tools 37.0.0, NDK 30.0.16138531, and Kotlin 2.4.10.
- Aligns Swift Package Manager manifests with the FlutterFramework dependency.
- Raises the macOS CocoaPods deployment target to 10.14 to match Package.swift and docs.
- Includes prior upstream fixes and features (privacy manifests, SPM layout, Play Review 2.0.2, Kotlin Android plugin, null-safety, store listing helpers, and related platform improvements).
