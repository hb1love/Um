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
  : MyPageModuleFactoryType {

  private let authUseCase: AuthUseCase
  private let userUseCase: UserUseCase

  public init(authUseCase: AuthUseCase, userUseCase: UserUseCase) {
    self.authUseCase = authUseCase
    self.userUseCase = userUseCase
  }

  public func makeMyPageModule() -> MyPageViewController {
    let myPageViewReactor = MyPageViewReactor(
      authUseCase: authUseCase,
      userUseCase: userUseCase
    )
    let myPageViewController = MyPageViewController()
    myPageViewController.reactor = myPageViewReactor
    return myPageViewController
  }
}
