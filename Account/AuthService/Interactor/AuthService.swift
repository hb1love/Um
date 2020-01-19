//
//  AuthService.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxSwift

public protocol AuthUseCase {
  var currentAccessToken: String? { get }

  func authorize() -> Single<Void>
  func logout()
}

public final class AuthService: AuthUseCase {

  private(set) public var currentAccessToken: String?

  private let auth: Auth

  public init(auth: Auth) {
    self.auth = auth
  }

  public func authorize() -> Single<Void> {
    .just(())
  }

  public func logout() {
    
  }
}
