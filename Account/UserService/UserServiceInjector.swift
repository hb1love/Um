//
//  UserServiceInjector.swift
//  UserService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import AuthService

public protocol UserServiceConfiguration {
  static var baseUrl: String { get }
  static var userServiceDependency: UserServiceDependency { get }
}

public struct UserServiceDependency {
  let authPlugin: AuthPlugin

  public init(authPlugin: AuthPlugin) {
    self.authPlugin = authPlugin
  }
}

public final class UserServiceInjector {
  public static func resolve(
    with config: UserServiceConfiguration.Type
  ) -> UserUseCase {
    UserServiceConfig.shared = UserServiceConfig(config)
    return UserService(
      userRepository: UserRepository(
        remote: UserRemoteDataSource(
          networking: UserNetworking(
            plugins: [config.userServiceDependency.authPlugin]
          )
        )
      )
    )
  }
}

var userServiceConfig: UserServiceConfig {
  if let config = UserServiceConfig.shared {
    return config
  } else {
    fatalError("Please set the Config for \(Bundle(for: UserServiceConfig.self))")
  }
}

final class UserServiceConfig {
  static var shared: UserServiceConfig?

  let baseUrl: String

  init(_ config: UserServiceConfiguration.Type) {
    self.baseUrl = config.baseUrl
  }
}
