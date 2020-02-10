//
//  ProfileView.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/10.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ShareService
import ReactorKit
import SnapKit

final class ProfileView: BaseView {

  // MARK: - Constants

  private struct Metric {
    static let topBottonPadding = 10.f
    static let leadingPadding = 29.f
    static let profileSize = 60.f
  }

  // MARK: - Subviews

  @IBOutlet weak var profileThumbnailView: ProfileThumbnailView!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var areaLabel: UILabel!

  // MARK: - Properties

  var member: Member? {
    didSet {
      profileThumbnailView.imageUrl = member?.photoUrl
      nicknameLabel.text = member?.nickname
      areaLabel.text = "강남"
    }
  }
}
