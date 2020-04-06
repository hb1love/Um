//
//  LoginViewReactor.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import AuthService
import UserService
import ReactorKit
import RxSwift

public final class LoginViewReactor: Reactor {
  public enum Action {
    case kakaoLogin(AuthProvider)
  }

  public enum Event {
    case none
    case authorized
    case needSignUp(AuthProvider)
  }

  public enum Mutation {
    case isAuthorized(Bool)
    case needSignUp(AuthProvider)
  }

  public struct State {
    var event: Event = .none
  }

  public let initialState: State
  private let authUseCase: AuthUseCase
  private let userUseCase: UserUseCase

  public init(authUseCase: AuthUseCase, userUseCase: UserUseCase) {
    self.initialState = State()
    self.authUseCase = authUseCase
    self.userUseCase = userUseCase
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .kakaoLogin(let provider):
      return authUseCase.login(provider: provider)
        .asObservable()
        .flatMap { [weak self] authToken -> Observable<Mutation> in
          guard let `self` = self else { return .empty() }
          return self.userUseCase.fetchMe().asObservable()
            .map { true }
            .map(Mutation.isAuthorized)
          }
        .catchError { _ in .just(.needSignUp(provider)) }
    }
  }

  public func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case .isAuthorized:
      state.event = .authorized
    case .needSignUp(let authProvider):
      state.event = .needSignUp(authProvider)
    }
    return state
  }
}
