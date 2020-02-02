//
//  RootCoordinator.swift
//  Common
//
//  Created by hb1love on 2020/01/14.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit

public protocol RootExportable {
  var rootViewController: UINavigationController { get }
}

public protocol TabController {
  var changeTabBar: ((Bool) -> Void)? { get set }
}

public protocol RootCoordinator: Coordinator, RootExportable, TabController {}
