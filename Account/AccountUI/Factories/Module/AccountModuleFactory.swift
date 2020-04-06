//
//  AccountModuleFactory.swift
//  AccountUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import AuthService
import UserService

public final class AccountModuleFactory
  : LaunchModuleFactoryType
  , AuthModuleFactoryType
  , MyPageModuleFactoryType {

  private let authUseCase: AuthUseCase
  private let userUseCase: UserUseCase

  public init(authUseCase: AuthUseCase, userUseCase: UserUseCase) {
    self.authUseCase = authUseCase
    self.userUseCase = userUseCase
  }

  public func makeLaunchModule() -> LaunchViewController {
    let launchViewReactor = LaunchViewReactor(
      authUseCase: authUseCase,
      userUseCase: userUseCase
    )
    let launchViewController = LaunchViewController.controllerFromStoryboard(
      "Launch",
      bundleIdentifier: "com.depromeet.um.accountui"
    )
    launchViewController.reactor = launchViewReactor
    return launchViewController
  }

  public func makeLoginModule() -> LoginViewController {
    let loginViewReactor = LoginViewReactor(
      authUseCase: authUseCase,
      userUseCase: userUseCase
    )
    let loginViewController = LoginViewController.controllerFromStoryboard(
      "Login",
      bundleIdentifier: "com.depromeet.um.accountui"
    )
    loginViewController.reactor = loginViewReactor
    return loginViewController
  }

  public func makeSignUpModule(authProvider: AuthProvider) -> SignUpViewController {
    let signUpViewReactor = SignUpViewReactor(
      authUseCase: authUseCase,
      userUseCase: userUseCase,
      authProvider: authProvider
    )

    let signUpViewController = SignUpViewController.controllerFromStoryboard(
      "SignUp",
      bundleIdentifier: "com.depromeet.um.accountui"
    )
    signUpViewController.reactor = signUpViewReactor
    return signUpViewController
  }

  public func makeMyPageModule() -> MyPageViewController {
    let myPageViewReactor = MyPageViewReactor(
      authUseCase: authUseCase,
      userUseCase: userUseCase
    )
    let myPageViewController = MyPageViewController.controllerFromStoryboard(
      "MyPage",
      bundleIdentifier: "com.depromeet.um.accountui"
    )
    myPageViewController.reactor = myPageViewReactor
    return myPageViewController
  }
}
