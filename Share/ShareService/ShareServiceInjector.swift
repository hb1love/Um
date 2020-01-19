//
//  ShareServiceInjector.swift
//  ShareService
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import AuthService

public protocol ShareServiceConfiguration {
  static var baseUrl: String { get }
  static var shareServiceDependency: ShareServiceDependency { get }
}

public struct ShareServiceDependency {
  let authPlugin: AuthPlugin

  public init(authPlugin: AuthPlugin) {
    self.authPlugin = authPlugin
  }
}

public final class ShareServiceInjector {
  public static func resolve(
    with config: ShareServiceConfiguration.Type
  ) -> ShareUseCase {
    ShareServiceConfig.shared = ShareServiceConfig(config)
    return ShareService(
      share: ShareRepository(
        remote: ShareRemoteDataSource(
          networking: ShareNetworking(
            plugins: [config.shareServiceDependency.authPlugin]
          )
        )
      )
    )
  }
}

var shareServiceConfig: ShareServiceConfig {
  if let config = ShareServiceConfig.shared {
    return config
  } else {
    fatalError("Please set the Config for \(Bundle(for: ShareServiceConfig.self))")
  }
}

final class ShareServiceConfig {
  static var shared: ShareServiceConfig?

  let baseUrl: String

  init(_ config: ShareServiceConfiguration.Type) {
    self.baseUrl = config.baseUrl
  }
}
