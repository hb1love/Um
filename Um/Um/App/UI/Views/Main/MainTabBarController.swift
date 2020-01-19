//
//  MainTabBarController.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common

final class MainTabBarController: UITabBarController {
  var serviceMap = [ServiceType: RootCoordinator]()

  init(serviceMap: [ServiceType: RootCoordinator]) {
    super.init(nibName: nil, bundle: nil)
    self.serviceMap = serviceMap
    setupSubviews()
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setupSubviews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupSubviews() {
    var serviceViews = [UIViewController]()
    ServiceType.allCases.forEach { service in
      if let coordinator = self.serviceMap[service] {
        let tabBarItem = UITabBarItem()
        tabBarItem.title = service.rawValue
        switch service {
        case .home:
          tabBarItem.image = UIImage(named: "ic_bottom_nav_project_inactive")
          tabBarItem.selectedImage = UIImage(named: "ic_bottom_nav_project_active")!
            .withRenderingMode(.alwaysOriginal)
        default:
          break
        }
        let navigationController = coordinator.rootViewController
        navigationController.tabBarItem = tabBarItem
        serviceViews.append(navigationController)
        coordinator.start()
      }
    }
    setViewControllers(serviceViews, animated: true)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
}
