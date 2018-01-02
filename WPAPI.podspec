#
# Be sure to run `pod lib lint WPAPI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WPAPI'
  s.version          = '0.4.1'
  s.summary          = 'An Swift client for the WordPress REST API'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Since the release of 4.7 Vauhan in Dec 2016, WordPress comes with REST API endpoints for posts, comments, terms, users, meta, and settings. This means by default, any WordPress 4.7+ instance can now be used as a BAAS for your app. Written in native Swift 4, WPAPI is a mobile SDK which allows native iOS apps to use yyour WordPress 4.7+ website as a Backend."
  s.homepage         = 'https://cocoapods.org/pods/WPAPI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jacktator' => 'https://github.com/jacktator' }
  s.source           = { :git => 'https://github.com/SK8-PTY-LTD/WPAPI_iOS.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/sk8techs'

  s.ios.deployment_target = '10.0'

  s.source_files = 'WPAPI/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WPAPI' => ['WPAPI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
