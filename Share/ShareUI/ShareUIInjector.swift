//
//  ShareUIInjector.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareService
import UserService

public protocol ShareUIConfiguration {
  static var shareUIDependency: ShareUIDependency { get }
}

public struct ShareUIDependency {
//  public let window: NSWindow
//  public let navigationController: UINavigationController
  public let shareUseCase: ShareUseCase
  public let userUseCase: UserUseCase

  public init(
//    window: NSWindow,
    shareUseCase: ShareUseCase,
    userUseCase: UserUseCase
//    navigationController: UINavigationController,
  ) {
//    self.window = window
    self.shareUseCase = shareUseCase
    self.userUseCase = userUseCase
//    self.navigationController = navigationController
  }
}

public class ShareUIInjector {
  public static func resolve(
    with config: ShareUIConfiguration.Type
  ) -> (ShareCoordinatorFactoryProtocol, ShareEditModuleFactoryType) {
    let shareUseCase = config.shareUIDependency.shareUseCase
    let userUseCase = config.shareUIDependency.userUseCase
    let factory = ShareModuleFactory(shareUseCase: shareUseCase, userUseCase: userUseCase)
    return (
      coordinatorFactory: ShareCoordinatorFactory(moduleFactory: factory),
      moduleFactory: factory
    )
  }
}
