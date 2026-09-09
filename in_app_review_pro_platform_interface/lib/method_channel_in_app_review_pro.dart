import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'in_app_review_pro_platform_interface.dart';

/// An implementation of [InAppReviewPlatform] that uses method channels.
class MethodChannelInAppReview extends InAppReviewPlatform {
  MethodChannel _channel = MethodChannel('dev.wanwenfeng.in_app_review_pro');
  TargetPlatform? _platformOverride;

  TargetPlatform get _platform =>
      _platformOverride ?? defaultTargetPlatform;

  @visibleForTesting
  set channel(MethodChannel channel) => _channel = channel;

  @visibleForTesting
  set platform(TargetPlatform platform) => _platformOverride = platform;

  @override
  Future<bool> isAvailable() async {
    if (kIsWeb) return false;
    return _channel
        .invokeMethod<bool>('isAvailable')
        .then((available) => available ?? false, onError: (_) => false);
  }

  @override
  Future<void> requestReview() => _channel.invokeMethod('requestReview');

  @override
  Future<void> openStoreListing({
    String? appStoreId,
    String? microsoftStoreId,
  }) async {
    final bool isiOS = _platform == TargetPlatform.iOS;
    final bool isMacOS = _platform == TargetPlatform.macOS;
    final bool isAndroid = _platform == TargetPlatform.android;
    final bool isWindows = _platform == TargetPlatform.windows;

    if (isiOS || isMacOS) {
      await _channel.invokeMethod(
        'openStoreListing',
        ArgumentError.checkNotNull(appStoreId, 'appStoreId'),
      );
    } else if (isAndroid) {
      await _channel.invokeMethod('openStoreListing');
    } else if (isWindows) {
      ArgumentError.checkNotNull(microsoftStoreId, 'microsoftStoreId');
      await _launchUrl(
        'ms-windows-store://review/?ProductId=$microsoftStoreId',
      );
    } else {
      throw UnsupportedError(
        'Platform($_platform) not supported',
      );
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await canLaunchUrlString(url)) return;
    await launchUrlString(url, mode: LaunchMode.externalNonBrowserApplication);
  }
}
