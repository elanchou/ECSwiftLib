#
# Be sure to run `pod lib lint ECSwiftLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ECSwiftLib'
  s.version          = '1.0.2'
  s.summary          = 'Useful macros and extensions for daily swift develop.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      =  <<-DESC
  Useful macros and extensions for daily swift develop,may add more later.
                   DESC

  s.homepage         = 'https://github.com/elanchou/ECSwiftLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ElanChou' => 'lucidity95@gmail.com' }
  s.source           = { :git => 'https://github.com/elanchou/ECSwiftLib.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.1'
  s.requires_arc = true

  s.source_files = 'ECSwiftLib/Classes/**/*'
  s.frameworks = 'UIKit'
  
  # s.resource_bundles = {
  #   'ECSwiftLib' => ['ECSwiftLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
