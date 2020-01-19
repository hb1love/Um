//
//  Router.swift
//  Common
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit

public final class Router: NSObject, Routable {

  private(set) public var rootController: UINavigationController
  private var completions: [UIViewController: () -> Void]

  public init(rootController: UINavigationController) {
    self.rootController = rootController
    completions = [:]
  }

  public func toPresent() -> UIViewController? {
    return rootController
  }

  public func present(_ module: Presentable?, animated: Bool) {
    guard let controller = module?.toPresent() else { return }
    rootController.present(controller, animated: animated, completion: nil)
  }

  public func dismiss(animated: Bool, completion: (() -> Void)?) {
    rootController.dismiss(animated: animated, completion: completion)
  }

  public func push(
    _ module: Presentable?,
    animated: Bool,
    completion: (() -> Void)?
    ) {
    guard
      let controller = module?.toPresent(),
      (controller is UINavigationController == false)
      else {
        assertionFailure("Deprecated push UINavigationController.")
        return
    }

    if let completion = completion {
      completions[controller] = completion
    }
    rootController.pushViewController(controller, animated: animated)
  }

  public func pop(animated: Bool) {
    if let controller = rootController.popViewController(animated: animated) {
      runCompletion(for: controller)
    }
  }

  public func setRoot(_ module: Presentable?) {
    guard let controller = module?.toPresent() else { return }
    rootController.setViewControllers([controller], animated: false)
  }

  public func popToRoot(animated: Bool) {
    if let controllers = rootController.popToRootViewController(animated: animated) {
      controllers.forEach { controller in
        runCompletion(for: controller)
      }
    }
  }
}

extension Router {

  private func runCompletion(for controller: UIViewController) {
    guard let completion = completions[controller] else { return }
    completion()
    completions.removeValue(forKey: controller)
  }
}
