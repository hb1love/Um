//
//  UIButtonExtension.swift
//  SeasonsBase
//
//  Created by hb1love on 2020/01/06.
//  Copyright © 2020 seasons. All rights reserved.
//

import UIKit

public extension UIButton {
  func alignTextUnderImage(spacing: CGFloat = 6.0) {
    guard let image = imageView?.image else { return }
    let imageSize: CGSize = image.size
    self.titleEdgeInsets = UIEdgeInsets(
      top: spacing,
      left: -imageSize.width,
      bottom: -(imageSize.height),
      right: 0.0
    )

    let labelString = NSString(string: titleLabel?.text ?? "")
    let titleSize = labelString.size(
      withAttributes: [NSAttributedString.Key.font: titleLabel?.font as Any]
    )
    self.imageEdgeInsets = UIEdgeInsets(
      top: -(titleSize.height + spacing),
      left: 0.0,
      bottom: 0.0,
      right: -titleSize.width
    )
  }
}
