//
//  MainCoordinatorFactory.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

final class MainCoordinatorFactory: MainCoordinatorFactoryProtocol {
  private let moduleFactory: MainModuleFactoryType

  init(moduleFactory: MainModuleFactoryType) {
    self.moduleFactory = moduleFactory
  }

  func makeMainCoordinator(router: Routable) -> Coordinator & MainTabCoordinatorOutput {
    return MainTabCoordinator(
      with: moduleFactory,
      router: router
    )
  }
}
