//
//  IntroduceCell.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/09.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ReactorKit
import SnapKit

final class IntroduceCell: BaseCollectionViewCell, View {

  // MARK: - Subviews

  var introduceView: UITextView!

  // MARK: - Properties

  static var defaultHeight = 78.f

  override func setupSubviews() {
    super.setupSubviews()
    introduceView = UITextView().also {
      $0.isScrollEnabled = false
      contentView.addSubview($0)
    }
  }

  override func setupConstraints() {
    introduceView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  func bind(reactor: IntroduceCellReactor) {
    reactor.state.map { $0.introduce }
      .distinctUntilChanged()
      .bind(to: introduceView.rx.text)
      .disposed(by: disposeBag)
  }
}
