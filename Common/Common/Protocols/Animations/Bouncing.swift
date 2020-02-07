//
//  Bouncing.swift
//  Common
//
//  Created by hb1love on 2020/02/04.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit

public protocol Bouncing {}
extension Bouncing where Self: UIView {
  public func bounce(_ isTouched: Bool, scaledBy scale: CGFloat = 0.96) {
    var transform = CGAffineTransform.identity
    if isTouched { transform = transform.scaledBy(x: scale, y: scale) }
    UIView.animate(
      withDuration: 0.3,
      delay: 0,
      usingSpringWithDamping: 0.8,
      initialSpringVelocity: 0,
      options: [],
      animations: {
        self.transform = transform
      }
    )
  }
}

