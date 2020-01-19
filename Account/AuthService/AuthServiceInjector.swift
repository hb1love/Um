//
//  AuthServiceInjector.swift
//  AuthService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

public protocol AuthServiceConfiguration {
  static var baseUrl: String { get }
  static var authServiceDependency: AuthServiceDependency { get }
}

public struct AuthServiceDependency {

  public init() {

  }
}

public final class AuthServiceInjector {
  public static func resolve(
    with config: AuthServiceConfiguration.Type
  ) -> AuthUseCase {
    AuthServiceConfig.shared = AuthServiceConfig(config)
    return AuthService(
      auth: AuthRepository(
        remote: AuthRemoteDataSource(
          networking: AuthNetworking()
        )
      )
    )
  }
}

var authServiceConfig: AuthServiceConfig {
  if let config = AuthServiceConfig.shared {
    return config
  } else {
    fatalError("Please set the Config for \(Bundle(for: AuthServiceConfig.self))")
  }
}

final class AuthServiceConfig {
  static var shared: AuthServiceConfig?

  let baseUrl: String

  init(_ config: AuthServiceConfiguration.Type) {
    self.baseUrl = config.baseUrl
  }
}
