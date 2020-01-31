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
    let bundle = Bundle(identifier: "com.depromeet.um.shareui")
    let nibName = "TalentView"
    let nib = UINib(nibName: nibName, bundle: bundle)
    talentView = nib.instantiate(withOwner: self, options: nil).first as? TalentView
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
