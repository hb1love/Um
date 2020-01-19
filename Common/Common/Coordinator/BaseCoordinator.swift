//
//  BaseCoordinator.swift
//  Common
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

open class BaseCoordinator: Coordinator {
  public var childCoordinators: [Coordinator] = []

  public init() {}
  open func start() {}
}
