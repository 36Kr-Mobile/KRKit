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
  s.version          = "1.0"
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

  s.ios.deployment_target = '7.0'

  s.source_files = 'KRKit/KRKit/Source/KRKit.h'
  s.public_header_files = 'KRKit/KRKit/Source/KRKit.h'

  s.subspec 'Categories' do |ss|

    ss.subspec 'Foundation' do |sss|
      sss.source_files = 'KRKit/KRKit/Source/Categories/Foundation/*.{h,m}'
    end

    ss.subspec 'UIKit' do |sss|
      sss.source_files = 'KRKit/KRKit/Source/Categories/UIKit/*.{h,m}'
    end

  end

  s.subspec 'Macro' do |ss|
    ss.source_files = 'KRKit/KRKit/Source/Macro/*.{h,m}'
  end

  s.subspec 'UI Component' do |ss|
    ss.source_files = 'KRKit/KRKit/Source/UI Component/*.{h,m}'
  end

end
