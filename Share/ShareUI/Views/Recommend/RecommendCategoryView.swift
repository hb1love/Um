//
//  RecommendCategoryView.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/01.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import struct Common.Category
import ShareService
import ReactorKit
import SnapKit

final class RecommendCategoryView: BaseView {

  // MARK: - Constants

  private struct Metric {
    static let topBottonPadding = 10.f
    static let leadingPadding = 29.f
    static let profileSize = 60.f
  }

  // MARK: - Subviews

  @IBOutlet weak var firstCategoryLabel: UILabel!
  @IBOutlet weak var secondaryCategoryLabel: UILabel!
  @IBOutlet weak var categoryImageView: UIImageView!
  @IBOutlet weak var postCountLabel: UILabel!
  @IBOutlet weak var talentCountLabel: UILabel!

  // MARK: - Properties

  var category: Category? {
    didSet {
      firstCategoryLabel.text = category?.name
      secondaryCategoryLabel.text = "영상 편집"
      postCountLabel.text = "456개의 게시글"
      talentCountLabel.text = "456명의 재능러"
    }
  }
}
