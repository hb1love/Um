//
//  ShareCoordinatorFactoryType.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

public protocol ShareCoordinatorFactoryType {
  func makeEditCoordinator(router: Routable)
    -> RootCoordinator & ShareEditCoordinatorOutput

  func makeEditCoordinatorBox() -> (
    coordinator: RootCoordinator & ShareEditCoordinatorOutput,
    router: Routable
  )

  func makeListCoordinator(router: Routable)
    -> RootCoordinator & ShareListCoordinatorOutput

  func makeBrowsingCoordinator(router: Routable)
    -> RootCoordinator & BrowsingCoordinatorOutput
}
