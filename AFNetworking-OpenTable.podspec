version = "2.1.0"

Pod::Spec.new do |s|
  s.name     = 'AFNetworking-OpenTable'
  s.version  = version
  s.license  = 'MIT'
  s.summary  = 'A delightful iOS and OS X networking framework.'
  s.homepage = 'https://github.com/AFNetworking/AFNetworking'
  s.authors  = { 'Mattt Thompson' => 'm@mattt.me', 'Scott Raymond' => 'sco@gowalla.com' }
  s.source   = { :git => 'https://github.com/opentable/AFNetworking.git', :tag => "#{version}-OpenTable", :submodules => true }
  s.requires_arc = true

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'

  s.public_header_files = 'AFNetworking/*.h'
  
  s.source_files = ["AFNetworking/**/*.{h,m,c,mm,cpp}"]
  s.frameworks = 'MobileCoreServices'
  s.frameworks = 'CoreGraphics'
  s.frameworks = 'Security'
  s.frameworks = 'SystemConfiguration'

  s.header_dir = 'AFNetworking'

end
