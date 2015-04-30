#
# Be sure to run `pod lib lint KRKit.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "KRKit"
  s.version          = "0.1.0"
  s.summary          = "A short description of KRKit."
  s.description      = <<-DESC
                       An optional longer description of KRKit

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/36Kr-Mobile/KRKit"
  s.license          = 'MIT'
  s.author           = { "aidenluo" => "aidenluo177@gmail.com" }
  s.source           = { :git => "https://github.com/36Kr-Mobile/KRKit.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'KRKit/KRKit/Source/**/*'
  s.frameworks = 'UIKit'
end
