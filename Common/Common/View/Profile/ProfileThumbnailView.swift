//
//  ProfileThumbnailView.swift
//  Common
//
//  Created by hb1love on 2020/01/27.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

public final class ProfileThumbnailView: BaseView {

  // MARK: - Subviews

  var profileImage: UIImageView!

  // MARK: - Properties

  public var imageUrl: String? {
    didSet {
      guard let imageUrl = imageUrl else { return }
      profileImage.kf.setImage(with: URL(string: imageUrl))
      self.clipsToBounds = true
      self.cornerRadius = 12
    }
  }

  public override func awakeFromNib() {
    super.awakeFromNib()
    self.backgroundColor = .clear
  }

  public override func setupSubviews() {
    profileImage = UIImageView().also {
      addSubview($0)
    }
  }

  public override func setupConstraints() {
    profileImage.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
