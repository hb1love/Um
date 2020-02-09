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

  private var tabBarView: UIView!
  lazy var floatingTabBar: FloatingTabBar = {
    let view = FloatingTabBar()
    view.delegate = self
    view.cornerRadius = 28
    self.view.addSubview(view)
    return view
  }()

  lazy var loginTabBar: LoginTabBar = {
    let view = LoginTabBar()
    view.delegate = self
    view.cornerRadius = 28
    self.view.addSubview(view)
    return view
  }()

  // MARK: - Flow handler

  var onNewPost: (() -> Void)?
  var onSignUp: (() -> Void)?

  // MARK: - Properties

  var serviceMap = [ServiceType: RootCoordinator]()
  var serviceViews = [UIViewController]()
  var isAuthorized: Bool = false

  init(serviceMap: [ServiceType: RootCoordinator], isAuthorized: Bool) {
    super.init(nibName: nil, bundle: nil)
    self.serviceMap = serviceMap
    self.isAuthorized = isAuthorized
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
    isAuthorized ? makeFloatingTabBar() : makeLoginTabBar()
    setupConstraints()
  }

  func makeFloatingTabBar() {
    var serviceViews = [UIViewController]()
    var tabBarItems = [UITabBarItem]()
    ServiceType.allCases.forEach { service in
      if var coordinator = self.serviceMap[service] {
        let tabBarItem = UITabBarItem()
        tabBarItem.title = service.rawValue
        switch service {
        case .share:
          tabBarItem.image = UIImage(named: "tab_home_active")?
            .withRenderingMode(.alwaysTemplate)
          tabBarItem.tag = 0
        case .browsing:
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
        coordinator.changeTabBar = changeTabBar
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

    tabBarView = floatingTabBar
  }

  func makeLoginTabBar() {
    guard var coordinator = self.serviceMap[.share] else { return }

    coordinator.changeTabBar = changeTabBar
    let navigationController = coordinator.rootViewController
    coordinator.start()

    setViewControllers([navigationController], animated: false)
    tabBar.isHidden = true

    tabBarView = loginTabBar
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tabBarView.shadow(
      color: .gray,
      opacity: 0.5,
      offSet: CGSize(width: 1, height: 1),
      radius: 2,
      cornerRadius: 28,
      scale: true
    )
  }

  func setupConstraints() {
    tabBarView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-Metric.floatingBottom)
    }
  }

  func changeTabBar(_ hidden: Bool) {
    let transform: CGAffineTransform = hidden ? .init(translationX: 0, y: 150) : .identity
    UIView.animate(withDuration: 0.5) {
      self.tabBarView.transform = transform
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

extension MainTabBarController: LoginTabBarDelegate {
  func didTap() {
    onSignUp?()
  }
}
