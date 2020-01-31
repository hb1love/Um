//
//  PostView.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ShareService
import ReactorKit
import SnapKit

final class PostView: BaseView {

  // MARK: - Constants

  private struct Metric {
    static let topBottonPadding = 10.f
    static let leadingPadding = 29.f
    static let profileSize = 60.f
  }

  // MARK: - Subviews

  @IBOutlet weak var profileThumbnailView: ProfileThumbnailView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var areaLabel: UILabel!

  // MARK: - Properties

  var post: Post? {
    didSet {
      profileThumbnailView.imageUrl = post?.author?.photoUrl
      titleLabel.text = post?.title
      authorLabel.text = post?.author?.nickname
      areaLabel.text = post?.area
    }
  }
}
