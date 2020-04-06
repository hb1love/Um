//
//  ApplicationConfiguration.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import AccountUI
import AuthService
import UserService
import ShareUI
import ShareService

enum ServiceType: String, CaseIterable {
  case share
  case browsing
  case write
  case chat
  case mypage
}

struct ApplicationConfiguration:
  AccountUIConfiguration,
  ShareUIConfiguration,
  AuthServiceConfiguration,
  UserServiceConfiguration,
  ShareServiceConfiguration {

  static var root: UINavigationController {
    get {
      UINavigationController()
    }
  }

  static let serviceMap: [ServiceType: RootCoordinator]
    = [.share: shareCoordinatorFactory.makeListCoordinator(router: Router(rootController: root)),
       .browsing: shareCoordinatorFactory.makeBrowsingCoordinator(router: Router(rootController: root)),
       .write: shareCoordinatorFactory.makeEditCoordinator(router: Router(rootController: root)),
       .chat: accountCoordinatorFactory.makeMyPageCoordinator(router: Router(rootController: root)),
       .mypage: accountCoordinatorFactory.makeMyPageCoordinator(router: Router(rootController: root))]

  static let mainCoordinatorFactory = MainCoordinatorFactory(
    mainModuleFactory: MainModuleFactory(serviceMap: serviceMap),
    shareCoordinatorFactory: shareCoordinatorFactory
  )

  static let authPlugin = AuthPlugin(authUseCase: authUseCase)

  static let accountCoordinatorFactory = AccountUIInjector.resolve(
    with: ApplicationConfiguration.self
  )
  static let authUseCase = AuthServiceInjector.resolve(
    with: ApplicationConfiguration.self
  )
  static let userUseCase = UserServiceInjector.resolve(
    with: ApplicationConfiguration.self
  )
  static let shareUI = ShareUIInjector.resolve(
    with: ApplicationConfiguration.self
  )
  static let shareUseCase = ShareServiceInjector.resolve(
    with: ApplicationConfiguration.self
  )

  static let shareCoordinatorFactory = shareUI.0
  static let shareModuleFactory = shareUI.1

  // MARK: - AccountUIConfiguration

  static let accountUIDependency: AccountUIDependency = {
    return AccountUIDependency(
      authUseCase: authUseCase,
      userUseCase: userUseCase
    )
  }()

  // MARK: - ShareUIConfiguration

  static let shareUIDependency: ShareUIDependency = {
    return ShareUIDependency(
      shareUseCase: shareUseCase,
      userUseCase: userUseCase
    )
  }()


  // MARK: - Common ServiceConfiguration

  static let baseUrl: String = {
    return "http://test.woom.ryulth.com/"
  }()

  // MARK: - AuthServiceConfiguration

  static let authServiceDependency: AuthServiceDependency = {
    return AuthServiceDependency()
  }()

  // MARK: - UserServiceConfiguration

  static let userServiceDependency: UserServiceDependency = {
    return UserServiceDependency(authPlugin: authPlugin)
  }()

  // MARK: - ShareServiceConfiguration

  static let shareServiceDependency: ShareServiceDependency = {
    return ShareServiceDependency(authPlugin: authPlugin)
  }()
}
