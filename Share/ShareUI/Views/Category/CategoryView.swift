//
//  CategoryView.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/08.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import struct Common.Category
import ShareService
import ReactorKit
import SnapKit

final class CategoryView: BaseView {

  // MARK: - Subviews

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!

  // MARK: - Properties

  var category: Category? {
    didSet {
      nameLabel.text = category?.name
    }
  }
}
