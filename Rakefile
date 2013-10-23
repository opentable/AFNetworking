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
		end
	end

task :clean do
	# dump temp build folder
	FileUtils.rm_rf "./build"
	FileUtils.rm_rf "./pkg"

	# and cocoa pods artifacts
	FileUtils.rm_rf builder.configuration.workspace_file_path
	FileUtils.rm_rf "Podfile.lock"
end

# pod requires a full clean and runs pod install
task :pod => :clean do
	system "pod install"
end

desc "Cleans, runs pod and opens the workspace"
task :open => :pod do
	system "open #{builder.configuration.workspace_file_path}"
end

desc "Builds the pod, tags git, pod push and bump version"
task :release => :pod do
	builder.pod_release
end