//
//  Routable.swift
//  Common
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit

public protocol Routable: Presentable {
  var rootController: UINavigationController { get }

  func present(_ module: Presentable?, animated: Bool)

  func dismiss(animated: Bool, completion: (() -> Void)?)

  func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)

  func pop(animated: Bool)

  func setRoot(_ module: Presentable?)

  func popToRoot(animated: Bool)
}

public extension Routable {

  func present(
    _ module: Presentable?,
    animated: Bool = true
    ) {
    return present(module, animated: animated)
  }

  func dismiss(
    animated: Bool = true,
    completion: (() -> Void)? = nil
    ) {
    return dismiss(animated: animated, completion: completion)
  }

  func push(
    _ module: Presentable?,
    animated: Bool = true,
    completion: (() -> Void)? = nil
    ) {
    return push(module, animated: animated, completion: completion)
  }

  func pop(animated: Bool = true) {
    return pop(animated: animated)
  }

  func popToRoot(animated: Bool = true) {
    return popToRoot(animated: animated)
  }
}
