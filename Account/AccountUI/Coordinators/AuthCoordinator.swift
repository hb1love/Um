//
//  LoginCoordinator.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common

public protocol AuthCoordinatorOutput: AnyObject {
  var finishFlow: ((_ loggedIn: Bool) -> Void)? { get set }
}

public final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {

  private let coordinatorFactory: AccountCoordinatorFactoryType
  private let moduleFactory: AuthModuleFactoryType
  private let router: Routable

  public var finishFlow: ((Bool) -> Void)?

  init(
    coordinatorFactory: AccountCoordinatorFactoryType,
    moduleFactory: AuthModuleFactoryType,
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
    loginModule.onFinish = { [weak self] loggedIn in
      self?.finishFlow?(loggedIn)
    }
    loginModule.showSignUp = { [weak self] authProvider in
      self?.showSignUp(authProvider: authProvider)
    }
    router.setRoot(loginModule)
  }

  private func showSignUp(authProvider: AuthProvider) {
    let signUpModule = moduleFactory.makeSignUpModule(authProvider: authProvider)
    signUpModule.onCompleteSignUp = { [weak self] in
      self?.finishFlow?(true)
    }
    router.setRoot(signUpModule)
  }
}
