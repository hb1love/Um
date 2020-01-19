platform :ios, '13.0'
workspace 'Um'

inhibit_all_warnings!
use_frameworks!

def common
  pod 'SwiftyBeaver'
  pod 'Umbrella'
  pod 'Umbrella/Firebase'
end

def sdk
#  pod 'Fabric'
#  pod 'Crashlytics'
  pod 'Firebase/Core'
  pod 'Firebase/Analytics'
end

def rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxCodable'
  pod 'RxGesture'
end

def ui
  pod 'ReactorKit'
  pod 'SnapKit'
end

def networking
  pod 'Alamofire'
  pod 'Moya'
  pod 'Moya/RxSwift'
end


target 'Um' do
  project 'Um/Um'
  common
  rx
  ui
  networking
  sdk

  target 'UmTests' do
    inherit! :search_paths
  end
end

target 'Share' do
  project 'Share/Share'
  common
  rx
  ui
  networking

  target 'ShareTests' do
    inherit! :search_paths
  end
end

target 'ShareUI' do
  project 'Share/Share'
  common
  rx
  ui

  target 'ShareUITests' do
    inherit! :search_paths
  end
end

target 'ShareService' do
  project 'Share/Share'
  common
  rx
  networking

  target 'ShareServiceTests' do
    inherit! :search_paths
  end
end

target 'Chat' do
  project 'Chat/Chat'
  common
  rx
  ui
  networking

  target 'ChatTests' do
    inherit! :search_paths
  end
end

target 'Account' do
  project 'Account/Account'
  common
  rx
  ui
  networking

  target 'AccountTests' do
    inherit! :search_paths
  end
end

target 'AccountUI' do
  project 'Account/Account'
  common
  rx
  ui

  target 'AccountUITests' do
    inherit! :search_paths
  end
end

target 'AuthService' do
  project 'Account/Account'
  common
  rx
  networking

  target 'AuthServiceTests' do
    inherit! :search_paths
  end
end

target 'UserService' do
  project 'Account/Account'
  common
  rx
  networking

  target 'UserServiceTests' do
    inherit! :search_paths
  end
end

target 'Common' do
  project 'Common/Common'
  common
  rx
  networking

  target 'CommonTests' do
    inherit! :search_paths
  end
end
