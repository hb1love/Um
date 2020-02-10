//
//  MyPageHeaderView.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/10.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import SnapKit

final class MyPageHeaderView: BaseCollectionReusableView {

  // MARK: - Constants

  private struct Metric {
    static let leading = 20.f
    static let topBottom = 10.f
    static let titleHeight = 20.f
  }

  // MARK: - Subviews

  var containerStackView: UIStackView!
  var titleLabel: UILabel!
  var secondaryLabel: UILabel!
  var indicatorView: UIImageView!

  override func setupSubviews() {
    containerStackView = UIStackView().also {
      $0.axis = .horizontal
      $0.spacing = 5
      addSubview($0)
    }
    titleLabel = UILabel().also {
      $0.font = .defaultFont(ofSize: 16, weight: .bold)
      $0.textColor = .black
      containerStackView.addArrangedSubview($0)
    }
    secondaryLabel = UILabel().also {
      $0.font = .defaultFont(ofSize: 14, weight: .bold)
      $0.textColor = .color(named: "mypage_header_secondary_text")
      $0.text = "편집"
      containerStackView.addArrangedSubview($0)
    }
    indicatorView = UIImageView().also {
      $0.image = .image(named: "ic_caret")
      containerStackView.addArrangedSubview($0)
    }
  }

  override func setupConstraints() {
    containerStackView.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(Metric.leading)
      $0.top.equalToSuperview().offset(Metric.topBottom)
      $0.trailing.equalToSuperview().offset(-Metric.leading)
      $0.bottom.equalToSuperview().offset(-Metric.topBottom)
    }
    indicatorView.snp.makeConstraints {
      $0.width.height.equalTo(24)
    }
  }
}
