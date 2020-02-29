//
//  MainTabCoordinator.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareUI

public protocol MainTabCoordinatorInput: AnyObject {
  var isAuthorized: Bool? { get set }
}

public protocol MainTabCoordinatorOutput: AnyObject {
  var finishFlow: ((_ needToAuthorize: Bool) -> Void)? { get set }
}

final class MainTabCoordinator: BaseCoordinator, MainTabCoordinatorInput, MainTabCoordinatorOutput {

  private let mainModuleFactory: MainModuleFactoryType
  private let shareCoordinatorFactory: ShareCoordinatorFactoryType
//  private let shareModuleFactory: ShareEditModuleFactoryType
  private let router: Routable

  public var isAuthorized: Bool?
  public var finishFlow: ((Bool) -> Void)?

  init(
    mainModuleFactory: MainModuleFactoryType,
    shareCoordinatorFactory: ShareCoordinatorFactoryType,
//    shareModuleFactory: ShareEditModuleFactoryType,
    router: Routable
    ) {
    self.mainModuleFactory = mainModuleFactory
    self.shareCoordinatorFactory = shareCoordinatorFactory
//    self.shareModuleFactory = shareModuleFactory
    self.router = router
  }

  override func start() {
    showMainTab()
  }

  private func showMainTab() {
    let mainTabModule = mainModuleFactory.makeMainTabModule(isAuthorized: isAuthorized ?? false)
    mainTabModule.onNewPost = { [weak self] in
      self?.runEditFlow()
    }
    mainTabModule.onSignUp = { [weak self] in
      self?.router.dismiss()
      self?.finishFlow?(true)
    }
    router.setRoot(mainTabModule)
  }

  private func runEditFlow() {
//    let (coordinator, module) = shareModuleFactory.makeShareEditModule()
//    let signUpModule = shareModuleFactory.makeShareEditModule()
//    signUpModule.onCompleteSignUp = { [weak self] in
//      self?.router.dismiss()
//      self?.finishFlow?()
//    }
//    signUpModule.onCancel = { [weak self] in
//      self?.router.dismiss()
//    }
//    router.present(signUpModule)

    let (coordinator, module) = shareCoordinatorFactory.makeEditCoordinatorBox()
    coordinator.finishFlow = { [weak self, weak coordinator] in
      self?.router.dismiss()
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    router.present(module)
    coordinator.start()
  }
}
