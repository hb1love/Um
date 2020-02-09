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

final class MainCoordinatorFactory: MainCoordinatorFactoryProtocol {
  private let mainModuleFactory: MainModuleFactoryType
  private let shareModuleFactory: ShareEditModuleFactoryType

  public var isAuthorized: Bool?

  init(
    mainModuleFactory: MainModuleFactoryType,
    shareModuleFactory: ShareEditModuleFactoryType
  ) {
    self.mainModuleFactory = mainModuleFactory
    self.shareModuleFactory = shareModuleFactory
  }

  func makeMainCoordinator(router: Routable) ->
    Coordinator & MainTabCoordinatorInput & MainTabCoordinatorOutput {
    return MainTabCoordinator(
      mainModuleFactory: mainModuleFactory,
      shareModuleFactory: shareModuleFactory,
      router: router
    )
  }
}
