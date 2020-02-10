//
//  Assets+Extension.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/11.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit

extension UIColor {
  static func color(named: String) -> UIColor? {
    UIColor(
      named: named,
      in: Bundle(identifier: "com.depromeet.accountui"),
      compatibleWith: .current
    )
  }
}

extension UIImage {
  static func image(named: String) -> UIImage? {
    UIImage(
      named: named,
      in: Bundle(identifier: "com.depromeet.accountui"),
      compatibleWith: .current
    )
  }
}
