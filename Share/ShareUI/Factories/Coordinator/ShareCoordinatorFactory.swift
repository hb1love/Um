//
//  ShareCoordinatorFactory.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareService

public final class ShareCoordinatorFactory: ShareCoordinatorFactoryProtocol {
  private let moduleFactory: ShareModuleFactory

  public init(moduleFactory: ShareModuleFactory) {
    self.moduleFactory = moduleFactory
  }

  public func makeEditCoordinator(router: Routable)
    -> RootCoordinator & ShareEditCoordinatorOutput {
    return ShareEditCoordinator(
      with: moduleFactory,
      router: router
    )
  }

  public func makeListCoordinator(router: Routable)
    -> RootCoordinator & ShareListCoordinatorOutput {
    return ShareListCoordinator(
      coordinatorFactory: self,
      moduleFactory: moduleFactory,
      router: router
    )
  }
}
