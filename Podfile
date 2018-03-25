platform :ios, :deployment_target => "9.0"
use_frameworks!
inhibit_all_warnings!

target 'transtracker' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks

  # Pods for transtracker
	pod 'RealmSwift'
	pod 'Charts'	
	pod 'ChartsRealm'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.0'
      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
    end
  end
end
