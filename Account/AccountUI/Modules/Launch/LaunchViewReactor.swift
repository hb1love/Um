//
//  LaunchViewReactor.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import AuthService
import UserService
import ReactorKit
import RxSwift

public final class LaunchViewReactor: Reactor {
  public enum Action {
    case checkLaunchingInfo
  }

  public enum Mutation {
    case isAuthorized(Bool)
    case setEndLaunching(Bool)
  }

  public struct State {
    var isAuthorized = false
    var endLaunching = false
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
    case .checkLaunchingInfo:
//      let isAuthorized = self.userUseCase.fetchMe()
//        .asObservable()
//        .map { true }
//        .catchErrorJustReturn(false)
//        .map(Mutation.isAuthorized)

      let scheduler = SerialDispatchQueueScheduler(qos: .default)
      let isAuthorized = Observable<Void>.just(())
        .delay(2, scheduler: scheduler)
        .map { true }
        .catchErrorJustReturn(false)
        .map(Mutation.isAuthorized)
      let endLaunching: Observable<Mutation> = .just(.setEndLaunching(true))
      return .concat([isAuthorized, endLaunching])
    }
  }

  public func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case .isAuthorized(let isAuthorized):
      state.isAuthorized = isAuthorized
    case .setEndLaunching(let end):
      state.endLaunching = end
    }
    return state
  }
}
