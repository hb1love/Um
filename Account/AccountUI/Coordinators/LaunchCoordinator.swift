//
//  LaunchCoordinator.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common

public protocol LaunchCoordinatorOutput: AnyObject {
  var finishFlow: ((_ isAuthorized: Bool) -> Void)? { get set }
}

public final class LaunchCoordinator: BaseCoordinator, LaunchCoordinatorOutput {

  private let coordinatorFactory: AccountCoordinatorFactoryProtocol
  private let moduleFactory: LaunchModuleFactoryType
  private let router: Routable

  public var finishFlow: ((Bool) -> Void)?

  init(
    coordinatorFactory: AccountCoordinatorFactoryProtocol,
    moduleFactory: LaunchModuleFactoryType,
    router: Routable
    ) {
    self.coordinatorFactory = coordinatorFactory
    self.moduleFactory = moduleFactory
    self.router = router
  }

  public override func start() {
    showLaunch()
  }

  private func showLaunch() {
    let launchModule = moduleFactory.makeLaunchModule()
    launchModule.onFinish = { [weak self] isAuthorized in
      self?.finishFlow?(isAuthorized)
    }
    router.setRoot(launchModule)
  }
}
