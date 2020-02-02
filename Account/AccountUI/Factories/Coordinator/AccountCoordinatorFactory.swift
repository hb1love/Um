//
//  AccountCoordinatorFactory.swift
//  AccountUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

public final class AccountCoordinatorFactory: AccountCoordinatorFactoryProtocol {

  private let moduleFactory: AccountModuleFactory

  public init(moduleFactory: AccountModuleFactory) {
    self.moduleFactory = moduleFactory
  }

  public func makeLaunchCoordinator(router: Routable) -> Coordinator & LaunchCoordinatorOutput {
    return LaunchCoordinator(
      coordinatorFactory: self,
      moduleFactory: moduleFactory,
      router: router
    )
  }

  public func makeLoginCoordinator(router: Routable) -> Coordinator & LoginCoordinatorOutput {
    return LoginCoordinator(
      coordinatorFactory: self,
      moduleFactory: moduleFactory,
      router: router
    )
  }

  public func makeMyPageCoordinator(router: Routable) -> RootCoordinator & MyPageCoordinatorOutput {
    return MyPageCoordinator(
      coordinatorFactory: self,
      moduleFactory: moduleFactory,
      router: router
    )
  }
}
