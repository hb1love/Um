//
//  Pulsing.swift
//  SeasonsBase
//
//  Created by hb1love on 2019/12/08.
//  Copyright © 2019 seasons. All rights reserved.
//

import UIKit

protocol Pulsing {}
extension Pulsing where Self: UIView {
  func pulse(
    from: UIView,
    radius: CGFloat,
    numberOfPulses: Int = 1,
    duration: CGFloat = 0.8,
    color: UIColor = .red
  ) {
    let pulsingLayer = PulsingLayer(
      numberOfPulses: Float(numberOfPulses),
      radius: radius,
      position: center
    )
    pulsingLayer.animationDuration = TimeInterval(duration)
    pulsingLayer.backgroundColor = color.cgColor

    superview?.layer.insertSublayer(pulsingLayer, below: layer)
  }
}

final class PulsingLayer: CALayer {

  var initialPulseScale: Float = 0
  var nextPulseAfter: TimeInterval = 0
  var animationDuration: TimeInterval = 1.5
  var radius: CGFloat = 200
  var numberOfPulses: Float = .infinity

  override init(layer: Any) {
    super.init(layer: layer)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  init(numberOfPulses: Float = .infinity, radius: CGFloat, position: CGPoint) {
    super.init()

    self.backgroundColor = UIColor.black.cgColor
    self.contentsScale = UIScreen.main.scale
    self.opacity = 0
    self.numberOfPulses = numberOfPulses
    self.radius = radius
    self.position = position

    self.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
    self.cornerRadius = radius

    DispatchQueue.global(qos: .default).async {
      let animationGroup = self.setupAnimationGroup()

      DispatchQueue.main.async {
        self.add(animationGroup, forKey: "pulse")
      }
    }
  }

  func createScaleAnimation() -> CABasicAnimation {
    let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
    scaleAnimation.fromValue = initialPulseScale
    scaleAnimation.toValue = 1
    scaleAnimation.duration = animationDuration
    return scaleAnimation
  }

  func createOpacityAnimation() -> CAKeyframeAnimation {
    let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
    opacityAnimation.duration = animationDuration
    opacityAnimation.values = [0.4, 0.8, 0]
    opacityAnimation.keyTimes = [0, 0.2, 1]
    return opacityAnimation
  }

  func setupAnimationGroup() -> CAAnimationGroup {
    let animationGroup = CAAnimationGroup()
    animationGroup.duration = animationDuration
    animationGroup.repeatCount = numberOfPulses

    let defaultCurve = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
    animationGroup.timingFunction = defaultCurve

    animationGroup.animations = [createScaleAnimation(), createOpacityAnimation()]

    return animationGroup
  }
}
