use_frameworks!
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TheMovieDatabaseApp' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for TheMovieDatabaseApp
  pod 'JSONModel'
  pod 'SDWebImage'
  pod 'UIActivityIndicator-for-SDWebImage'
  pod 'PromiseKit/Foundation'

  target 'TheMovieDatabaseAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TheMovieDatabaseAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
