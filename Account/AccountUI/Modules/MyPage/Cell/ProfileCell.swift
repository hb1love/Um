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

  var profileView: ProfileView!

  // MARK: - Properties

  static var defaultWidth = 300.f
  static var defaultHeight = 100.f

  override func setupSubviews() {
    super.setupSubviews()
    profileView = ProfileView.loadNib()
    contentView.addSubview(profileView)
  }

  override func setupConstraints() {
    profileView.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.width.equalTo(ProfileCell.defaultWidth)
    }
  }

  func bind(reactor: ProfileCellReactor) {
    profileView.member = reactor.member
  }
}
