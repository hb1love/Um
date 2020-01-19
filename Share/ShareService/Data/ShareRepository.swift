//
//  ShareRepository.swift
//  ShareService
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxSwift

public class ShareRepository: Share {
  private let remote: ShareDataSource

  public init(remote: ShareDataSource) {
    self.remote = remote
  }

  public func feeds() -> Single<[Post]> {
    remote.getFeeds()
  }
}
