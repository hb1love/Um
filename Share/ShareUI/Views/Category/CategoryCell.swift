//
//  CategoryCell.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/08.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ReactorKit
import SnapKit

final class CategoryCell: BaseCollectionViewCell, View {

  // MARK: - Subviews

  var categoryView: CategoryView!

  // MARK: - Properties

  static var defaultWidth = 157.f

  override func setupSubviews() {
    super.setupSubviews()
    categoryView = CategoryView.loadNib()
    contentView.addSubview(categoryView)
  }

  override func setupConstraints() {
    categoryView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  func bind(reactor: CategoryCellReactor) {
    categoryView.category = reactor.category
  }
}
