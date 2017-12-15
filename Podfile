source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!


def shared_pods
	# usage analytics and crash reporting
    pod 'Fabric'
    pod 'Crashlytics'

    pod 'AFNetworking', '~> 3.1' # Networking library
    pod 'JSONModel', '~> 1.7'

    pod 'Typhoon', '~> 4.0' # dependency injection

    pod 'ObjectiveSugar', '~> 1.1' # Objective-C Foundation helper methods
    pod 'SDWebImage', '~> 4.2'
    pod 'SVProgressHUD', '~> 2.2'
end


target 'NYTArticles' do
    shared_pods
end
