//
//  AuthRemoteRepository.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

final class AuthRemoteRepository: AuthRemoteDataSource {
  private let networking: AuthNetworking

  init(networking: AuthNetworking) {
    self.networking = networking
  }

  func register(provider: AuthProvider) -> Single<AuthToken> {
    networking
      .request(.register(provider: provider))
      .map(AuthToken.self)
  }

  func login(provider: AuthProvider) -> Single<AuthToken> {
    networking
      .request(.login(provider: provider))
      .map(AuthToken.self)
  }

  func logout() {

  }
}
