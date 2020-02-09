//
//  LoginCoordinator.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common

public protocol LoginCoordinatorOutput: AnyObject {
  var finishFlow: ((_ loggedIn: Bool) -> Void)? { get set }
}

public final class LoginCoordinator: BaseCoordinator, LoginCoordinatorOutput {

  private let coordinatorFactory: AccountCoordinatorFactoryProtocol
  private let moduleFactory: LoginModuleFactoryType
  private let router: Routable

  public var finishFlow: ((Bool) -> Void)?

  init(
    coordinatorFactory: AccountCoordinatorFactoryProtocol,
    moduleFactory: LoginModuleFactoryType,
    router: Routable
    ) {
    self.coordinatorFactory = coordinatorFactory
    self.moduleFactory = moduleFactory
    self.router = router
  }

  public override func start() {
    showLogin()
  }

  private func showLogin() {
    let loginModule = moduleFactory.makeLoginModule()
    loginModule.onFinish = { [weak self] loggedIn, isFirst in
      guard loggedIn else {
        self?.finishFlow?(loggedIn)
        return
      }
      if isFirst {
        self?.showRegister()
      }
      self?.finishFlow?(loggedIn)
    }
    router.setRoot(loginModule)
  }

  private func showRegister() {

  }
}
