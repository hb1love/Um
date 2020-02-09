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
var needToAuthorize = false

enum LaunchInstructor {
  case launch, auth, main

  static func configure(
    isLaunched: Bool = isLaunched,
    isAuthorized: Bool = isAuthorized,
    needToAuthorize: Bool = needToAuthorize
  ) -> LaunchInstructor {
    switch (isLaunched, isAuthorized, needToAuthorize) {
    case (false, _, _): return .launch
    case (_, true, _): return .main
    case (_, _, false): return .main
    case (_, _, true): return .auth
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
    coordinator.finishFlow = { [weak self, weak coordinator] loggedIn in
      isAuthorized = loggedIn
      needToAuthorize = loggedIn
      self?.start()
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    coordinator.start()
  }

  private func runMainFlow() {
    let coordinator = mainCoordinatorFactory.makeMainCoordinator(router: router)
    coordinator.isAuthorized = isAuthorized
    coordinator.finishFlow = { [weak self, weak coordinator] needAuthorize in
      needToAuthorize = needAuthorize
      self?.start()
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    coordinator.start()
  }
}
