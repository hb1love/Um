//
//  Presentable.swift
//  Common
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit

public protocol Presentable {
  func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
  public func toPresent() -> UIViewController? {
    return self
  }
}
