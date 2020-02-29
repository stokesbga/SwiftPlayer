Pod::Spec.new do |s|
  s.name             = 'SwiftPlayer'
  s.version          = '0.4.0'
  s.summary          = 'Swift stream music player, on top of HysteriaPlayer'
  s.description      = <<-DESC
This CocoaPod provides the ability to use a stream player using swift. Built on top of HysteriaPlayer framework.
                       DESC

  s.homepage         = 'https://github.com/iTSangarDEV/SwiftPlayer'
  s.license          = 'MIT'
  s.authors          = { 'Stan Tsai' => 'feocms@gmail.com',
                         'iTSangar' => 'itsangardev@gmail.com',
                         'Alex Yosef' => 'alex@quadio.com' }
  s.source           = { :git => 'https://github.com/stokesbga/SwiftPlayer.git', :tag => s.version.to_s }
  s.platform     = :ios, '10.0'
  s.requires_arc = true
  s.source_files = 'Source/**/*'
  s.dependency 'HysteriaPlayer', '~> 2.1'
end
