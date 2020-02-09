//
//  BrowsingHeaderView.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/10.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import SnapKit

final class BrowsingHeaderView: BaseCollectionReusableView {

  // MARK: - Constants

  private struct Metric {
    static let leading = 20.f
    static let topBottom = 10.f
    static let titleHeight = 24.f
  }

  // MARK: - Subviews

  public var titleLabel: UILabel!

  // MARK: - Properties

  static let defaultHeight = 54.f

  override func setupSubviews() {
    titleLabel = UILabel().also {
      $0.font = .defaultFont(ofSize: 20, weight: .bold)
      $0.textColor = .black
      addSubview($0)
    }
  }

  override func setupConstraints() {
    titleLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(Metric.leading)
      $0.top.equalToSuperview().offset(Metric.topBottom)
      $0.trailing.equalToSuperview().offset(-Metric.leading)
      $0.bottom.equalToSuperview().offset(-Metric.topBottom)
    }
  }
}
