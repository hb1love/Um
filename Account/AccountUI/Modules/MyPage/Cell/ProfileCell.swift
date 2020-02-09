//
//  ProfileCell.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/09.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ReactorKit
import SnapKit

final class ProfileCell: BaseCollectionViewCell, View {

  // MARK: - Subviews



  // MARK: - Properties

  static var defaultHeight = 78.f

  override func setupSubviews() {
    super.setupSubviews()
//    postView = PostView.loadNib()
//    contentView.addSubview(postView)
  }

  override func setupConstraints() {
//    postView.snp.makeConstraints {
//      $0.edges.equalToSuperview()
//    }
  }

  func bind(reactor: ProfileCellReactor) {
//    postView.post = reactor.post
  }
}
