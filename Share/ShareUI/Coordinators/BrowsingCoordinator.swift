//
//  BrowsingCoordinator.swift
//  ShareUI
//
//  Created by NHNEnt on 2020/02/08.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common

public protocol BrowsingCoordinatorOutput: AnyObject {
  var finishFlow: (() -> Void)? { get set }
}

public final class BrowsingCoordinator: BaseCoordinator, BrowsingCoordinatorOutput, RootCoordinator {

  private let coordinatorFactory: ShareCoordinatorFactoryProtocol
  private let moduleFactory: BrowsingModuleFactoryType
  private let router: Routable

  public var finishFlow: (() -> Void)?
  public var changeTabBar: ((Bool) -> Void)?
  public let rootViewController: UINavigationController

  init(
    coordinatorFactory: ShareCoordinatorFactoryProtocol,
    moduleFactory: BrowsingModuleFactoryType,
    router: Routable
    ) {
    self.coordinatorFactory = coordinatorFactory
    self.moduleFactory = moduleFactory
    self.router = router
    self.rootViewController = router.rootController
  }

  public override func start() {
    showList()
  }

  private func showList() {
    let browsingModule = moduleFactory.makeBrowsingModule()
//    browsingModule.changeTabBar = changeTabBar
    router.setRoot(browsingModule)
  }
}
