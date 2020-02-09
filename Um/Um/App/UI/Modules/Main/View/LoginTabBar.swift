//
//  LoginTabBar.swift
//  Um
//
//  Created by hb1love on 2020/02/03.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import SnapKit
import RxCocoa
import RxGesture
import RxSwift

protocol LoginTabBarDelegate: AnyObject {
  func didTap()
}

final class LoginTabBar: BaseView, Bouncing {

  // MARK: - Constants

  private struct Metric {
    static let height = 56.f
    static let sidePadding = 60.f
  }

  // MARK: - Subviews

  var loginLabel: UILabel!

  // MARK: - Properties

  var isTouched: Bool = false {
    didSet {
      var transform = CGAffineTransform.identity
      if isTouched { transform = transform.scaledBy(x: 0.96, y: 0.96) }
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

  weak var delegate: LoginTabBarDelegate?

  override func setupSubviews() {
    self.backgroundColor = .orange
    loginLabel = UILabel().also {
      $0.text = "로그인하고 재능교환하기"
      $0.font = .defaultFont(ofSize: 14, weight: .medium)
      $0.backgroundColor = .clear
      $0.textColor = .white
      addSubview($0)
    }

    self.rx.tapGesture()
      .when(.recognized)
      .debounce(0.5, scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] _ in
        self?.delegate?.didTap()
      }).disposed(by: disposeBag)
  }

  override func setupConstraints() {
    loginLabel.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalToSuperview().offset(Metric.sidePadding)
      $0.trailing.equalToSuperview().offset(-Metric.sidePadding)
      $0.height.equalTo(Metric.height)
    }
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
