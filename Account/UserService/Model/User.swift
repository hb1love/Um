//
//  User.swift
//  UserService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Foundation

public struct User: Codable {
  var id: Int
  var name: String
  var avatarURL: URL?
  var bio: String?
  var isPro: Bool

  var shotCount: Int
  var followerCount: Int
  var followingCount: Int

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
    case avatarURL = "avatar_url"
    case bio = "bio"
    case isPro = "pro"
    case shotCount = "shots_count"
    case followerCount = "followers_count"
    case followingCount = "followings_count"
  }
}
