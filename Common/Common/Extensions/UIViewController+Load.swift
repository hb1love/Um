//
//  UIViewController+Load.swift
//  SeasonsBase
//
//  Created by hb1love on 2019/11/24.
//  Copyright © 2019 seasons. All rights reserved.
//

import UIKit

public extension UIViewController {
  private class func instantiateControllerInStoryboard<T: UIViewController>(
    _ storyboard: UIStoryboard,
    identifier: String
  ) -> T {
    return storyboard.instantiateViewController(withIdentifier: identifier) as! T
  }

  class func controllerInStoryboard(
    _ storyboard: UIStoryboard,
    identifier: String
  ) -> Self {
    return instantiateControllerInStoryboard(storyboard, identifier: identifier)
  }
  
  class func controllerFromStoryboard(_ identifier: String, bundleIdentifier: String? = nil) -> Self {
    var bundle: Bundle?
    if let identifier = bundleIdentifier {
      bundle = Bundle(identifier: identifier)
    }
    return controllerInStoryboard(UIStoryboard(name: identifier, bundle: bundle), identifier: nameOfClass)
  }
}

extension NSObject {
  class var nameOfClass: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
}
