//
//  TalentView.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/01.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ShareService
import ReactorKit
import SnapKit

final class TalentView: BaseView {

  // MARK: - Constants

  private struct Metric {
    static let topBottonPadding = 10.f
    static let leadingPadding = 29.f
    static let profileSize = 60.f
  }

  // MARK: - Subviews

  @IBOutlet weak var profileThumbnailView: ProfileThumbnailView!
  @IBOutlet weak var authorLabel: UILabel!

  // MARK: - Properties

  var member: Member? {
    didSet {
      profileThumbnailView.imageUrl = member?.photoUrl
      authorLabel.text = member?.nickname
    }
  }
}
