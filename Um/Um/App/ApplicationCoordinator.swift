//
//  ApplicationCoordinator.swift
//  Um
//
//  Created by hb1love on 2020/01/11.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import AccountUI
import ShareUI

var isLaunched = false
var isAuthorized = false

enum LaunchInstructor {
  case launch, auth, main

  static func configure(
    isLaunched: Bool = isLaunched,
    isAuthorized: Bool = isAuthorized
    ) -> LaunchInstructor {
    switch (isLaunched, isAuthorized) {
    case (false, _): return .launch
    case (true, _): return .main
    }
  }
}

final class ApplicationCoordinator: BaseCoordinator {

  private let mainCoordinatorFactory: MainCoordinatorFactoryProtocol
  private let accountCoordinatorFactory: AccountCoordinatorFactoryProtocol
  private let shareCoordinatorFactory: ShareCoordinatorFactoryProtocol
  private let router: Routable

  private var instructor: LaunchInstructor {
    return LaunchInstructor.configure()
  }

  init(
    mainCoordinatorFactory: MainCoordinatorFactoryProtocol,
    accountCoordinatorFactory: AccountCoordinatorFactoryProtocol,
    shareCoordinatorFactory: ShareCoordinatorFactoryProtocol,
    router: Routable
    ) {
    self.mainCoordinatorFactory = mainCoordinatorFactory
    self.accountCoordinatorFactory = accountCoordinatorFactory
    self.shareCoordinatorFactory = shareCoordinatorFactory
    self.router = router
  }

  override func start() {
    switch instructor {
    case .launch: runLaunchFlow()
    case .auth: runAuthFlow()
    case .main: runMainFlow()
    }
  }

  private func runLaunchFlow() {
    let coordinator = accountCoordinatorFactory.makeLaunchCoordinator(router: router)
    coordinator.finishFlow = { [weak self, weak coordinator] authorized in
      isLaunched = true
      isAuthorized = false
//      isAuthorized = authorized
      self?.start()
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    coordinator.start()
  }

  private func runAuthFlow() {
    let coordinator = accountCoordinatorFactory.makeLoginCoordinator(router: router)
    coordinator.finishFlow = { [weak self, weak coordinator] in
      isAuthorized = true
      self?.start()
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    coordinator.start()
  }

  private func runMainFlow() {
    let coordinator = mainCoordinatorFactory.makeMainCoordinator(router: router)
    coordinator.isAuthorized = isAuthorized
    coordinator.finishFlow = { [weak self, weak coordinator] in
      self?.start()
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    coordinator.start()
  }
}
