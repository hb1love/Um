//
//  MainCoordinatorFactory.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareUI
import AccountUI

final class MainCoordinatorFactory: MainCoordinatorFactoryType {
  private let mainModuleFactory: MainModuleFactoryType
  private let shareCoordinatorFactory: ShareCoordinatorFactoryType
//  private let shareModuleFactory: ShareEditModuleFactoryType

  public var isAuthorized: Bool?

  init(
    mainModuleFactory: MainModuleFactoryType,
    shareCoordinatorFactory: ShareCoordinatorFactoryType
//    shareModuleFactory: ShareEditModuleFactoryType
  ) {
    self.mainModuleFactory = mainModuleFactory
    self.shareCoordinatorFactory = shareCoordinatorFactory
  }

  func makeMainCoordinator(router: Routable) ->
    Coordinator & MainTabCoordinatorInput & MainTabCoordinatorOutput {
    return MainTabCoordinator(
      mainModuleFactory: mainModuleFactory,
      shareCoordinatorFactory: shareCoordinatorFactory,
//      shareModuleFactory: shareModuleFactory,
      router: router
    )
  }
}
