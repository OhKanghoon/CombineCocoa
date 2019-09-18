Pod::Spec.new do |s|
  s.name             = 'CombineCocoa'
  s.version          = '0.0.1'
  s.summary          = 'Combine Cocoa extensions'
  s.description      = <<-DESC
  UI extensions
  DESC

  s.homepage         = 'https://github.com/OhKanghoon/CombineCocoa'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'OhKanghoon' => 'ggaa96@naver.com' }
  s.source           = { :git => 'https://github.com/OhKanghoon/CombineCocoa.git', :tag => s.version.to_s }

  s.swift_version = '5.0'
  s.ios.deployment_target = '13.0'
  s.frameworks = 'Combine', 'UIKit'

  s.source_files = 'Sources/**/*.{swift,h,m}'
end
