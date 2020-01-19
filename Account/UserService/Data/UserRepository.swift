//
//  UserRepository.swift
//  UserService
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxSwift

public class UserRepository: UserRepositoryType {
  private let remote: UserDataSource

  public init(remote: UserDataSource) {
    self.remote = remote
  }

  public func me() -> Single<User> {
    remote.me()
  }
}
