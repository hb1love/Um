//
//  AuthProvider.swift
//  Common
//
//  Created by hb1love on 2020/02/29.
//  Copyright © 2020 depromeet. All rights reserved.
//

public enum AuthProvider: RawRepresentable {
  public typealias AuthParam = (id: String, accessToken: String, email: String?)

  case apple(AuthParam)
  case kakao(AuthParam)

  public init?(rawValue: String) {
    preconditionFailure()
  }

  public var rawValue: String {
    switch self {
    case .apple:
      return "apple"
    case .kakao:
      return "kakao"
    }
  }

  public var getEmail: String? {
    switch self {
    case .apple(let param),
         .kakao(let param):
      return param.email
    }
  }
}
