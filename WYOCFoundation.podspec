#
# Be sure to run `pod lib lint WYOCFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WYOCFoundation'
  s.version          = '0.0.1'
  s.summary          = 'iOS 常用基本组件.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
iOS 常用基本组件.
                       DESC

  s.homepage         = 'https://github.com/wuyaGit/WYOCFoundation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wuya' => '407671883@qq.com' }
  s.source           = { :git => 'https://github.com/wuyaGit/WYOCFoundation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  #s.source_files = 'WYOCFoundation/Classes/**/*'
  
  s.source_files = 'WYOCFoundation/Classes/WYOCFoundationHeader.h'
  
  s.subspec 'Content' do |ss|
      ss.source_files = 'WYOCFoundation/Classes/**/*.{h,m}'
      ss.exclude_files = 'WYOCFoundation/Classes/WYOCFoundationHeader.h'
      #ss.frameworks = "MapKit" , "WebKit" , "AudioToolbox"
  end

  s.resource_bundles = {
    'WYOCFoundation' => ['WYOCFoundation/WYOCFoundation.bundle']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'MBProgressHUD'
   s.dependency 'Toast'
   s.dependency 'Masonry'
   s.dependency 'Aspects'

end
