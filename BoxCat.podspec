#
# Be sure to run `pod lib lint BoxCat.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BoxCat'
  s.version          = '0.1.0'
  s.summary          = 'Convenient loading of bundled resources.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
BoxCat provides an easy interface for loading resources from no matter were they are located in the application bundle. It's able to load resources from main app bundle as well from nested resource bundles and contained frameworks, e.g. Pods that containing images, xib-files and any other types of resources.
                       DESC

  s.homepage         = 'https://github.com/dreyhomedev/BoxCat'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andreas Günther' => 'mailaguenther@gmail.com' }
  s.source           = { :git => 'https://github.com/dreyhomedev/BoxCat.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'BoxCat/Classes/**/*'

end
