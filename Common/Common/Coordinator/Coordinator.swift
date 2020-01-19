//
//  Coordinator.swift
//  Common
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

public protocol Coordinator: AnyObject {
  var childCoordinators: [Coordinator] { get set }

  func start()
}

public extension Coordinator {

  func addDependency(_ coordinator: Coordinator) {
    guard childCoordinators.contains(where: { $0 === coordinator }) == false else { return }
    childCoordinators.append(coordinator)
  }

  func removeDependency(_ coordinator: Coordinator?) {
    if childCoordinators.isEmpty { return }
    guard let coordinator = coordinator else { return }

    // Clear child-coordinators recursively
    if let coordinator = coordinator as? BaseCoordinator,
      coordinator.childCoordinators.isEmpty == false {
      coordinator.childCoordinators
        .filter { $0 !== coordinator }
        .forEach { coordinator.removeDependency($0) }
    }
    for (index, element) in childCoordinators.enumerated() where element === coordinator {
      childCoordinators.remove(at: index)
      break
    }
  }
}
