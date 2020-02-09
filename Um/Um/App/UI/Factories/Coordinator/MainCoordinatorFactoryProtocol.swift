//
//  MainCoordinatorFactoryProtocol.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

protocol MainCoordinatorFactoryProtocol {
  func makeMainCoordinator(router: Routable) ->
    Coordinator & MainTabCoordinatorInput & MainTabCoordinatorOutput
}
