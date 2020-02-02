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
import RxGesture

protocol LoginTabBarDelegate: AnyObject {
  func didTap()
}

final class LoginTabBar: BaseView {

  // MARK: - Constants

  private struct Metric {
    static let height = 56.f
    static let sidePadding = 20.f
  }

  // MARK: - Subviews

  var loginButton: UIButton!

  // MARK: - Properties

  weak var delegate: LoginTabBarDelegate?

  override func setupSubviews() {
    self.backgroundColor = .orange
    loginButton = UIButton().also {
      $0.setTitle("로그인하고 재능교환하기", for: .normal)
      $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
      $0.titleLabel?.font = .defaultFont(ofSize: 14, weight: .medium)
      $0.clipsToBounds = true
      $0.backgroundColor = .clear
      addSubview($0)
      $0.rx.tap.asDriver()
        .drive(onNext: { [weak self] in
          self?.delegate?.didTap()
        }).disposed(by: disposeBag)
    }
  }

  override func setupConstraints() {
    loginButton.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalToSuperview().offset(Metric.sidePadding)
      $0.trailing.equalToSuperview().offset(-Metric.sidePadding)
      $0.height.equalTo(Metric.height)
    }
  }
}
