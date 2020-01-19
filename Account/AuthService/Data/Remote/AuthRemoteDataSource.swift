//
//  AuthRemoteDataSource.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

final class AuthRemoteDataSource: AuthDataSource {
  private let networking: AuthNetworking

  init(networking: AuthNetworking) {
    self.networking = networking
  }

  func authorize() -> Single<Void> {
    networking
      .request(.login)
      .map { _ in }
  }

  func logout() {

  }
}
