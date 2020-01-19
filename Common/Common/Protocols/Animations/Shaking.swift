//
//  Shaking.swift
//  SeasonsBase
//
//  Created by hb1love on 2019/12/08.
//  Copyright © 2019 seasons. All rights reserved.
//

import UIKit

protocol Shaking {}
extension Shaking where Self: UIView {
  func shake() {
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.03
    animation.repeatCount = 3
    animation.autoreverses = true
    animation.fromValue = CGPoint(x: center.x - 4, y: center.y)
    animation.toValue = CGPoint(x: center.x + 4, y: center.y)

    layer.add(animation, forKey: "position")
  }
}
