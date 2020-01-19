//
//  ApplicationCoordinator.swift
//  Um
//
//  Created by hb1love on 2020/01/11.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareUI

var isLaunched = false
var isAuthorized = false
var onboardingWasShown = true

enum LaunchInstructor {
  case launch, auth, onboarding, main

  static func configure(
    isLaunched: Bool = isLaunched,
    isAuthorized: Bool = isAuthorized,
    tutorialWasShown: Bool = onboardingWasShown
    ) -> LaunchInstructor {
    switch (isLaunched, isAuthorized, tutorialWasShown) {
    case (false, _, _): return .launch
    case (true, false, _): return .auth
    case (true, true, false): return .onboarding
    case (true, true, true): return .main
    }
  }
}

final class ApplicationCoordinator: BaseCoordinator {

  private let mainCoordinatorFactor: MainCoordinatorFactoryProtocol
  private let shareCoordinatorFactory: ShareCoordinatorFactoryProtocol
  private let router: Routable

  private var instructor: LaunchInstructor {
    return LaunchInstructor.configure()
  }

  init(
    mainCoordinatorFactor: MainCoordinatorFactoryProtocol,
    shareCoordinatorFactory: ShareCoordinatorFactoryProtocol,
    router: Routable
    ) {
    self.mainCoordinatorFactor = mainCoordinatorFactor
    self.shareCoordinatorFactory = shareCoordinatorFactory
    self.router = router
  }

  override func start() {
//    switch instructor {
//    case .launch: runLaunchFlow()
//    case .auth: runAuthFlow()
//    case .onboarding: runOnboardingFlow()
//    case .main: runMainFlow()
//    }
    runMainFlow()
  }

//  private func runLaunchFlow() {
//    let coordinator = coordinatorFactory.makeLaunchCoordinator(router: router)
//    coordinator.finishFlow = { [weak self, weak coordinator] authorized, isFirst in
//      isLaunched = true
//      isAuthorized = authorized
//      onboardingWasShown = !isFirst
//      self?.start()
//      self?.removeDependency(coordinator)
//    }
//    addDependency(coordinator)
//    coordinator.start()
//  }
//
//  private func runAuthFlow() {
//    let coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
//    coordinator.finishFlow = { [weak self, weak coordinator] in
//      isAuthorized = true
//      self?.start()
//      self?.removeDependency(coordinator)
//    }
//    addDependency(coordinator)
//    coordinator.start()
//  }
//
//  private func runOnboardingFlow() {
//    let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
//    coordinator.finishFlow = { [weak self, weak coordinator] in
//      onboardingWasShown = true
//      self?.start()
//      self?.removeDependency(coordinator)
//    }
//    addDependency(coordinator)
//    coordinator.start()
//  }
//
  private func runMainFlow() {
    let coordinator = mainCoordinatorFactor.makeMainCoordinator(router: router)
    coordinator.finishFlow = { [weak self, weak coordinator] in
      self?.start()
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    coordinator.start()
  }
}
