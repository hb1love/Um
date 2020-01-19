//
//  AuthPlugin.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Moya

public struct AuthPlugin: PluginType {
  private let authUseCase: AuthUseCase

  public init(authUseCase: AuthUseCase) {
    self.authUseCase = authUseCase
  }

  public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    var request = request
    if let accessToken = self.authUseCase.currentAccessToken {
      request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    }
    return request
  }
}
