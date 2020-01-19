//
//  UserRepositoryType.swift
//  UserService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxSwift

public protocol UserRepositoryType {
  func me() -> Single<User>
}
