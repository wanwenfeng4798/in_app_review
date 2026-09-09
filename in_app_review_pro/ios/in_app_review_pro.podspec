#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint in_app_review_pro.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'in_app_review_pro'
  s.version          = '0.1.0'
  s.summary          = 'Flutter plugin for showing the In-App Review/System Rating pop up.'
  s.description      = <<-DESC
Flutter plugin for showing the In-App Review/System Rating pop up.
                       DESC
  s.homepage         = 'https://pub.dev/packages/in_app_review_pro'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'wanwenfeng4798' => 'wanwenfeng4798@users.noreply.github.com' }
  s.source           = { :path => '.' }
  s.source_files = 'in_app_review_pro/Sources/in_app_review_pro/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  s.resource_bundles = {'in_app_review_pro_privacy' => ['in_app_review_pro/Sources/in_app_review_pro/PrivacyInfo.xcprivacy']}
end
