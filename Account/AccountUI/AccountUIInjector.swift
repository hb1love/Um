//
//  AccountUIInjector.swift
//  AccountUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import AuthService
import UserService

public protocol AccountUIConfiguration {
  static var accountUIDependency: AccountUIDependency { get }
}

public struct AccountUIDependency {
  public let authUseCase: AuthUseCase
  public let userUseCase: UserUseCase

  public init(
    authUseCase: AuthUseCase,
    userUseCase: UserUseCase
  ) {
    self.authUseCase = authUseCase
    self.userUseCase = userUseCase
  }
}

public class AccountUIInjector {
  public static func resolve(
    with config: AccountUIConfiguration.Type
  ) -> AccountCoordinatorFactoryProtocol {
    let authUseCase = config.accountUIDependency.authUseCase
    let userUseCase = config.accountUIDependency.userUseCase
    return AccountCoordinatorFactory(
      moduleFactory: AccountModuleFactory(
        authUseCase: authUseCase,
        userUseCase: userUseCase
      )
    )
  }
}
