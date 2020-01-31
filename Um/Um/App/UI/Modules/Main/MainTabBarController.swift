//
//  MainTabBarController.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import SnapKit

final class MainTabBarController: UITabBarController {

  // MARK: - Contants

  private struct Metric {
    static let floatingBottom = 24.f
  }

  // MARK: - Subviews

  lazy var floatingTabBar: FloatingTabBar = {
    let view = FloatingTabBar()
    view.delegate = self
    view.cornerRadius = 28
    self.view.addSubview(view)
    return view
  }()

  // MARK: - Properties

  var onNewPost: (() -> Void)?

  var serviceMap = [ServiceType: RootCoordinator]()
  var serviceViews = [UIViewController]()

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
    var tabBarItems = [UITabBarItem]()
    ServiceType.allCases.forEach { service in
      if let coordinator = self.serviceMap[service] {
        let tabBarItem = UITabBarItem()
        tabBarItem.title = service.rawValue
        switch service {
        case .share:
          tabBarItem.image = UIImage(named: "tab_home_active")?
            .withRenderingMode(.alwaysTemplate)
          tabBarItem.tag = 0
        case .search:
          tabBarItem.image = UIImage(named: "tab_search_inactive")?
            .withRenderingMode(.alwaysTemplate)
          tabBarItem.tag = 1
        case .write:
          tabBarItem.image = UIImage(named: "tab_write_inactive")?
            .withRenderingMode(.alwaysOriginal)
          tabBarItem.tag = 2
        case .chat:
          tabBarItem.image = UIImage(named: "tab_chat_inactive")?
            .withRenderingMode(.alwaysTemplate)
          tabBarItem.tag = 3
        case .mypage:
          tabBarItem.image = UIImage(named: "tab_mypage_inactive")?
            .withRenderingMode(.alwaysTemplate)
          tabBarItem.tag = 4
        }
        let navigationController = coordinator.rootViewController
        navigationController.tabBarItem = tabBarItem
        tabBarItems.append(tabBarItem)
        serviceViews.append(navigationController)
        coordinator.start()
      }
    }

    self.serviceViews = serviceViews
    floatingTabBar.tabBarItems = tabBarItems

    floatingTabBar.refreshTabBar(index: 0)

    setViewControllers(serviceViews, animated: false)
    tabBar.isHidden = true
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupConstraints()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    floatingTabBar.shadow(
      color: .gray,
      opacity: 0.5,
      offSet: CGSize(width: 1, height: 1),
      radius: 2,
      cornerRadius: 28,
      scale: true
    )
  }

  func setupConstraints() {
    floatingTabBar.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-Metric.floatingBottom)
    }
  }
}

extension MainTabBarController: FloatingTabBarDelegate {
  func didTap(button: FloatingTabButton, at index: Int) {
    if let viewControllers = self.viewControllers {
      if index == 2 {
        onNewPost?()
      } else {
        self.selectedViewController = viewControllers[index]
        floatingTabBar.refreshTabBar(index: index)
      }
    }
  }
}
