//
//  AuthAPI.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Foundation
import Common
import Moya

typealias AuthNetworking = Networking<AuthAPI>

enum AuthAPI {
  case login
  case logout
}

extension AuthAPI: TargetType {
  var baseURL: URL {
    return URL(string: "")!
  }

  var path: String {
    switch self {
    case .login: return "login"
    case .logout: return "logout"
    }
  }
  
  var method: Moya.Method {
    switch self {
    default:
      return .post
    }
  }

  var task: Task {
    switch self {
    default:
      return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }
  
  var sampleData: Data {
    switch self {
    default:
      return Data()
    }
  }
}
