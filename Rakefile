require 'rubygems'
require 'xcodebuilder'

builder = XcodeBuilder::XcodeBuilder.new do |config|
		# basic workspace config
		config.build_dir = "./build/"
		config.sdk = "iphonesimulator"
		config.skip_clean = false
		config.verbose = false
		config.increment_plist_version = true
		config.tag_vcs = true
		config.package_destination_path = "./pkg/"
		config.pod_repo = "OpenTable"
		config.podspec_file = "AFNetworking-OpenTable.podspec"

		# tag and release with git
		config.release_using(:git) do |git|
			git.branch = `git rev-parse --abbrev-ref HEAD`.gsub("\n", "")
			git.tag_name = "#{config.build_number}-OpenTable"
		end
	end

task :clean do
	# dump temp build folder
	FileUtils.rm_rf "./build"
	FileUtils.rm_rf "./pkg"

	# and cocoa pods artifacts
	FileUtils.rm_rf "Podfile.lock"
end

# pod requires a full clean and runs pod install
task :pod => :clean do
end

desc "Cleans, runs pod and opens the workspace"
task :open => :pod do
	system "open #{builder.configuration.workspace_file_path}"
end

desc "Builds the pod, tags git, pod push and bump version"
task :release => :pod do
	builder.pod_release
end

# added from AFNetworking 2.0 origin
namespace :test do
  task :prepare do
    system(%Q{mkdir -p "Tests/AFNetworking Tests.xcodeproj/xcshareddata/xcschemes" && cp Tests/Schemes/*.xcscheme "Tests/AFNetworking Tests.xcodeproj/xcshareddata/xcschemes/"})
  end

  desc "Run the AFNetworking Tests for iOS"
  task :ios => :prepare do
    $ios_success = system("xctool -workspace AFNetworking.xcworkspace -scheme 'iOS Tests' -sdk iphonesimulator -configuration Release test -test-sdk iphonesimulator")
  end

  desc "Run the AFNetworking Tests for Mac OS X"
  task :osx => :prepare do
    $osx_success = system("xctool -workspace AFNetworking.xcworkspace -scheme 'OS X Tests' -sdk macosx -configuration Release test -test-sdk macosx")
  end
end

desc "Run the AFNetworking Tests for iOS & Mac OS X"
task :test => ['test:ios', 'test:osx'] do
  puts "\033[0;31m! iOS unit tests failed" unless $ios_success
  puts "\033[0;31m! OS X unit tests failed" unless $osx_success
  if $ios_success && $osx_success
    puts "\033[0;32m** All tests executed successfully"
  else
    exit(-1)
  end
end

task :default => 'test'
