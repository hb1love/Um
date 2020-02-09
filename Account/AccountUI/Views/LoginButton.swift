//
//  LoginButton.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/05.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import SnapKit
import AuthenticationServices

final class LoginButton: UIButton, Bouncing {

  override func layoutSubviews() {
    super.layoutSubviews()
    self.cornerRadius = 12
  }

  func configure(image: UIImage?, title: String, color: UIColor) {
    setImage(image, for: .normal)
    setTitle(title, for: .normal)
    backgroundColor = color
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    bounce(true)
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    bounce(false)
  }

  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    bounce(false)
  }
}

class AppleLogin: ASAuthorizationAppleIDButton, Bouncing {

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    bounce(true)
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    bounce(false)
  }

  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    bounce(false)
  }
}
