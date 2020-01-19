//
//  AuthRepository.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxSwift

public class AuthRepository: Auth {
  private let remote: AuthDataSource

  public init(remote: AuthDataSource) {
    self.remote = remote
  }

  public func authorize() -> Single<Void> {
    remote.authorize()
  }

  public func logout() {
    remote.logout()
  }
}
