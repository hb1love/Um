//
//  RecommendCategoryCell.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/01.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ReactorKit

final class RecommendCategoryCell: BaseCollectionViewCell, View {

  // MARK: - Constants

  private struct Metric {
    static let topPadding = 13.f
    static let sidePadding = 12.f
    static let bottomPadding = 8.f
  }

  // MARK: - Subviews

  var recommendCategoryView: RecommendCategoryView!

  // MARK: - Properties

  static var defaultWidth = 114.f

  override func setupSubviews() {
    super.setupSubviews()
    contentView.cornerRadius = 10
    let bundle = Bundle(identifier: "com.depromeet.um.shareui")
    let nibName = "RecommendCategoryView"
    let nib = UINib(nibName: nibName, bundle: bundle)
    recommendCategoryView = nib.instantiate(withOwner: self, options: nil).first as? RecommendCategoryView
    contentView.addSubview(recommendCategoryView)
  }

  override func setupConstraints() {
    recommendCategoryView.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(Metric.sidePadding)
      $0.top.equalToSuperview().offset(Metric.topPadding)
      $0.bottom.equalToSuperview().offset(-Metric.topPadding)
      $0.trailing.equalToSuperview().offset(-Metric.sidePadding)
    }
  }

  func bind(reactor: RecommendCategoryCellReactor) {
    recommendCategoryView.category = reactor.category

    contentView.backgroundColor = .orange
  }
}
