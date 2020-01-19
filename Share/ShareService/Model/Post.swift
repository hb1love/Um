//
//  Post.swift
//  ShareService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

public struct Post: Codable {
  var name: String?
  var photoUrl: String?
  var placeId: String?
  var latitude: Double?
  var longitude: Double?
  var distance: Int?
  var address: String?
  var wishList: Bool?
}
