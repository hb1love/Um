//
//  SignUpViewReactor.swift
//  AccountUI
//
//  Created by hb1love on 2020/03/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import AuthService
import UserService
import ReactorKit
import RxSwift

public final class SignUpViewReactor: Reactor {
  public enum Action {
    case kakaoLogin(AuthProvider)
  }

  public enum Event {
    case none
    case authorized
    case needSignUp(AuthProvider)
  }

  public enum Mutation {
    case setStep(Int)
  }

  public struct State {
    var email: String?

    var step = 0
    var event: Event = .none
  }

  public let initialState: State
  private let authUseCase: AuthUseCase
  private let userUseCase: UserUseCase
  private let authProvider: AuthProvider

  public init(
    authUseCase: AuthUseCase,
    userUseCase: UserUseCase,
    authProvider: AuthProvider
  ) {
    self.authUseCase = authUseCase
    self.userUseCase = userUseCase
    self.authProvider = authProvider
    self.initialState = State(email: authProvider.getEmail)
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    return .empty()
  }

  public func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case .setStep(let step):
      state.step = step
    }
    return state
  }
}
