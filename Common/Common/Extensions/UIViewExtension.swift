//
//  UIViewExtension.swift
//  SeasonsBase
//
//  Created by hb1love on 2019/11/24.
//  Copyright © 2019 seasons. All rights reserved.
//

import UIKit

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

// MARK: - Core Animation Example

public extension UIView {
  func addRectangle() {
    let shape = CAShapeLayer()
    shape.strokeColor = UIColor.white.cgColor
    shape.fillColor = UIColor.blue.cgColor

    let path = CGMutablePath()
    path.addRoundedRect(in: bounds, cornerWidth: 20, cornerHeight: 20)
    shape.path = path

    path.addEllipse(in: bounds)
    shape.path = path

    path.addRect(bounds, transform: .init(scaleX: 0.5, y: 0.5))
    shape.path = path

    layer.addSublayer(shape)
  }

  func addDocument() {
    let document = CAShapeLayer()
    document.strokeColor = UIColor.white.cgColor

    // filled document
//    document.strokeColor = UIColor.blue.cgColor
//    document.fillColor = UIColor.blue.cgColor

    let size = CGSize(width: 100, height: 120)
    let foldInset: CGFloat = 30

    let path = CGMutablePath()

    path.move(to: .zero)
    path.addLine(to: CGPoint(x: 0, y: size.height))
    path.addLine(to: CGPoint(x: size.width, y: size.height))
    path.addLine(to: CGPoint(x: size.width, y: foldInset))
    path.addLine(to: CGPoint(x: size.width - foldInset, y: 0))
    path.addLine(to: .zero)

    path.move(to: CGPoint(x: size.width - foldInset, y: 0))
    path.addLine(to: CGPoint(x: size.width - foldInset, y: foldInset))
    path.addLine(to: CGPoint(x: size.width, y: foldInset))

    document.path = path

    layer.addSublayer(document)
  }

  func addIndicator() {
    let replicator = CAReplicatorLayer()

    replicator.instanceCount = 3

    let square = CALayer()
    square.frame = CGRect(x: (bounds.width + 30) / 2 - 80, y: (bounds.height + 30) / 2, width: 30, height: 30)

    square.backgroundColor = UIColor.blue.cgColor

    replicator.addSublayer(square)

    replicator.instanceTransform = CATransform3DMakeTranslation(50, 0, 0)

    replicator.instanceBlueOffset = -0.3

    layer.addSublayer(replicator)
  }

  func addIndicator2() {
    let shape = CAShapeLayer()

    shape.frame.size = CGSize(width: 10, height: 50)
    shape.anchorPoint = CGPoint(x: 0.5, y: 1)

    shape.path = CGPath(ellipseIn: shape.frame, transform: nil)
    shape.fillColor = UIColor.blue.cgColor

    let replicator = CAReplicatorLayer()

    replicator.instanceCount = 20

    let fullCircle = CGFloat.pi * 2
    let angle = fullCircle / CGFloat(replicator.instanceCount)

    replicator.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
    replicator.bounds.size = CGSize(width: shape.frame.height * .pi, height: shape.frame.height)

    replicator.addSublayer(shape)

    layer.addSublayer(replicator)
  }

  func addMask() {
    let mask = CALayer()

    let image = UIImage(named: "swifticon")!
    mask.contents = image.cgImage
    mask.frame.size = image.size

    let gradient = CAGradientLayer()
    gradient.frame.size = image.size

    gradient.colors = [
      UIColor(red: 0.04, green: 0.13, blue: 0.54, alpha: 1).cgColor,
      UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor,
      UIColor(red: 0.85, green: 0.25, blue: 0.25, alpha: 1).cgColor
    ]

    gradient.mask = mask

    layer.addSublayer(gradient)
  }
}
