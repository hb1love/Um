//
//  ShareUIInjector.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareService

public protocol ShareUIConfiguration {
  static var shareUIDependency: ShareUIDependency { get }
}

public struct ShareUIDependency {
//  public let window: NSWindow
//  public let navigationController: UINavigationController
  public let shareUseCase: ShareUseCase

  public init(
//    window: NSWindow,
    shareUseCase: ShareUseCase
//    navigationController: UINavigationController,
  ) {
//    self.window = window
    self.shareUseCase = shareUseCase
//    self.navigationController = navigationController
  }
}

public class ShareUIInjector {
  public static func resolve(
    with config: ShareUIConfiguration.Type
  ) -> ShareCoordinatorFactoryProtocol {
    let shareUseCase = config.shareUIDependency.shareUseCase
    return ShareCoordinatorFactory(
      moduleFactory: ShareModuleFactory(
        shareUseCase: shareUseCase
      )
    )
  }
}
