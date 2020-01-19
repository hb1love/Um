//
//  MainModuleFactory.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

final class MainModuleFactory: MainModuleFactoryType {

  private let serviceMap: [ServiceType: RootCoordinator]

  init(serviceMap: [ServiceType: RootCoordinator]) {
    self.serviceMap = serviceMap
  }

  func makeMainTabModule() -> MainTabBarController {
    return MainTabBarController(serviceMap: serviceMap)
  }

//  public init(shareUseCase: ShareUseCase) {
//    self.shareUseCase = shareUseCase
//  }

//  public func makeShareEditModule() -> ShareEditViewController {
//    return ShareEditViewController()
//  }
//
//  public func makeShareListModule() -> ShareListViewController {
//    return ShareListViewController()
//  }
}
