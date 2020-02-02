//
//  LoginViewReactor.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import AuthService
import UserService
import ReactorKit

public final class LoginViewReactor: Reactor {
  public enum Action {

  }

  public struct State {

  }

  public let initialState: State
  private let authUseCase: AuthUseCase
  private let userUseCase: UserUseCase

  public init(authUseCase: AuthUseCase, userUseCase: UserUseCase) {
    self.initialState = State()
    self.authUseCase = authUseCase
    self.userUseCase = userUseCase
  }
}
