//
//  ShareEditCoordinator.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common

public protocol ShareEditCoordinatorOutput: AnyObject {
  var finishFlow: (() -> Void)? { get set }
}

final class ShareEditCoordinator: BaseCoordinator, ShareEditCoordinatorOutput {

  var finishFlow: (() -> Void)?
  private let moduleFactory: ShareEditModuleFactoryType
  private let router: Routable

  init(
    with factory: ShareEditModuleFactoryType,
    router: Routable
    ) {
    self.moduleFactory = factory
    self.router = router
  }

  override func start() {
    showShareEdit()
  }

  private func showShareEdit() {
    let editModule = moduleFactory.makeShareEditModule()
//    editModule.onFinish = {
//
//    }
    router.setRoot(editModule)
  }
}
