version = '2.4.5'

Pod::Spec.new do |s|
  s.name     = 'AFNetworking-OpenTable'
  s.version  = version
  s.license  = 'MIT'
  s.summary  = 'A delightful iOS and OS X networking framework.'
  s.homepage = 'https://github.com/AFNetworking/AFNetworking'
  s.authors  = { 'Mattt Thompson' => 'm@mattt.me' }
  s.source   = { :git => 'https://github.com/opentable/AFNetworking.git', :tag => "#{version}-OpenTable" }
  s.source_files = 'AFNetworking'
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.8'

  s.public_header_files = 'AFNetworking/*.h'
  s.source_files = 'AFNetworking/AFNetworking.h'

   # so that we don't need to reference "AFNetworking-OpenTable" when importing libraries
  s.header_dir = 'AFNetworking'

  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
    ss.ios.frameworks = 'MobileCoreServices', 'CoreGraphics'
    ss.osx.frameworks = 'CoreServices'
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'AFNetworking/AFSecurityPolicy.{h,m}'
    ss.frameworks = 'Security'
  end

  s.subspec 'Reachability' do |ss|
    ss.source_files = 'AFNetworking/AFNetworkReachabilityManager.{h,m}'
    ss.frameworks = 'SystemConfiguration'
  end

  s.subspec 'NSURLConnection' do |ss|
    ss.dependency 'AFNetworking-OpenTable/Serialization'
    ss.dependency 'AFNetworking-OpenTable/Reachability'
    ss.dependency 'AFNetworking-OpenTable/Security'

    ss.source_files = 'AFNetworking/AFURLConnectionOperation.{h,m}', 'AFNetworking/AFHTTPRequestOperation.{h,m}', 'AFNetworking/AFHTTPRequestOperationManager.{h,m}'
  end

  s.subspec 'NSURLSession' do |ss|
    ss.dependency 'AFNetworking-OpenTable/NSURLConnection'

    ss.source_files = 'AFNetworking/AFURLSessionManager.{h,m}', 'AFNetworking/AFHTTPSessionManager.{h,m}'
  end

  s.subspec 'UIKit' do |ss|
    ss.ios.deployment_target = '6.0'

    ss.dependency 'AFNetworking-OpenTable/NSURLConnection'
    ss.dependency 'AFNetworking-OpenTable/NSURLSession'

    ss.ios.public_header_files = 'UIKit+AFNetworking/*.h'
    ss.ios.source_files = 'UIKit+AFNetworking'
    ss.osx.source_files = ''
  end
end
