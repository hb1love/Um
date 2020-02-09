//
//  UserRemoteDataSource.swift
//  UserService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

final class UserRemoteDataSource: UserDataSource {
  private let networking: UserNetworking

  init(networking: UserNetworking) {
    self.networking = networking
  }

  func me() -> Single<Member> {
    networking
      .request(.me)
      .map(Member.self)
  }
}
