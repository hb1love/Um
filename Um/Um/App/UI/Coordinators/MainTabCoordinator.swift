//
//  MainTabCoordinator.swift
//  Um
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareUI

public protocol MainTabCoordinatorInput: AnyObject {
  var isAuthorized: Bool? { get set }
}

public protocol MainTabCoordinatorOutput: AnyObject {
  var finishFlow: (() -> Void)? { get set }
}

final class MainTabCoordinator: BaseCoordinator, MainTabCoordinatorInput, MainTabCoordinatorOutput {

  private let mainModuleFactory: MainModuleFactoryType
  private let shareModuleFactory: ShareEditModuleFactoryType
  private let router: Routable

  public var isAuthorized: Bool?
  public var finishFlow: (() -> Void)?

  init(
    mainModuleFactory: MainModuleFactoryType,
    shareModuleFactory: ShareEditModuleFactoryType,
    router: Routable
    ) {
    self.mainModuleFactory = mainModuleFactory
    self.shareModuleFactory = shareModuleFactory
    self.router = router
  }

  override func start() {
    showMainTab()
  }

  private func showMainTab() {
    let mainTabModule = mainModuleFactory.makeMainTabModule(isAuthorized: isAuthorized ?? false)
    mainTabModule.onNewPost = { [weak self] in
      self?.showEdit()
    }
    
    router.setRoot(mainTabModule)
  }

  private func showEdit() {
    let signUpModule = shareModuleFactory.makeShareEditModule()
//    signUpModule.onCompleteSignUp = { [weak self] in
//      self?.router.dismiss()
//      self?.finishFlow?()
//    }
//    signUpModule.onCancel = { [weak self] in
//      self?.router.dismiss()
//    }
    router.present(signUpModule)
  }
}
