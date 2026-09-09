# in_app_review_pro_platform_interface

A common platform interface for the [`in_app_review_pro`][1] plugin.

This interface allows platform-specific implementations of the `in_app_review_pro`
plugin, as well as the plugin itself, to ensure they are supporting the
same interface.

# Usage

To implement a new platform-specific implementation of `in_app_review_pro`, extend
[InAppReviewPlatform][2] with an implementation that performs the
platform-specific behavior, and when you register your plugin, set the default
`InAppReviewPlatform` by calling
`InAppReviewPlatform.instance = MyPlatformInAppReview()`.

[1]: ../in_app_review_pro
[2]: lib/in_app_review_pro_platform_interface.dart
