//
//  TalentCell.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/01.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ReactorKit

final class TalentCell: BaseCollectionViewCell, View {

  // MARK: - Subviews

  var talentView: TalentView!

  // MARK: - Properties

  static var defaultWidth = 48.f

  override func setupSubviews() {
    super.setupSubviews()
    talentView = TalentView.loadNib()
    contentView.addSubview(talentView)
  }

  override func setupConstraints() {
    talentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  func bind(reactor: TalentCellReactor) {
    talentView.member = reactor.member
  }
}
