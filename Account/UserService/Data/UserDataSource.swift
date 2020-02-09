//
//  UserDataSource.swift
//  UserService
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

public protocol UserDataSource {
  func me() -> Single<Member>
}
