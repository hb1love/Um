//
//  ShareEditCoordinator.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common

public protocol ShareEditCoordinatorOutput: AnyObject {
  var finishFlow: (() -> Void)? { get set }
}

final class ShareEditCoordinator: BaseCoordinator, ShareEditCoordinatorOutput, RootCoordinator {

  private let moduleFactory: ShareEditModuleFactoryType
  private let router: Routable
  
  public var finishFlow: (() -> Void)?
  public var changeTabBar: ((Bool) -> Void)?
  public let rootViewController: UINavigationController

  init(
    with factory: ShareEditModuleFactoryType,
    router: Routable
    ) {
    self.moduleFactory = factory
    self.router = router
    self.rootViewController = router.rootController
  }

  override func start() {
    showShareEdit()
  }

  private func showShareEdit() {
    let editModule = moduleFactory.makeShareEditModule()
//    editModule.onFinish = { [weak self] in
//      self?.finishFlow?()
//    }
    router.setRoot(editModule)
  }
}
