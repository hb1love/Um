//
//  ShareRemoteDataSource.swift
//  ShareService
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

final class ShareRemoteDataSource: ShareDataSource {

  private let networking: ShareNetworking

  init(networking: ShareNetworking) {
    self.networking = networking
  }

  func getFeeds() -> Single<[Post]> {
    networking
      .request(.feed)
      .map([Post].self)
  }
}
