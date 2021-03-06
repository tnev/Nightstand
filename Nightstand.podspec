#
# Be sure to run `pod lib lint Nightstand.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Nightstand'
  s.version          = '0.2.0'
  s.summary          = 'Mightstand simplifies working with static UITableViews'

  s.description      = <<-DESC
Nightstand allows you to create static UITableViews without having to worry about data sources and delegates. Just create your sections and rows, and you're good to go. Nightstand is fully customizable and works with both system and custom UITableViewCells.
                       DESC

  s.homepage         = 'https://github.com/tnev/Nightstand'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tnev' => 'tneveldine@gmail.com' }
  s.source           = { :git => 'https://github.com/tnev/Nightstand.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.source_files = 'Nightstand/Classes/**/*'
end
