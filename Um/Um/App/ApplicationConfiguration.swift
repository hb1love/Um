//
//  ApplicationConfiguration.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import AuthService
import UserService
import ShareUI
import ShareService

enum ServiceType: String, CaseIterable {
  case home
  case share
  case chat
  case account
}

struct ApplicationConfiguration:
  ShareUIConfiguration,
  AuthServiceConfiguration,
  UserServiceConfiguration,
  ShareServiceConfiguration {

  static let root: UINavigationController = {
    return UINavigationController()
  }()

  static let serviceMap: [ServiceType: RootCoordinator]
    = [.home: shareCoordinatorFactory.makeListCoordinator(router: Router(rootController: root))]
//  ,
//       .share: shareCoordinatorFactory.makeEditCoordinator(router: Router(rootController: root))]

  static let mainCoordinatorFactory = MainCoordinatorFactory(
    moduleFactory: MainModuleFactory(serviceMap: serviceMap)
  )

  static let authPlugin = AuthPlugin(authUseCase: authUseCase)

  static let authUseCase = AuthServiceInjector.resolve(
    with: ApplicationConfiguration.self
  )
  static let userUseCase = UserServiceInjector.resolve(
    with: ApplicationConfiguration.self
  )
  static let shareCoordinatorFactory = ShareUIInjector.resolve(
    with: ApplicationConfiguration.self
  )
  static let shareUseCase = ShareServiceInjector.resolve(
    with: ApplicationConfiguration.self
  )


  // MARK: - ShareUIConfiguration

  static let shareUIDependency: ShareUIDependency = {
    return ShareUIDependency(shareUseCase: shareUseCase)
  }()


  // MARK: - Serivce Common

  static let baseUrl: String = {
    return "http://test.team4.ryulth.com/"
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
