//
//  UIView+Extension.swift
//  SeasonsBase
//
//  Created by hb1love on 2019/11/24.
//  Copyright © 2019 seasons. All rights reserved.
//

import UIKit

public extension UIView {
  func loadNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nibName = type(of: self).description().components(separatedBy: ".").last!
    let nib = UINib(nibName: nibName, bundle: bundle)
    return nib.instantiate(withOwner: self, options: nil).first as! UIView
  }
}

public extension UIView {
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
    }
  }

  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }

  @IBInspectable var borderColor: UIColor? {
    get {
      return UIColor(cgColor: layer.borderColor!)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }
}

public extension UIView {
  func shadow(
    color: UIColor? = .black,
    opacity: Float = 0.5,
    offSet: CGSize = .zero,
    radius: CGFloat = 1,
    cornerRadius: CGFloat = 1,
    scale: Bool = true
  ) {
    layer.masksToBounds = false
    layer.shadowColor = color?.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius
    layer.cornerRadius = cornerRadius

    layer.shadowPath = UIBezierPath(
      roundedRect: bounds,
      cornerRadius: cornerRadius
    ).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
