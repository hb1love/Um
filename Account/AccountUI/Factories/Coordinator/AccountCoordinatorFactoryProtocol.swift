//
//  AccountCoordinatorFactoryProtocol.swift
//  AccountUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

public protocol AccountCoordinatorFactoryProtocol {
  func makeLaunchCoordinator(router: Routable) ->
    Coordinator & LaunchCoordinatorOutput

  func makeLoginCoordinator(router: Routable) ->
    Coordinator & LoginCoordinatorOutput

  func makeMyPageCoordinator(router: Routable) ->
    RootCoordinator & MyPageCoordinatorOutput
}
