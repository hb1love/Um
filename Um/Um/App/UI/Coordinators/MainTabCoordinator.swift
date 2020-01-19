//
//  MainTabCoordinator.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

public protocol MainTabCoordinatorOutput: AnyObject {
  var finishFlow: (() -> Void)? { get set }
}

final class MainTabCoordinator: BaseCoordinator, MainTabCoordinatorOutput {

  var finishFlow: (() -> Void)?
  private let moduleFactory: MainModuleFactoryType
  private let router: Routable

//  var serviceMap: [String: RootCoordinator] = [:]

  init(
    with factory: MainModuleFactoryType,
    router: Routable
    ) {
    self.moduleFactory = factory
    self.router = router
  }

  override func start() {
    showMainTab()
  }

  private func showMainTab() {
    let mainTabModule = moduleFactory.makeMainTabModule()
//    mainTabModule.onFinish = {
//
//    }
    router.setRoot(mainTabModule)
  }
}
