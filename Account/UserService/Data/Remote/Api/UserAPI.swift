//
//  UserAPI.swift
//  UserService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Foundation
import Common
import Moya

typealias UserNetworking = Networking<UserAPI>

enum UserAPI {
  case me
}

extension UserAPI: TargetType {
  var baseURL: URL {
    return URL(string: userServiceConfig.baseUrl)!
  }

  var path: String {
    switch self {
    case .me:
      return "me"
    }
  }

  var method: Moya.Method {
    switch self {
    default:
      return .get
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
