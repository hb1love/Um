//
//  ShareCoordinatorFactoryProtocol.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

public protocol ShareCoordinatorFactoryProtocol {
  func makeEditCoordinator(router: Routable) ->
    RootCoordinator & ShareEditCoordinatorOutput

  func makeListCoordinator(router: Routable) ->
    RootCoordinator & ShareListCoordinatorOutput
}
