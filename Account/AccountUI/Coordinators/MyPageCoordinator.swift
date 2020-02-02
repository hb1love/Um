//
//  MyPageCoordinator.swift
//  AccountUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common

public protocol MyPageCoordinatorOutput: AnyObject {
  var finishFlow: (() -> Void)? { get set }
}

public final class MyPageCoordinator: BaseCoordinator, MyPageCoordinatorOutput, RootCoordinator {

  private let coordinatorFactory: AccountCoordinatorFactoryProtocol
  private let moduleFactory: MyPageModuleFactoryType
  private let router: Routable

  public var finishFlow: (() -> Void)?
  public var changeTabBar: ((Bool) -> Void)?
  public let rootViewController: UINavigationController

  init(
    coordinatorFactory: AccountCoordinatorFactoryProtocol,
    moduleFactory: MyPageModuleFactoryType,
    router: Routable
    ) {
    self.coordinatorFactory = coordinatorFactory
    self.moduleFactory = moduleFactory
    self.router = router
    self.rootViewController = router.rootController
  }

  public override func start() {
    showMyPage()
  }

  private func showMyPage() {
    let myPageModule = moduleFactory.makeMyPageModule()
    myPageModule.didLogout = {

    }
    router.setRoot(myPageModule)
  }

  private func runLoginFlow() {
    
  }

//  private func showWelcome() {
//    let welcomeModule = moduleFactory.makeWelcomeModule()
//    welcomeModule.onSelectSideMenu = { [weak self] in
//      self?.runSettingsFlow()
//    }
//    welcomeModule.onCreateProfile = { [weak self] in
//      self?.runEditFlow()
//    }
//    router.setRoot(welcomeModule)
//  }
//
//  private func runEditFlow() {
//    let (coordinator, module) = coordinatorFactory.makeEditCoordinatorBox()
//    coordinator.finishFlow = { [weak self, weak coordinator] in
//      self?.router.dismiss()
//      self?.removeDependency(coordinator)
//    }
//    addDependency(coordinator)
//    router.present(module)
//    coordinator.start()
//  }
//
//  private func runSettingsFlow() {
//    let (coordinator, module) = coordinatorFactory.makeSettingsCoordinatorBox()
//    coordinator.finishFlow = { [weak self, weak coordinator] in
//      self?.router.dismiss()
//      self?.removeDependency(coordinator)
//    }
//    addDependency(coordinator)
//    router.present(module)
//    coordinator.start()
//  }
}
