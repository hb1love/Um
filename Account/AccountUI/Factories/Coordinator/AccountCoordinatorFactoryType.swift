//
//  AccountCoordinatorFactoryType.swift
//  AccountUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

public protocol AccountCoordinatorFactoryType {
  func makeMyPageCoordinator(router: Routable) ->
    Coordinator & MyPageCoordinatorOutput
}
